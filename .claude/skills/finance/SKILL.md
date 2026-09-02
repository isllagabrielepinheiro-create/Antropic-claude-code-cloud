---
name: finance
description: Analyze financial data and produce budgets, financial-statement analysis, or stakeholder financial reports — from spreadsheets/CSV, PDFs (bank/brokerage statements, DRE/balance sheets), numbers typed directly in chat, or a connected sheet. Use whenever the user shares or mentions a bank statement, expense report, budget, income statement/DRE, balance sheet, cash flow statement, burn rate, runway, P&L, financial ratios, or asks to categorize spending, build a budget, analyze company financials, or report financial results to a team/investors/stakeholders — even if they don't use the word "finance" itself.
---

# Finance

Financial work fails in two different ways: garbled numbers (a misread PDF table, a spreadsheet formula slipping, a category that silently swallows real spending) and garbled meaning (a ratio calculated but never explained, a report that buries the one number that actually matters). Get the arithmetic right first, then make sure a non-finance reader understands what it means.

## Figure out which of these you're doing

Most requests fall into one of three shapes. Identify which one before diving in — ask only if it's genuinely unclear from context — since each ends in a different kind of output:

- **A. Personal/team budget & spending** — categorize transactions, see where money went, compare to a budget or goal.
- **B. Financial statement analysis** — read a company's DRE/income statement, balance sheet, or cash flow and answer questions about health, trends, or ratios.
- **C. Stakeholder financial report** — a periodic report (revenue, costs, burn, runway, etc.) meant to be shared with a team, investors, or leadership.

They share the data-gathering step below; the sections after that split by shape. A single request can blend two of these (e.g. quarterly numbers plus a runway question) — when it does, pull the relevant instructions from each shape rather than forcing everything into one. That usually means using the analysis steps of one shape and skipping the delivery mechanics (artifact, chart, recurring schedule) of another unless the user actually asked for that delivery format.

## 1. Get real numbers, not guesses

- **Spreadsheet/CSV** — read directly, or use the `xlsx` skill when formulas, formatting, or a spreadsheet deliverable are involved.
- **PDF** (bank/brokerage statement, formal financial statement) — use the `pdf` skill to extract text/tables rather than eyeballing a rendered page; statement PDFs often have tables that look misaligned visually but parse cleanly.
- **Numbers typed in chat** — treat as authoritative, but restate them back before computing anything with them, so a typo doesn't propagate silently into every downstream number.
- **A connected source (Sheets/Drive/etc.)** — pull the live data rather than asking the user to paste it in by hand.

Never invent, round, or estimate a figure that should come from the data. If something is genuinely missing, say so explicitly rather than filling the gap with a plausible-looking placeholder — a visible blank is safer than a wrong number that looks confident.

**Sensitive data**: bank and brokerage statements carry account numbers, routing numbers, and full names. If any of this ends up somewhere that could be shared or published (an Artifact link, a document), mask account/routing numbers (e.g. `••••4821`) unless the task specifically needs the full number.

## 2A. Personal/team budget & spending

1. Categorize each transaction (groceries, rent, subscriptions, etc.). Reuse categories already present in the data; otherwise apply common-sense categories and show the categorization so the user can correct anything you got wrong — a merchant name alone is sometimes ambiguous (a charge from "Amazon" could be almost any category).
2. Total by category and by period (weekly/monthly), and compare against a stated budget or goal if the user has one.
3. Surface what actually matters — categories that grew, anything unusual or one-off versus recurring, whether they're on track — rather than just re-stating the totals back at them.

## 2B. Financial statement analysis

1. Pull the figures the statement actually reports. Don't compute a ratio from a number that isn't there — ask for it, or state plainly that it's unavailable.
2. Compute the ratios relevant to the question asked. `references/financial-ratios.md` has the standard formulas and what a healthy range typically looks like — treat those ranges as context, not a verdict, since "healthy" depends heavily on industry and stage.
3. Look at the trend, not just a single period, whenever more than one period is available — a ratio in isolation says far less than its direction of travel.
4. State findings in plain language a non-accountant can follow (e.g. "gross margin fell from 42% to 37%, mostly because COGS grew faster than revenue"), not just the bare number.
5. This is analysis, not professional advice — flag when something touches tax, legal, or audit judgment as belonging with a qualified professional rather than giving a definitive answer here.

## 2C. Stakeholder financial report

This is a status report for money — the same instinct applies: a reader who wasn't in the room should get the headline number, the trend, and anything that needs their attention, in under a minute.

1. Gather the period's figures (see step 1) and, if this is a recurring report, the prior period's for comparison.
2. Lead with the number(s) that matter most to this audience — revenue, burn, runway — not a wall of every line item.
3. If there's a real trend across periods, a small chart earns its place; load the `dataviz` skill before building one so it follows a coherent visual system instead of default library styling.
4. Build the report as a styled HTML Artifact: load `artifact-design` before writing any HTML. Give the page a title that's the report's own name (the company/team plus report type, not the generic "Financial Report"), and put the period on its own line below the title rather than appended to it.
5. Publish with the `Artifact` tool, mask any sensitive account-level data per step 1, and hand the user the link rather than also pasting the full report as chat text.

## Recurring reports

If the user wants this on a cadence ("send this every month-end"), that's a scheduling need, not something to build into the report itself — offer to set up a Routine (`create_trigger`) that re-runs the relevant workflow above on schedule.
