# Components & Interfaces (MVP)

This document describes system components, their responsibilities, and how they interact.

## Components

### 1) User Wallet (EOA)
**Role:** initiates purchases and receives tokens.  
**Trust:** user-controlled; can be malicious (bots, sybil).

### 2) Frontend (Web UI)
**Role:** builds transactions, shows state, reads events.  
**Trust boundary:** not trusted for enforcing rules. All rules must be enforced onchain.

### 3) TokenSale Contract (Onchain)
**Role:** core sale logic:
- validates sale state (active/paused/time windows)
- enforces caps (total sold / per wallet)
- receives payments
- transfers tokens to buyers
- emits events

### 4) Token Contract (ERC-20)
**Role:** token accounting and transfers.  
**Trust assumption:** token behaves according to ERC-20, no hidden transfer restrictions (or they are documented).

### 5) Treasury (Wallet / Multisig)
**Role:** receives funds or withdraws collected funds.  
**Trust boundary:** must be protected (multisig preferred).

### 6) Governance / Admin
**Role:** changes critical parameters and triggers pause/unpause.  
**Trust boundary:** highest-risk actor; must have constraints + transparency.

### 7) Offchain Monitor (Optional)
**Role:** watches events, alerts on anomalies (bot floods, weird params, paused state).  
**Trust:** informational only; must not be required for correctness.

---

## Interfaces (How components talk)

### User -> TokenSale
- buy() with ETH payment OR buy(amount) with stablecoin allowance
- receives tokens via transfer

### Frontend -> Blockchain
- reads state variables (price, caps, paused)
- reads events (Purchase, Paused, ParamsUpdated)

### Governance/Admin -> TokenSale
- setPrice(), setCaps(), setTreasury() (names are examples)
- pause()/unpause()
- (optional) upgradeTo() if proxy

### TokenSale -> Token
- transfer() to user
- optional: transferFrom() if sale contract pulls tokens from treasury

### TokenSale -> Treasury
- direct forward of payments OR withdraw pattern

---

## Trust Boundaries (Critical)
1) Frontend is NOT trusted. Rules are enforced only in TokenSale contract.
2) Admin/Governance is a trusted actor with the biggest abuse potential.
3) Users are untrusted; assume bots and adversarial behavior.
4) External token contract is a dependency; document assumptions about its behavior.
5) Offchain monitoring is best-effort only (cannot be a security requirement).

