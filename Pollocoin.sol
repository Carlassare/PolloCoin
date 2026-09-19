// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";


/// @title Pollocoin (POLLO)
/// @notice Token ERC20 con suministro fijo para Polygon.
/// @dev Construido sobre OpenZeppelin Contracts v5.
contract Pollocoin is
    ERC20,
    ERC20Burnable,
    ERC20Pausable,
    Ownable,
    ReentrancyGuard
{

    using SafeERC20 for IERC20;


    // =========================
    // ERRORES PERSONALIZADOS
    // =========================

    error InvalidTreasury();
    error CannotRecoverOwnToken();
    error NoNativeBalance();


    // =========================
    // EVENTOS
    // =========================

    event ERC20Recovered(
        address indexed token,
        uint256 amount
    );

    event NativeRecovered(
        uint256 amount
    );


    // =========================
    // VARIABLES
    // =========================

    /// @notice Supply máximo fijo.
    uint256 public constant MAX_SUPPLY =
        1_000_000_000 * 10 ** 18;


    /// @notice Dirección que recibe los tokens iniciales.
    address public immutable treasury;



    // =========================
    // CONSTRUCTOR
    // =========================

    /**
     * @param treasuryAddress Dirección de la tesorería inicial.
     */
    constructor(address treasuryAddress)
        ERC20("Pollocoin", "POLLO")
        Ownable(msg.sender)
    {

        if (treasuryAddress == address(0)) {
            revert InvalidTreasury();
        }


        treasury = treasuryAddress;


        // Crea los 1.000 millones de POLLO
        // directamente en la tesorería.
        _mint(
            treasuryAddress,
            MAX_SUPPLY
        );
    }
    // =========================
    // CONTROL DE PAUSA
    // =========================

    /**
     * @notice Pausa todas las transferencias de POLLO.
     * @dev Solo el propietario puede ejecutar esta función.
     */
    function pause()
        external
        onlyOwner
    {
        _pause();
    }


    /**
     * @notice Reactiva las transferencias de POLLO.
     * @dev Solo el propietario puede ejecutar esta función.
     */
    function unpause()
        external
        onlyOwner
    {
        _unpause();
    }



    // =========================
    // RECUPERACIÓN DE TOKENS
    // =========================

    /**
     * @notice Recupera otros tokens ERC20 enviados accidentalmente
     * al contrato.
     *
     * @dev No permite recuperar POLLO para evitar una puerta trasera.
     *
     * @param token Dirección del token ERC20.
     * @param amount Cantidad a recuperar.
     */
    function recoverERC20(
        address token,
        uint256 amount
    )
        external
        onlyOwner
        nonReentrant
    {

        if (token == address(this)) {
            revert CannotRecoverOwnToken();
        }


        IERC20(token).safeTransfer(
            owner(),
            amount
        );


        emit ERC20Recovered(
            token,
            amount
        );
    }



    // =========================
    // RECUPERACIÓN DE POL NATIVO
    // =========================

    /**
     * @notice Recupera POL enviados accidentalmente al contrato.
     */
    function recoverNative()
        external
        onlyOwner
        nonReentrant
    {

        uint256 balance =
            address(this).balance;


        if (balance == 0) {
            revert NoNativeBalance();
        }


        (bool success, ) =
            payable(owner()).call{
                value: balance
            }("");


        require(
            success,
            "Native transfer failed"
        );


        emit NativeRecovered(
            balance
        );
    }



    // =========================
    // COMPATIBILIDAD OPENZEPPELIN V5
    // =========================

    /**
     * @dev Integración requerida por ERC20Pausable en OpenZeppelin v5.
     */
    function _update(
        address from,
        address to,
        uint256 value
    )
        internal
        override(
            ERC20,
            ERC20Pausable
        )
    {
        super._update(
            from,
            to,
            value
        );
    }
    // =========================
    // RECEPCIÓN DE POL
    // =========================

    /**
     * @notice Permite que el contrato reciba POL.
     * @dev Necesario para poder recuperar POL enviados accidentalmente.
     */
    receive()
        external
        payable
    {}

}