flowchart LR
  User((Buyer)) -->|ETH/USDC| Sale[TokenSale Contract]
  Sale -->|mints/transfers| Token[ERC20 Token]
  Admin((Admin)) -->|pause/upgrade| Sale
  Frontend[Frontend] --> Sale

