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
      title: Research Program
      text: |-
        <figure style="float: right; max-width: 400px; margin: 0 0 1rem 2rem;">
        <img src="/media/community-science-lifecycle.png" alt="Conceptual life cycle of community science data" class="img-fluid" style="border:1px solid rgba(96,115,77,0.35);border-radius:2px;box-shadow:0 4px 10px rgba(96,115,77,.1);padding:6px;background-color:#fcfcfa">
        <figcaption class="small text-muted mt-1"><em>Fig. 1. A conceptual life cycle of community science data applied to changing ecosystems.</em></figcaption>
        </figure>

        ##### Where and how are vegetation-type transitions occurring?
        Using historical vegetation maps, forest inventory data, and remote sensing to characterize climate-induced range shifts in western forests (Fig. 1, line 1).

        ##### What are the impacts of these transitions?
        Investigating consequences for fire regimes, carbon storage, biodiversity, and the human communities embedded in these landscapes (Fig. 1, lines 2–3).

        ##### How do we manage these transitions ethically and effectively?
        Developing ethical frameworks, community science platforms, and co-created management strategies that strengthen the reciprocal relationships connecting scientists, decision-makers, and local communities (Fig. 1, lines 4–9).

        <div style="clear: both;"></div>
    design:
      columns: '2'

  - block: experience
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
