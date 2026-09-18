# PolloCoin (POLLO)

PolloCoin is a meme token on the Polygon network, created to support and promote **Fides Exchange Token** and **Fides Exchange Holdings LLC**, of which it is a product.


## Token Info

| | |
|---|---|
| **Name** | Pollocoin |
| **Symbol** | POLLO |
| **Network** | Polygon (Chain ID 137) |
| **Total Supply** | 1,000,000,000 POLLO (fixed) |
| **Contract Address** | `0x7ed8C41dB53f3337ff0b1B0E84e48FDF32B4847C` |
| **Decimals** | 18 |
| **Standard** | ERC-20 (OpenZeppelin v5) |

## Verified On

- [PolygonScan](https://polygonscan.com/address/0x7ed8C41dB53f3337ff0b1B0E84e48FDF32B4847C#code)
- Sourcify
- Blockscout (Polygon)

## Governance

Contract ownership has been transferred to a **2-of-3 multisig (Safe)**:

```
0xb61a908401a68f60C403675995b42089ccb70D57
```

Any privileged action (pause/unpause, recovering mistakenly sent tokens, etc.) now requires the approval of at least 2 out of 3 designated signers, rather than a single wallet.

## Contract Features

- Fixed supply, minted once at deployment to the treasury address.
- `Burnable` — token holders can burn their own tokens.
- `Pausable` — the owner (the multisig) can pause/unpause transfers in case of emergency.
- `ReentrancyGuard` — protection on state-changing recovery functions.
- Recovery functions to rescue other ERC-20 tokens or native POL accidentally sent to the contract (cannot be used to recover POLLO itself).

## Documentation

See [WHITEPAPER.md](./WHITEPAPER.md) for details on the project's purpose, tokenomics, and disclaimers.

## Links

- Website: https://www.fides-ex.com
- Twitter/X: @FidesExchange
- Mail: support@fides-exchange.com

## License

MIT

