---
# Leave the homepage title empty to use the site title
title: ""
# date: 2022-10-24
type: landing

sections:
  - block: about.biography
    id: about
    content:
      title: Biography
      # Choose a user profile to display (a folder name within `content/authors/`)
      username: avery

  - block: markdown
    id: vision
    content:
      title: Research Overview
      text: |-
        <figure style="text-align: center; margin: 0 auto 1.5rem auto; max-width: 70%;">
        <img src="/media/community-science-lifecycle.png" alt="Conceptual life cycle of community science data" class="img-fluid" style="border:1px solid rgba(47,74,58,0.12);border-radius:4px;box-shadow:0 2px 8px rgba(42,38,34,0.06);padding:6px;background-color:#f0ebe0" width="1705" height="1181" loading="lazy" decoding="async" />
        <figcaption class="small text-muted mt-1"><em>Fig. 1. Community science data can be a foundation for reciprocal relationships between actors addressing and affected by ecosystem change. Dashed teal arrows show each group's direct relationship to the ecosystem. Solid warm gray arrows trace how data, insights, and priorities pass between scientists, communities, and decision-makers.</em></figcaption>
        </figure>

        <div style="font-size: 0.9em;">

        ##### Where and how are vegetation-type transitions occurring? (Fig. 1,<span style="color: #3d6f84;"> Line 1</span>)

        Using historical vegetation data, modern forest inventories, and environmental data to characterize climate-induced range shifts. I primarily study [vegetation-climate mismatch in the Sierra Nevada](/project/zombie-forests) (i.e. "zombie forests"), with parallel work on [urban refugia](https://thisismold.com/series/urban-ecologies/cities-as-refugia-for-ecosystems-adrift) and the [conservation value of urban biodiversity](/project/CUB).

        ##### What are the impacts of these transitions? (<span style="color: #3d6f84;">Lines 2–3</span>)

        Investigating consequences for fire regimes, carbon storage, biodiversity, and the human communities embedded in these landscapes. Recent work includes wildfire behavior in [zombie forests](/project/zombie-forests/) and co-authorship of the *Nature and Climate Change* chapter of [The Nature Record](https://naturerecord.org/).

        ##### How do we manage these transitions ethically and effectively? (Lines 4–9)

        Developing ethical frameworks, community science platforms, and co-created management strategies that strengthen the reciprocal relationships between scientists, decision-makers, and local communities. This includes work to reframe [nativeness as a gradient](/project/native-ethics) to better manage ecosystems in transition, a [suite of tools](/project/data-legibility) to make biodiversity data more legible to the community scientists that collect it and the decision-makers that act on it, and [community science campaigns](/project/community-science/) that ground this work in local communities.

        </div>
    design:
      columns: '2'

  - block: collection
    id: publication
    content:
      title: Select Publications
      filters:
        folders:
          - publication
      sort_by: "featured"
      count: 4
    design:
      columns: "2"
      view: citation

  - block: portfolio
    id: projects
    content:
      title: Projects
      filters:
        folders:
          - project
      default_button_index: 0
      buttons:
        - name: Featured
          tag: featured
        - name: All
          tag: "*"
      sort_by: "custom_order"
      sort_ascending: true
    design:
      columns: "2"
      view: showcase
      flip_alt_rows: true

  - block: experience
    id: experience
    content:
      title: Experience
      date_format: Jan 2006
      items:
        - title: Research Scientist
          company: California Academy of Sciences
          company_url: ""
          company_logo: calacademy-logo
          location: San Francisco, CA
          date_start: "2025-09-01"
          date_end: ""
        - title: Postdoctoral Researcher
          company: California Academy of Sciences
          company_url: ""
          company_logo: calacademy-logo
          location: San Francisco, CA
          date_start: "2022-09-29"
          date_end: "2025-09-01"
        - title: Ph.D. in Ecology and Evolution
          company: Stanford University
          company_url: ""
          company_logo: stanford-logo
          location: Stanford, CA
          date_start: "2017-09-25"
          date_end: "2022-06-10"
        - title: B.S. in Biology
          company: Cornell University
          company_url: ""
          company_logo: cornell-logo
          location: Ithaca, NY
          date_start: "2013-08-21"
          date_end: "2017-06-12"
    design:
      columns: "2"

  - block: collection
    id: media
    design:
      columns: "2"
      view: custom-media
    content:
      title: Select Media
      filters:
        folders:
          - media
      sort_by: "featured"
      count: 3

  - block: portfolio
    id: webapps
    content:
      title: Web Applications
      filters:
        folders:
          - webapp
      default_button_index: 0
      buttons:
        - name: Featured
          tag: featured
        - name: All
          tag: "*"
      sort_by: "custom_order"
      sort_ascending: true
    design:
      columns: "2"
      view: masonry
      flip_alt_rows: false

  - block: markdown
    id: contact
    content:
      title: Contact
      text: apaytonhill [at] gmail [dot] com
    design:
      columns: "2"
---
