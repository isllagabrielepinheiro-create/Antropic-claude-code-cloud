# Financial ratio cheat sheet

Standard formulas for financial-statement analysis (shape B in SKILL.md). Ranges below are rough orientation, not thresholds — always weigh them against the company's own history and its industry, not this list in isolation.

## Profitability

| Ratio | Formula | Reads as |
|---|---|---|
| Gross margin | (Revenue − COGS) / Revenue | How much of each sale is left after direct production cost, before overhead. |
| Operating margin | Operating income / Revenue | Profitability from core operations, before interest and tax. |
| Net margin | Net income / Revenue | What's actually left after everything, including interest and tax. |

A gross margin that's stable while operating margin falls usually means overhead (SG&A) is growing faster than sales — worth naming explicitly rather than leaving as a bare number.

## Liquidity — can it cover near-term obligations?

| Ratio | Formula | Reads as |
|---|---|---|
| Current ratio | Current assets / Current liabilities | Can short-term assets cover short-term debts? Below 1 means they can't, on paper. |
| Quick ratio | (Current assets − Inventory) / Current liabilities | Same question, excluding inventory (which isn't always quick to convert to cash). |

## Leverage — how much is debt-funded?

| Ratio | Formula | Reads as |
|---|---|---|
| Debt-to-equity | Total debt / Total shareholder equity | How much the company is leveraged relative to owner capital. Higher isn't automatically bad — capital-intensive industries run higher by nature. |
| Interest coverage | EBIT / Interest expense | How comfortably operating profit covers interest payments. Below ~1.5 is usually a flag. |

## Efficiency — how well are assets used?

| Ratio | Formula | Reads as |
|---|---|---|
| Inventory turnover | COGS / Average inventory | How many times inventory is sold and replaced over the period. Low turnover can mean overstocking or slow sales. |
| Days sales outstanding (DSO) | (Accounts receivable / Revenue) × days in period | Average days to collect payment after a sale. Rising DSO can signal collection problems before cash flow shows it. |

## Returns

| Ratio | Formula | Reads as |
|---|---|---|
| Return on equity (ROE) | Net income / Shareholder equity | Return generated on owners' invested capital. |
| Return on assets (ROA) | Net income / Total assets | How efficiently total assets generate profit, independent of how they're financed. |

## Startup / cash-runway metrics

Common in stakeholder reports (shape C) even when a full statement isn't available:

| Metric | Formula | Reads as |
|---|---|---|
| Burn rate | (Cash at start of period − Cash at end of period) / months in period | Average monthly cash outflow. Use *net* burn (after any revenue) unless the user asks for gross. |
| Runway | Ending cash balance / Monthly burn rate | Months left at the current burn rate before cash runs out. Use the *current* (ending) cash balance, not the balance from the start of the period — plugging in the start-of-period figure overstates runway. State the burn rate it's based on too — runway is only as reliable as that assumption, and it changes the moment burn does. |

## A note on presenting these

Always show the inputs alongside the ratio (e.g. "Current ratio: 1.4 (Current assets $420k / Current liabilities $300k)"), not just the final number — it lets the reader sanity-check the calculation and makes it obvious which underlying figure moved when the ratio changes next period.
