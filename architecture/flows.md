# System Flows (MVP)

This document describes the main flows of the token sale system.

## Flow 1: Deploy
1) Deploy Token (or use existing token)
2) Deploy TokenSale contract
3) Configure:
   - sale token
   - treasury wallet
   - price / rate
   - caps (total / per wallet)
   - start/end timestamps (optional)

## Flow 2: User Buys Tokens
1) User sends payment (ETH / stablecoin)
2) Contract validates:
   - sale is active
   - caps not exceeded
   - correct price rules
3) Contract transfers tokens to user
4) Contract logs purchase event

## Flow 3: Pause / Incident Response
1) Admin detects problem (bots, exploit, misconfiguration)
2) Admin triggers pause
3) Purchases are blocked while paused
4) Events show pause state publicly

## Flow 4: Update Parameters
1) Admin proposes parameter update
2) Update is applied through governance rules
3) Contract emits events describing changes

## Flow 5: Withdraw Funds (Treasury)
1) Treasury withdraws collected funds
2) Withdrawal is logged
3) Optional limits:
   - only after sale ends
   - multi-sig approval

