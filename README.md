# Academic homepage (Typst → HTML)

A single-page academic homepage written in [Typst](https://typst.app) and
compiled to a self-contained static HTML page, deployed to GitHub Pages.

It uses Typst's **experimental HTML export** (Typst ≥ 0.15, behind the
`--features html` flag). Math is exported as native **MathML**, and the
stylesheet is inlined at build time so the output is a single portable file
(plus your photo).

```
homepage/
├── index.typ              ← your content (edit this)
├── lib/template.typ       ← page template + components (rarely edited)
├── assets/
│   ├── style.css          ← colors, typography, layout (edit to taste)
│   └── profile.svg        ← placeholder photo — replace with your own
├── build.sh               ← local build / live-preview helper
├── .github/workflows/
│   └── deploy.yml          ← builds & deploys to GitHub Pages on push to main
└── index.html             ← build output (generated; git-ignored)
```

## Prerequisites

- **Typst ≥ 0.15** — `brew install typst` (macOS) or see the
  [install guide](https://github.com/typst/typst#installation).

## Build & preview locally

```sh
./build.sh          # compile once → index.html
./build.sh watch    # live preview with auto-reload at http://localhost:3000
```

Or call Typst directly:

```sh
typst compile --features html index.typ index.html
```

Then open `index.html` in a browser (or use the watch server).

## Personalize

Everything is placeholder text — make it yours:

1. **`index.typ`** — name, role, affiliation, contact links, About text,
   News, Publications (a data array; your name is **bolded automatically** in
   author lists), Teaching/Service. Each part is commented.
2. **`assets/profile.svg`** — replace with your photo. You can also point
   `avatar:` at a `.jpg`/`.png` you drop in `assets/` (e.g.
   `avatar: "assets/photo.jpg"`).
3. **`assets/style.css`** — tweak the CSS variables in `:root` (colors,
   content width, radius). Dark mode is handled automatically via
   `prefers-color-scheme`. You can also override the accent color from
   `index.typ` with `accent: "#b5179e"`.
4. Add your CV as `assets/cv.pdf` (the CV icon links to it).

Available contact-link `kind`s: `email`, `scholar`, `github`, `orcid`,
`linkedin`, `twitter`, `cv`, `website`.

## Deploy to GitHub Pages

The included workflow (`.github/workflows/deploy.yml`) installs Typst, builds
the page, and publishes it — on every push to `main`.

1. Create a repository on GitHub and push this folder to it:
   ```sh
   git init && git add -A && git commit -m "Initial homepage"
   git branch -M main
   git remote add origin https://github.com/<you>/<repo>.git
   git push -u origin main
   ```
2. On GitHub: **Settings → Pages → Build and deployment → Source: GitHub
   Actions**.
3. The **Deploy homepage to GitHub Pages** workflow runs automatically; your
   site appears at:
   - `https://<you>.github.io/` — if the repo is named `<you>.github.io`
     (user site), or
   - `https://<you>.github.io/<repo>/` — for any other repo name (project
     site). Relative asset paths used here work for both.

To deploy a new version later, just edit and push — the workflow rebuilds and
redeploys.

> **Note** Typst's HTML export is experimental and evolving. If you upgrade
> Typst, bump `TYPST_VERSION` in `.github/workflows/deploy.yml` to match your
> local version so local and CI builds stay in sync.
