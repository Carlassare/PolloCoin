# PolloCoin (POLLO) — Whitepaper

_Version 1.0_

## 1. Introduction

PolloCoin (POLLO) is a meme token deployed on the Polygon network. It was created as a marketing and community-building product to support **Fides Token** and **Fides Exchange Holdings LLC**, and it is offered as a product of that company.

PolloCoin has no promise of price appreciation, profit, dividends, or return of any kind. It is a community and marketing token, and holding it does not represent equity, a security, or any ownership stake in Fides Exchange Holdings LLC or any of its affiliates.

## 2. Purpose

The primary purpose of PolloCoin is to:

- Serve as a fun, easy-to-adopt entry point into the broader **Fides** ecosystem.
- Act as a marketing and advertising vehicle to raise awareness of Fides Token and Fides Exchange Holdings LLC.
- Help grow and engage the Fides community by giving it a lighthearted, shareable asset.

PolloCoin is not intended to function as a utility token, a governance token, or a store of value in itself. Its value, if any, is driven entirely by community adoption and market interest, not by underlying cash flows, revenue share, or contractual rights.

## 3. Token Details

| Parameter | Value |
|---|---|
| Token Name | Pollocoin |
| Symbol | POLLO |
| Blockchain | Polygon (Chain ID 137) |
| Token Standard | ERC-20 |
| Total Supply | 1,000,000,000 POLLO |
| Supply Model | Fixed — minted once at deployment, no further minting function exists |
| Decimals | 18 |
| Contract Address | `0x7ed8C41dB53f3337ff0b1B0E84e48FDF32B4847C` |

The full supply was minted at deployment directly to a treasury address. There is no minting function in the contract, meaning the total supply of 1,000,000,000 POLLO can never be increased.

## 4. Smart Contract Features

The PolloCoin contract is built on audited, widely-used OpenZeppelin v5 building blocks:

- **ERC20 / ERC20Burnable** — standard transfer functionality, plus the ability for any holder to voluntarily burn their own tokens, permanently reducing supply.
- **ERC20Pausable** — allows the contract owner to pause and unpause all token transfers, intended strictly as an emergency safety mechanism (e.g., in the event of a discovered vulnerability).
- **Ownable** — defines a privileged owner role for administrative functions.
- **ReentrancyGuard** — protects state-changing functions from reentrancy attacks.
- **Recovery functions** — allow the owner to recover other ERC-20 tokens or native POL accidentally sent to the contract address. These functions explicitly cannot be used to withdraw or recover POLLO itself, closing off any possibility of the owner draining the community's tokens through this mechanism.

## 5. Governance & Security

To reduce single-point-of-failure risk, ownership of the PolloCoin contract has been transferred from a single wallet to a **2-of-3 multisignature wallet (Safe)**, deployed on Polygon at:

```
0xb61a908401a68f60C403675995b42089ccb70D57
```

Any privileged action on the contract (pausing/unpausing, recovering stray tokens) now requires confirmation from at least two of the three designated signers. This structure is intended to prevent unilateral action by any single individual.

As the project matures and its stability is demonstrated to the community, the team intends to evaluate renouncing ownership of the contract entirely, which would permanently remove the ability for anyone — including the multisig signers — to pause the contract or use the recovery functions.

## 6. Relationship to Fides

PolloCoin is a product of Fides Exchange Holdings LLC and exists to support the visibility and community growth of Fides Token and the broader Fides ecosystem. It is a marketing initiative first and foremost, not a core financial product of Fides Exchange Holdings LLC.

## 7. Risks & Disclaimer

- PolloCoin is a meme token with no intrinsic utility, revenue backing, or guaranteed value.
- Cryptocurrency assets are highly volatile and speculative. Participants should only engage with amounts they can afford to lose entirely.
- This document does not constitute financial, investment, legal, or tax advice. Nothing in this whitepaper should be construed as an offer or solicitation to buy or sell any security.
- Smart contracts, even when built on well-audited components, carry inherent technical risk. No warranty is made regarding the absolute security of the contract.
- This document may be updated over time as the project evolves. The most current version will always be available in this repository.

## 8. Contact

- Website: www.fides-ex.com
- Contact email: support@fides-exchange.com
