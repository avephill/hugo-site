---
title: Connecting Urban Biodiversity
summary: Project evaluating the contribution of urban lands to SF Bay Area conservation goals with iNaturalist.
# tags:
# - featured
date: '2022-09-27T00:00:00Z'
custom_order: 5
show_related: false
# Optional external URL for project (replaces project detail page).
# external_link: ''
image:
  # caption: Photo from Avery Hill
  focal_point: Smart
# links:
#   - icon: twitter
#     icon_pack: fab
#     name: Follow
#     url: https://twitter.com/georgecushen
url_code: ''
url_pdf: ''
url_slides: ''
url_video: ''
# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

The regional conservation strategy for the San Francisco Bay Area—the [Conservation Lands Network (CLN)](https://www.bayarealands.org/explorer-tool/)—collaboratively determines conservation priorities across the region. Since its inception in 2011 the strategies have practically omitted all urban lands from planning efforts, despite the large proportion of urban land in the Bay Area (15% of all land) and the abundance of urban observations for CLN target species (e.g. Arboreal salamander, Dark-eyed junco, Gray fox).

The work below sits inside a broader [Connecting Urban Biodiversity](https://togetherbayarea.org/urban-biodiversity/) partnership led by TOGETHER Bay Area and the California Academy of Sciences, with community partners across the Bay Area. That page collects program context, reports, and lessons learned from the 2021–2024 effort.

<div style="text-align: center; margin: 1.25rem 0 1.5rem;">
  <a href="https://www.flipsnack.com/9ED777BBDC9/connecting-urban-biodiversity-report/full-view.html" target="_blank" rel="noopener"><strong>Read the full Connecting Urban Biodiversity report</strong></a><br><span class="small text-muted">FlipSnack (opens in a new tab)</span>
</div>

In this project, we leveraged the massive amount of community science data available from iNaturalist to extend the current maps of conservation target species into the urban landscape, thereby recognizing and quantifying the contribution of urban lands to regional conservation goals. We identified 18 target species, and supplemented existing iNaturalist observation data for these species with local community science initiatives, including a regional campaign and a partnership with a community based organization, YES Nature to Neighborhoods, on a community bioblitz.

We used these observations and myriad environmental data including climate, soil, and housing density to train a MaxEnt species distribution model for each species. With these models, we identify characteristics that demarcate suitable urban habitat and produce maps for target species.
I made a [SDM explorer tool](https://calacademy-community-science.shinyapps.io/CUB-SDM-Report/) to showcase results and to iteratively tune SDMs with regional experts.

{{< figure src="CSci-Poster-2023.png" alt="Poster showing iNaturalist-informed species distribution models across the San Francisco Bay Area, with maps of estimated species counts, model accuracy metrics, and environmental variable importance rankings." caption="Poster presented at the 2023 C*Sci Conference in Tempe, AZ." max_width="min(100%, 1200px)" >}}

In follow-up work with collaborators at UC Berkeley, UC Santa Cruz, and the Natural History Museum of Los Angeles County, we ran habitat connectivity analyses on these data for Oakland, San Francisco, and San Jose (Estien et al., under review at *Conservation Science and Practice*).