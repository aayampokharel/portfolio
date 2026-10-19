# Portfolio — Aayam Pokharel

Personal portfolio site, rebuilt as a **single hand-written `index.html`** — no frameworks, no build step, no Flutter runtime.

**Live:** https://aayampokharel.github.io/portfolio/

## What's inside

- **Hero** — my own photo (`Photos/me.jpeg`, square-cropped and compressed to 23 KB WebP) inside a rotating gradient ring, and a terminal that types `go run main.go` before revealing the tagline: *Building backend systems, one goroutine at a time.*
- **About / Stack / Experience / Work / Stats / Contact** — content sourced from my GitHub profile: Go backend work at AsterGaze Technologies, SafalTopper (live, 100+ students), and DocSniff (permissioned consortium blockchain — PoW + PBFT, raw-TCP P2P, RSA + Merkle trees).
- **Featured projects** — SafalTopper and DocSniff with screenshots, plus 7 more open-source repos.
- **GitHub stats** — live streak and stats cards, lazy-loaded.
- **Micro-interactions** — scroll reveals, mouse-spotlight project cards, active-section nav highlight, and a goroutine counter in the footer.

## Tech

| Layer | Choice |
|---|---|
| Markup / style / logic | Plain HTML5 + CSS3 + vanilla JS — everything in one file (~46 KB) |
| Fonts | Space Grotesk · Inter · JetBrains Mono (Google Fonts) |
| Icons | skillicons.dev SVG logos + official inline brand marks (no emoji stand-ins) |
| Images | WebP with PNG/JPEG fallbacks — every local image ≤ 60 KB |

## Structure

```
index.html                     ← the whole site
favicon.png
assets/Photos/optimized/       ← WebP + fallbacks actually used by the page
assets/Photos/                 ← source photos (heavy originals live here)
```

## Preview locally

```bash
cd build/web
python3 -m http.server 8000
# open http://localhost:8000
```

## Image note

This site used to ship a Flutter web build (~36 MB of CanvasKit/wasm) plus 12 MB background photos. That's all gone — the page now loads ~190 KB total. The originals in `assets/Photos/` (`cloud_mountain.JPG`, `stone_clear_sky.JPG`, `buddhist_flags.JPG`, `mountain.jpg` — ~40 MB combined) are **not referenced by the site**; safe to delete from the repo or downscale to ≤ 1920 px if you want to keep them.

---

*Building backend systems, one goroutine at a time.*

