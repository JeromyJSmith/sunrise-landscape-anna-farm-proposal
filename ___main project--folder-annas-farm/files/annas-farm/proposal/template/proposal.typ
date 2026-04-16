// Anna's Farm — landscape proposal
// Built with Typst. Reads ../../brief.json and embeds generated mockups + site photos.
//
// Render:  uv run typst compile proposal.typ proposal.pdf
// (or: typst compile proposal.typ proposal.pdf if Typst is installed natively)
//
// Pattern adapted from casoon/typst-business-templates (offer template).

#set document(title: "Anna's Farm — Landscape Proposal", author: "TBD Contractor")
#set page(
  paper: "us-letter",
  margin: (x: 0.75in, y: 0.8in),
  numbering: "1 / 1",
)
#set text(font: "Inter", size: 10pt, fallback: true)
#set par(justify: true, leading: 0.65em)

#let brief = json("../../brief.json")
#let usd(n) = { "$" + str(calc.round(n, digits: 2)) }

// ─── HEADER ──────────────────────────────────────────────────────────────────

#block(width: 100%)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [
      #text(size: 18pt, weight: "bold")[
        #if brief.contractor.company != none [ #brief.contractor.company ] else [ [CONTRACTOR COMPANY] ]
      ] \
      #if brief.contractor.contact_name != none [ #brief.contractor.contact_name \ ]
      #if brief.contractor.email != none [ #brief.contractor.email \ ]
      #if brief.contractor.phone != none [ #brief.contractor.phone \ ]
      #if brief.contractor.license != none [ License \##brief.contractor.license ]
    ],
    align(right)[
      #text(size: 22pt, weight: "bold")[LANDSCAPE PROPOSAL] \
      #text(size: 10pt, fill: gray)[Dated #datetime.today().display()] \
      #text(size: 10pt, fill: gray)[Valid until #if brief.totals.valid_until != none [#brief.totals.valid_until] else [TBD]]
    ]
  )
]

#line(length: 100%, stroke: 0.5pt + gray)

// ─── CLIENT BLOCK ────────────────────────────────────────────────────────────

#v(1em)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  [
    #text(weight: "bold")[PREPARED FOR] \
    #if brief.client.name != none [ #brief.client.name \ ] else [ [CLIENT NAME] \ ]
    #if brief.client.email != none [ #brief.client.email \ ]
    #if brief.client.phone != none [ #brief.client.phone \ ]
    #if brief.client.billing_address != none [ #brief.client.billing_address ]
  ],
  [
    #text(weight: "bold")[PROJECT] \
    #brief.project.name \
    #brief.location.venue, #brief.location.city_region
  ]
)

#v(1.5em)

// ─── PROJECT SUMMARY ─────────────────────────────────────────────────────────

#text(size: 13pt, weight: "bold")[Project Summary]
#v(0.3em)
#line(length: 100%, stroke: 0.3pt + gray)
#v(0.5em)
#brief.project.deliverable_summary

#v(1em)

// ─── SITE MOCKUPS ────────────────────────────────────────────────────────────

// Uncomment once renders land on disk:
//
// #figure(
//   grid(
//     columns: 2,
//     column-gutter: 0.5em,
//     image("../../renders/nano-banana/site1_01_before_day.png", width: 100%),
//     image("../../renders/nano-banana/site1_02_after_day.png", width: 100%),
//   ),
//   caption: [Site One — before / after (daytime)]
// )

// ─── LINE ITEMS ──────────────────────────────────────────────────────────────

#for site in brief.sites [
  #v(1em)
  #text(size: 13pt, weight: "bold")[#site.name]
  #text(size: 10pt, fill: gray)[
    #site.dimensions_ft.width ft × #site.dimensions_ft.depth ft
    (#site.area_sqft_measured sqft)
  ]
  #v(0.3em)
  #line(length: 100%, stroke: 0.3pt + gray)
  #v(0.5em)

  #table(
    columns: (1fr, auto, auto, auto),
    align: (left, right, right, right),
    stroke: 0.3pt + gray,
    [*Item*], [*Qty*], [*Unit*], [*Price*],
    ..site.line_items.map(li => (
      li.item,
      if li.qty != none [#li.qty] else [—],
      li.unit,
      usd(li.price_usd),
    )).flatten(),
    [#text(weight: "bold")[Subtotal]], [], [], [#text(weight: "bold")[#usd(site.subtotal_usd)]]
  )
]

// ─── TOTALS ──────────────────────────────────────────────────────────────────

#v(1.5em)
#align(right)[
  #block(width: 50%)[
    #table(
      columns: (1fr, auto),
      align: (left, right),
      stroke: none,
      [Site One subtotal], [#usd(brief.totals.site_1_subtotal_usd)],
      [Site Two subtotal], [#usd(brief.totals.site_2_subtotal_usd)],
      #if brief.totals.tax_rate_pct != none [
        [Tax (#brief.totals.tax_rate_pct%)], [#usd(brief.totals.tax_usd)],
      ],
      [#text(size: 13pt, weight: "bold")[GRAND TOTAL]],
      [#text(size: 13pt, weight: "bold")[#usd(brief.totals.grand_total_usd)]],
    )
  ]
]

#v(2em)

// ─── TERMS ───────────────────────────────────────────────────────────────────

#text(size: 11pt, weight: "bold")[Terms]
#v(0.3em)
#line(length: 100%, stroke: 0.3pt + gray)
#v(0.5em)
#if brief.totals.deposit_terms != none [
  Deposit / payment terms: #brief.totals.deposit_terms
] else [
  Deposit / payment terms: *TBD*
]

#v(0.5em)
Estimate valid through #if brief.totals.valid_until != none [#brief.totals.valid_until] else [*TBD*]. Material pricing subject to market fluctuation.
