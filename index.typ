// =============================================================================
//  YOUR ACADEMIC HOMEPAGE  —  edit the content below, then build with:
//     typst compile --features html index.typ index.html
//     typst watch   --features html index.typ index.html   # live preview
//
//  Everything here is placeholder text. Replace it with your own.
// =============================================================================
#import "lib/template.typ": *

// Your name — bolded automatically wherever it appears in author lists.
#let me = "Siyu Chen | 陈思宇"

#show: homepage.with(
  name: me,
  title: "Siyu's Homepage",
  favicon: "https://s3.bmp.ovh/imgs/2022/05/28/7745084c66c1e1de.png",
  role: "Ph.D. Student in Electrical and Computer Engineering",
  affiliation: [Purdue University · PurPL],
  avatar: "assets/portrait.png",
  description: "Siyu Chen is a Ph.D. student at Purdue University working on "
    + "software engineering, formal methods, and reliable AI-written software.",
  // Contact / profile links. Drop any you don't use; `kind` picks the icon.
  // Available kinds: email, scholar, github, orcid, linkedin, twitter, cv, website
  links: (
    (kind: "email", url: "mailto:chen5216@purdue.edu"),
    // (kind: "scholar", url: "https://scholar.google.com/citations?user=XXXXXXXX"),
    (kind: "github", url: "https://github.com/werifu"),
    (kind: "linkedin", url: "https://www.linkedin.com/in/siyu-chen-88059224a/"),
  ),
  // Sticky in-page navigation (label, anchor).
  nav: (
    ("About", "#about"),
    ("News", "#news"),
    ("Publications", "#publications"),
    ("Teaching", "#teaching"),
    ("Service", "#service"),
  ),
)

// =============================================================================
//  ABOUT
// =============================================================================
#section(id: "about", title: "About")[

  I'm currently a Ph.D. student in the Department of Electrical and Computer Engineering (ECE) at Purdue University, advised by Prof. Jingbo Wang.

  Before I joined Purdue in Fall 2024, I obtained my MSc from Hong Kong University of Science and Technology (HKUST) in 2024 and my B.S from Huazhong University of Science and Technology (HUST) in 2023.

  My research interest widely sits at Software Engineering and Formal Methods. In particular, my vision is to help developers build reliable and efficient systems with better development experience. Currently, I'm interested in how we can improve the reliability and auditability of AI-written software.
]

// =============================================================================
//  NEWS  —  most recent first
// =============================================================================
#section(id: "news", title: "News")[
  #news((
    (date: "Jul 2026", body: [Our paper about conflcit extraction in probabilistic Datalog was accepted to *ASE 2026*.]),
  ))
]

// =============================================================================
//  PUBLICATIONS  —  edit this data array; your name is bolded automatically.
//  Each entry:  title, authors (array), venue, links (array of (label, url)),
//               and an optional `badge` (e.g. "Oral", "Spotlight").
// =============================================================================
#let my-publications = (
  (
    title: "Conflict Extraction in Probabilistic Datalog Analyses",
    authors: (underline("Siyu Chen"), "Chungha Sung", "Xuyang Li", "Jingbo Wang"),
    venue: [#emph[ASE], 2026],
    links: (("arXiv", "https://arxiv.org/pdf/2608.10755"), ("Artifact", "https://zenodo.org/records/21776435")),
  ),
)

#section(id: "publications", title: "Publications")[
  #publications(my-publications, me: me)
]

// =============================================================================
//  TEACHING
// =============================================================================
#section(id: "teaching", title: "Teaching")[
  *Teaching Assistant*, Purdue University
  - ECE 26400, Advanced C Programming, Spring 2026
  - ECE 59500, Applied Algorithm, Fall 2025
]

// =============================================================================
//  SERVICE
// =============================================================================
#section(id: "service", title: "Service")[
  *Service*
  - Artifact Evaluation: TACAS 2025
]



