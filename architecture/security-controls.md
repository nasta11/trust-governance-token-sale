# Security Controls (MVP)

This document lists practical security controls for a token sale system.

## 1) Access Control
- Owner / Admin role controls critical operations
- Role separation is preferred (admin vs treasury)

## 2) Pause Switch (Emergency Stop)
- Ability to pause buying/selling in critical situations
- Pause must be visible and logged

## 3) Supply & Sale Limits
- Total tokens for sale should be capped
- Max per wallet to reduce whale dominance
- Optional: rate limit per block / per minute

## 4) Safe Payment Flow
- Use checks-effects-interactions pattern
- Prefer pull payments (withdraw pattern) where possible
- Avoid complex external calls inside purchase flow

## 5) Parameter Safety
- Validate important parameters on set/update:
  - token address
  - sale price
  - start/end time
  - treasury address

## 6) Event Logging (Transparency)
- Emit events for:
  - purchases
  - refunds (if exist)
  - parameter changes
  - pause/unpause
  - upgrades (if proxy)

## 7) Upgrade Safety (If Upgradable)
- Upgrades only through governance
- Add upgrade delay (timelock) if possible
- Ability to freeze upgrades after launch

## 8) Testing & Monitoring
- Unit tests for critical flows
- Minimal scripts to simulate buys and edge cases
- Monitor onchain events for abnormal behavior

