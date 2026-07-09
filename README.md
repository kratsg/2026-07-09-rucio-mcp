# rucio-mcp — one MCP server for the Rucio community

Slides for the
[**Rucio community discussion**](https://indico.cern.ch/event/1701185/)
(Indico: "Rucio Meeting", 2026-07-09) by Giordon Stark
(UC Santa Cruz / SCIPP): a 15-minute pitch (12 min talk + 3 min live demo) for
converging on a single, community-maintained MCP server for Rucio instead of
per-experiment implementations.

**▶ View the deck:** https://kratsg.github.io/2026-07-09-rucio-mcp/

The talk covers the parallel MCP efforts (Belle II's PoC by Cédric Serfon, the
EIC/ePIC server used by EIC and DUNE, and rucio-mcp), what
[rucio-mcp](https://github.com/kratsg/rucio-mcp) provides today, the OAuth
bridge and security posture, the hosted multi-experiment deployment at
https://rucio-mcp.af.uchicago.edu, and an honest menu of maintenance/governance
options for the community to pick from.

## What's here

| Path                            | What it is                                                    |
| ------------------------------- | ------------------------------------------------------------- |
| `presentation.html`             | The deck (reveal.js 5.1, loaded from CDN — no build step)      |
| `styles.css`                    | Dark "control-room" theme (CSS variables, `pt` font sizing)    |
| `scripts/`                      | Overflow checker + in-browser text editor (Node/Puppeteer)     |
| `pixi.toml`                     | Environment + tasks (`check`, `screenshots`, `pdf`, `serve`)   |
| `.github/workflows/deploy.yml`  | Auto-publishes to GitHub Pages on push to `main`               |

## View it

- **Online:** the GitHub Pages link above (always reflects `main`).
- **Locally:** open `presentation.html` in a browser (reveal.js comes from a
  CDN, so you need a network connection), or `pixi run serve`.
- **Speaker notes:** press **`S`** in the browser for speaker view. Every slide
  has notes, including the demo plan and fallback prompts.
- **Backup slides:** press the down arrow on the final slide (bridge sequence
  end-to-end, full tool inventory).

## Edit it

```bash
pixi install && pixi run install   # one-time: node env + puppeteer/decktape

# after editing presentation.html / styles.css:
pixi run check         # flag any slide whose content exceeds 1280x720
pixi run screenshots   # capture every slide for visual review
pixi run pdf           # export slides.pdf
pixi run edit          # click-to-edit text in the browser, saves back to HTML
```

## Deploy

Pushing to `main` publishes `presentation.html` (as `index.html`) +
`styles.css` to GitHub Pages and stamps the build (`<short-sha> · <date>` in
the bottom-left corner; reads `dev` locally). One-time setup: repo **Settings →
Pages → Source: GitHub Actions**.

## Credits

Slides AI-assisted by Claude (Anthropic). Built with
[reveal.js](https://revealjs.com). The Belle II / EIC context comes from Cédric
Serfon's Belle II report (Nov 2025) and
[eic/rucio-eic-mcp-server](https://github.com/eic/rucio-eic-mcp-server).
