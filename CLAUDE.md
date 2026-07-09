# CLAUDE.md — working on this repo

This repo is a **reveal.js talk**: "rucio-mcp — one MCP server for the Rucio
community" (Rucio community discussion, 2026-07-09, Giordon Stark). It is
public and auto-deploys to GitHub Pages. `README.md` has the audience-facing
overview; this file is for whoever edits it next.

It is a **15-minute pitch**: 12 min talk + 3 min live demo against
https://rucio-mcp.af.uchicago.edu. The goal is convergence: convince the Rucio
community (Martin Barisits' discussion group, Cédric Serfon / Belle II, EIC and
DUNE folks) to co-own one MCP server rather than maintain parallel forks. The
tone is welcoming and appreciative of the parallel efforts, honest about the
maintenance question, never competitive.

## How to work on it

- It's already scaffolded. **Don't re-scaffold.** Edit `presentation.html`
  incrementally (one or a few slides at a time), never rewrite the whole file.
- Facts on the slides were verified against the rucio-mcp repo (v0.6.0: 44
  tools, presets atlas/cms/dune/escape, Belle II PR #38, nomenclature issues
  #30/#31/#32) and Cédric Serfon's 2025-11-05 Belle II report. Verify before
  changing any number or claim.

## The edit → verify loop (do this every change)

1. Edit `presentation.html` / `styles.css`.
2. `pixi run check` — must report **no overflow** (slides are fixed 1280×720).
3. `pixi run screenshots` and **look at every changed slide**.
4. Known gotcha: the puppeteer-downloaded Chrome can fail macOS signature
   validation if the installer's extractor mangles it ("Killed: 9"). Fix by
   downloading the zip from `storage.googleapis.com/chrome-for-testing-public`
   and unzipping manually into `~/.cache/puppeteer/chrome/<version>/`.
   decktape needs `--chrome-path` pointed at that binary (see pixi task).

## Conventions (match these)

- **Theme:** dark "control-room" — ink navy (`#0d1524`) background, electric
  cyan (`#4fd6e8`) primary, warm amber (`#f2b34c`) secondary, green
  (`#6fdd8b`) for "works today". All in `styles.css` CSS variables.
  **Font sizes in `pt`**, never px/em/rem (fixed-size slides).
- **Fonts:** Space Grotesk (headings), Inter (body), JetBrains Mono (tool
  names, kickers, terminal boxes) via Google Fonts `@import`.
- **Recurring motif:** `.terminal` boxes (fake terminal windows) for prompts,
  configs, and demo material. `.card` grids for parallel items; `.callout`
  (amber = honest caveat / ask, cyan = the point) for the slide's takeaway.
- **reveal 5.1** from CDN, Notes plugin only, `slideNumber: 'c/t'`,
  fixed 1280×720, `transition: 'fade'`. No Chart.js.
- **Vertical stack:** the final horizontal position is a stack — `#close` on
  top, backups (`#backup-bridge`, `#backup-tools`) below via down-arrow.
  `.reveal .slides section.stack { padding: 0 }` is load-bearing: without it,
  nested slides double-pad and clip off-canvas.
- **Build stamp:** fixed bottom-left `id="buildstamp"` reads `dev` locally;
  `deploy.yml` rewrites it at publish time. Keep the `id` and the `dev`
  default so the sed anchor keeps working.
- **Em-dash policy (humanized):** prose uses commas/colons/semicolons/periods.
  Em-dashes only in window-chrome labels and metadata, not sentences.
- **Speaker notes:** every slide has an `<aside class="notes">`, conversational
  first-person spoken cadence. The demo slide's notes carry the demo plan and
  fallbacks — keep them current if the demo changes.
- **Honesty tone:** deployed vs pending is kept accurate (Belle II preset is
  "PR open", not done; nomenclature exists only for ATLAS). Don't inflate.

## Commits & deploy

- Commit/push to **`main`**. Conventional Commits.
- End commit messages with `Assisted-by: Claude (Anthropic)`.
- Pushing `main` auto-deploys via `.github/workflows/deploy.yml`. Verify the
  run is green. Pages source: **Settings → Pages → GitHub Actions** (one-time).
