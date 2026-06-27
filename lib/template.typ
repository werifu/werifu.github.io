// =============================================================================
// Academic homepage template — Typst HTML export (>= 0.15)
//
//   Build:  typst compile --features html index.typ index.html
//   Watch:  typst watch   --features html index.typ index.html   (live server)
//
// This file holds the machinery. You normally edit `index.typ` (content) and
// `assets/style.css` (looks), not this file.
// =============================================================================

// The stylesheet is read at compile time and inlined into a <style> element,
// so the generated index.html is fully self-contained.
#let site-css = read("../assets/style.css")

// --- Inline SVG icons (single-path, fill = currentColor so CSS can theme them).
#let _icon-paths = (
  email:    "M22 6c0-1.1-.9-2-2-2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6zm-2 0l-8 5-8-5h16zm0 12H4V8l8 5 8-5v10z",
  scholar:  "M5.242 13.769L0 9.5 12 0l12 9.5-5.242 4.269C17.548 11.249 14.978 9.5 12 9.5c-2.977 0-5.548 1.748-6.758 4.269zM12 10a7 7 0 1 0 0 14 7 7 0 0 0 0-14z",
  github:   "M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12",
  orcid:    "M12 0C5.372 0 0 5.372 0 12s5.372 12 12 12 12-5.372 12-12S18.628 0 12 0zM7.369 4.378c.525 0 .947.431.947.947 0 .525-.422.947-.947.947-.525 0-.946-.422-.946-.947 0-.516.421-.947.946-.947zm-.722 3.038h1.444v10.041H6.647V7.416zm3.562 0h3.9c3.712 0 5.344 2.653 5.344 5.025 0 2.578-2.016 5.025-5.325 5.025h-3.919V7.416zm1.444 1.303v7.444h2.297c2.359 0 3.588-1.444 3.588-3.722 0-2.016-1.091-3.722-3.588-3.722h-2.297z",
  linkedin: "M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.225 0z",
  twitter:  "M18.901 1.153h3.68l-8.04 9.19L24 22.846h-7.406l-5.8-7.584-6.638 7.584H.474l8.6-9.83L0 1.154h7.594l5.243 6.932ZM17.61 20.644h2.039L6.486 3.24H4.298Z",
  cv:       "M14 2H6c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6zm2 16H8v-2h8v2zm0-4H8v-2h8v2zm-3-5V3.5L18.5 9H13z",
  website:  "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z",
)

#let _icon-labels = (
  email: "Email", scholar: "Google Scholar", github: "GitHub", orcid: "ORCID",
  linkedin: "LinkedIn", twitter: "X (Twitter)", cv: "Curriculum Vitae", website: "Website",
)

// A single inline SVG icon.
#let icon(name) = html.elem(
  "svg",
  attrs: (
    xmlns: "http://www.w3.org/2000/svg",
    viewBox: "0 0 24 24",
    width: "24", height: "24",
    fill: "currentColor",
    "aria-hidden": "true",
  ),
  html.elem("path", attrs: (d: _icon-paths.at(name, default: _icon-paths.website))),
)

// One contact <li><a><icon></a></li>.  `kind` selects the icon/label.
#let icon-link(kind, url, label: none) = {
  let lab = if label != none { label } else { _icon-labels.at(kind, default: kind) }
  html.elem("li", html.elem(
    "a",
    attrs: (href: url, "aria-label": lab, title: lab, rel: "me"),
    icon(kind),
  ))
}

// A <section id><h2>title</h2> … </section> block.
#let section(body, id: none, title: none) = html.elem(
  "section",
  attrs: if id != none { (id: id) } else { (:) },
  {
    if title != none { html.elem("h2", title) }
    body
  },
)

// A lead/intro paragraph (larger text).
#let lead(body) = html.elem("p", body, attrs: (class: "lead"))

// Research-interest pills.  `items` is an array of strings/content.
#let tags(items) = html.elem(
  "ul",
  attrs: (class: "tags"),
  items.map(t => html.elem("li", t)).join(),
)

// News feed.  `items`: array of (date: <content>, body: <content>).
#let news(items) = html.elem(
  "ul",
  attrs: (class: "news"),
  items.map(it => html.elem("li", {
    html.elem("time", it.date)
    html.elem("span", it.body)
  })).join(),
)

// A single publication entry (an <li>).  Used by `publications` below.
//   title:   content        authors: array of strings (your name is bolded)
//   venue:   content        links:   array of (label, url) pairs
//   badge:   optional short tag (e.g. "Oral", "Spotlight")
//   me:      your name, to highlight within `authors`
#let publication(title: "", authors: (), venue: none, links: (), badge: none, me: none) = {
  html.elem("li", attrs: (class: "pub"), {
    html.elem("span", attrs: (class: "pub-num"))
    html.elem("div", attrs: (class: "pub-body"), {
      html.elem("span", title, attrs: (class: "pub-title"))
      if badge != none { html.elem("span", badge, attrs: (class: "pub-badge")) }
      if authors.len() > 0 {
        html.elem(
          "span",
          attrs: (class: "pub-authors"),
          authors.map(a => if me != none and a == me {
            html.elem("span", a, attrs: (class: "me"))
          } else { [#a] }).join(", "),
        )
      }
      if venue != none { html.elem("span", venue, attrs: (class: "pub-venue")) }
      if links.len() > 0 {
        html.elem(
          "span",
          attrs: (class: "pub-links"),
          links.map(l => html.elem("a", attrs: (href: l.at(1)), l.at(0))).join(),
        )
      }
    })
  })
}

// Render an ordered list of publications from a data array.
//   items: array of dicts accepted by `publication` (without `me`).
#let publications(items, me: none) = html.elem(
  "ol",
  attrs: (class: "pub-list"),
  items.map(it => publication(..it, me: me)).join(),
)

// =============================================================================
// The page wrapper.  Use as a show rule:  #show: homepage.with(...)
// =============================================================================
#let homepage(
  name: "",
  role: "",
  affiliation: none,   // content (may contain a link)
  avatar: none,        // relative path, e.g. "assets/profile.svg"
  description: "",
  links: (),           // array of (kind, url[, label])
  nav: (),             // array of (label, href)
  accent: none,        // optional accent color override, e.g. "#b5179e"
  body,
) = {
  set document(
    title: name + if role != "" { " · " + role } else { "" },
    author: name,
    description: description,
  )
  set text(lang: "en")

  // Inline the stylesheet (+ optional accent override).
  html.elem("style", site-css)
  if accent != none {
    html.elem("style", ":root{--accent:" + accent + ";--accent-fg:" + accent + ";}")
  }

  // Header: avatar + identity + contact links.
  html.elem("header", attrs: (class: "site-header"), {
    if avatar != none {
      html.elem("img", attrs: (
        class: "avatar", src: avatar, alt: name, width: "132", height: "132",
      ))
    }
    html.elem("div", attrs: (class: "identity"), {
      html.elem("h1", name)
      if role != "" { html.elem("p", role, attrs: (class: "role")) }
      if affiliation != none { html.elem("p", affiliation, attrs: (class: "affiliation")) }
      if links.len() > 0 {
        html.elem(
          "ul",
          attrs: (class: "contact"),
          links.map(l => icon-link(l.kind, l.url, label: l.at("label", default: none))).join(),
        )
      }
    })
  })

  // Sticky in-page navigation.
  if nav.len() > 0 {
    html.elem(
      "nav",
      attrs: (class: "site-nav"),
      nav.map(item => html.elem("a", attrs: (href: item.at(1)), item.at(0))).join(),
    )
  }

  // Main content (everything the content file writes after the show rule).
  html.elem("main", body)

  // Footer.
  html.elem("footer", attrs: (class: "site-footer"), {
    html.elem("span", [© #datetime.today().year() #name])
    html.elem("span", {
      [Built with ]
      html.elem("a", attrs: (href: "https://typst.app"), "Typst")
      [ · ]
      html.elem("a", attrs: (href: "#"), "Top")
    })
  })
}
