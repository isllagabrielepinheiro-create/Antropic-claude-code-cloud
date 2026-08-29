---
name: status-report
description: Generate a polished status report — what shipped, what's in progress, blockers/risks, and next steps — published as a styled HTML Artifact. Use whenever the user asks for a "status report", "status update", "progress report", "weekly/monthly update", "standup summary", "project update", or wants to summarize progress on work or a project for a team, manager, or stakeholder, even if they don't say the words "status report" outright.
---

# Status Report

A status report tells someone who wasn't in the room what happened, what's next, and what needs their attention. The value is in the editing, not the collecting — a wall of raw commit messages or task titles is not a status report, it's a log. Turn raw activity into a short, scannable narrative a busy reader can absorb in under a minute.

## 1. Nail down the scope

Before writing anything, make sure you know:
- **What** the report covers — a specific project, a repo, a sprint, "everything I did this week"
- **Time period** — since when? (a date, "this week", "since the last report")
- **Audience** — a manager, a client, the whole team, personal record-keeping. This changes tone and how much detail to include (a client doesn't need internal implementation notes; a teammate might).

If the user's request already answers these (e.g. "status report for the migration project, this week, for my manager"), don't re-ask — proceed straight to gathering material. Only ask about what's genuinely missing, and prefer a reasonable default (this week, this repo, internal audience) over blocking on a question when the answer is obvious from context.

## 2. Gather the raw material

Pull from whatever sources are relevant and available — don't ask the user to hand-type things you can gather yourself:

- **This conversation** — if the report covers work just done in this session, you already have it.
- **Git history** — if it's a code project, run `scripts/git_activity.sh` from the repo root (see the script's `-h` for options) to get commits and changed-file stats over the period. Treat this as raw material, not the report itself — group and summarize it, don't paste a commit log into the artifact.
- **Issues/PRs** — if GitHub tools are available, pull open/closed/merged items for the period instead of guessing at what happened.
- **The user directly** — ask for bullet points on anything you can't observe yourself (decisions made in meetings, blockers only they know about, priorities for next period).

## 3. Organize into a narrative, not a dump

Structure around these sections, dropping any that end up empty rather than forcing content into them:

- **Summary** — 1–3 sentences: the headline, before the details. What's the one thing the reader needs to know if they read nothing else?
- **Done** — what shipped or completed since the last report. Group related items into one line rather than listing every commit.
- **In progress** — what's actively being worked, with a rough sense of how far along it is.
- **Blocked / risks** — what's stuck and why, and what (if anything) would unblock it. Never bury a blocker below routine updates — a reader skimming for red flags should find this section fast.
- **Next up** — what's planned next, so the reader knows what's coming without having to ask.

Write entries as short, concrete bullets ("Migrated auth to JWT, deployed to staging") rather than vague ones ("Worked on auth"). If there's a genuinely quantifiable metric behind the work (tasks closed, tests passing, percent complete), a small stat or progress indicator earns its place in the layout — but don't invent numbers that aren't backed by real data just to fill space.

## 4. Build the Artifact

This is a finished deliverable with an audience, so it belongs published, not left as chat text.

1. Load the `artifact-design` skill before writing any HTML — it governs layout, spacing, and theme-awareness, and applies here exactly as it would to any other artifact.
2. If a chart or progress visualization is genuinely warranted by real data (e.g. a burndown, tasks-done-over-time), load `dataviz` too rather than improvising colors and axes by hand.
3. Write the page: a title naming the project and period (e.g. "Migration – Week 12", not the generic "Status Report"), a date/period line near the top, and the sections from step 3.
4. Publish with the `Artifact` tool. Pick a favicon that fits the project, and give the artifact a one-sentence `description`.
5. Hand the user the link rather than also pasting the full report as chat text — a second copy in chat undercuts the point of having a shareable page.

## Recurring reports

If the user wants this on a cadence ("send me a status report every Friday"), that's a scheduling need, not something to build into the report itself — offer to set up a Routine (`create_trigger`) that re-runs this same workflow on schedule.
