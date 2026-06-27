// =============================================================================
//  YOUR ACADEMIC HOMEPAGE  —  edit the content below, then build with:
//     typst compile --features html index.typ index.html
//     typst watch   --features html index.typ index.html   # live preview
//
//  Everything here is placeholder text. Replace it with your own.
// =============================================================================
#import "lib/template.typ": *

// Your name — bolded automatically wherever it appears in author lists.
#let me = "Alex Morgan"

#show: homepage.with(
  name: me,
  role: "Ph.D. Candidate in Computer Science",
  affiliation: [#link("https://example.edu")[Example University] · Machine Learning Group],
  avatar: "assets/profile.svg",
  description: "Alex Morgan is a PhD candidate in Computer Science working on machine "
    + "learning, natural language processing, and AI for science.",
  // Contact / profile links. Drop any you don't use; `kind` picks the icon.
  // Available kinds: email, scholar, github, orcid, linkedin, twitter, cv, website
  links: (
    (kind: "email",    url: "mailto:alex.morgan@example.edu"),
    (kind: "scholar",  url: "https://scholar.google.com/citations?user=XXXXXXXX"),
    (kind: "github",   url: "https://github.com/alexmorgan"),
    (kind: "orcid",    url: "https://orcid.org/0000-0000-0000-0000"),
    (kind: "linkedin", url: "https://www.linkedin.com/in/alexmorgan"),
    (kind: "cv",       url: "assets/cv.pdf"),
  ),
  // Sticky in-page navigation (label, anchor).
  nav: (
    ("About", "#about"),
    ("News", "#news"),
    ("Publications", "#publications"),
    ("Teaching", "#teaching"),
  ),
)

// =============================================================================
//  ABOUT
// =============================================================================
#section(id: "about", title: "About")[
  #lead[
    I am a Ph.D. candidate in the #link("https://example.edu")[Department of Computer
    Science] at Example University, advised by #link("https://example.edu")[Prof. Jamie
    Lee]. My research builds *reliable and interpretable* machine-learning systems for
    language and scientific discovery.
  ]

  Previously I received my B.S. in Computer Science from Example State University
  (2021), where I worked on probabilistic models with Prof. Robin Patel. In summer
  2024 I interned at Example Research, working on retrieval-augmented language models.

  My current research focuses on three questions:

  - *Reliability* — how can we know when a model is wrong, and make it abstain?
  - *Interpretability* — what internal structure explains a model's predictions?
  - *Scientific ML* — how do we couple learned models with physical constraints,
    e.g. enforcing $nabla dot bold(u) = 0$ in learned fluid simulators?

  #tags((
    "Machine Learning",
    "Natural Language Processing",
    "Interpretability",
    "Uncertainty Quantification",
    "AI for Science",
  ))
]

// =============================================================================
//  NEWS  —  most recent first
// =============================================================================
#section(id: "news", title: "News")[
  #news((
    (date: "Jun 2026", body: [Our paper on calibrated retrieval was accepted to *NeurIPS 2026*.]),
    (date: "Apr 2026", body: [Gave an invited talk at the Example Workshop on Trustworthy ML.]),
    (date: "Jan 2026", body: [Started a research internship at #link("https://example.com")[Example Research].]),
    (date: "Sep 2025", body: [Received the Example University Graduate Fellowship.]),
  ))
]

// =============================================================================
//  PUBLICATIONS  —  edit this data array; your name is bolded automatically.
//  Each entry:  title, authors (array), venue, links (array of (label, url)),
//               and an optional `badge` (e.g. "Oral", "Spotlight").
// =============================================================================
#let my-publications = (
  (
    title: "Calibrated Retrieval-Augmented Generation for Reliable Question Answering",
    authors: ("Alex Morgan", "Jamie Lee", "Sam Rivera"),
    venue: [#emph[Advances in Neural Information Processing Systems (NeurIPS)], 2026],
    badge: "Spotlight",
    links: (("PDF", "#"), ("arXiv", "#"), ("Code", "#"), ("BibTeX", "#")),
  ),
  (
    title: "Probing Latent Structure in Transformer Language Models",
    authors: ("Sam Rivera", "Alex Morgan", "Jamie Lee"),
    venue: [#emph[Association for Computational Linguistics (ACL)], 2025],
    links: (("PDF", "#"), ("arXiv", "#"), ("Code", "#")),
  ),
  (
    title: "Physics-Constrained Neural Operators for Incompressible Flow",
    authors: ("Alex Morgan", "Robin Patel"),
    venue: [#emph[International Conference on Machine Learning (ICML)], 2024],
    badge: "Oral",
    links: (("PDF", "#"), ("Project", "#")),
  ),
)

#section(id: "publications", title: "Publications")[
  #publications(my-publications, me: me)
]

// =============================================================================
//  TEACHING
// =============================================================================
#section(id: "teaching", title: "Teaching & Service")[
  *Teaching Assistant*, Example University
  - CS 229 — Machine Learning (Fall 2025, Fall 2024)
  - CS 101 — Introduction to Programming (Spring 2024)

  *Service*
  - Reviewer: NeurIPS, ICML, ACL (2024–present)
  - Organizer, Departmental ML Reading Group (2023–present)
]
