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

  # - block: skills
  #   content:
  #     title: Skills
  #     text: ''
  #     # Choose a user to display skills from (a folder name within `content/authors/`)
  #     username: admin
  #   design:
  #     columns: '1'
  - block: experience
    content:
      title: Experience
      # Date format for experience
      #   Refer to https://docs.hugoblox.com/customization/#date-format
      date_format: Jan 2006
      # Experiences.
      #   Add/remove as many `experience` items below as you like.
      #   Required fields are `title`, `company`, and `date_start`.
      #   Leave `date_end` empty if it's your current employer.
      #   Begin multi-line descriptions with YAML's `|2-` multi-line prefix.
      items:
        - title: PostDoctoral Researcher
          company: California Academy of Sciences
          company_url: ""
          company_logo: calacademy-logo
          location: San Francisco, CA
          date_start: "2022-09-29"
          date_end: ""
        - title: Ph.D. in Ecology and Evolution
          company: Stanford University
          company_url: ""
          company_logo: stanford-logo
          location: Stanford, CA
          date_start: "2017-09-25"
          date_end: "2022-06-10"
          # description: |2-
          #     Responsibilities include:

          #     * Analysing
          #     * Modelling
          #     * Deploying
        - title: B.S. in Biology
          company: Cornell University
          company_url: ""
          company_logo: cornell-logo
          location: Ithaca, NY
          date_start: "2013-08-21"
          date_end: "2017-06-12"
          # description: Taught electronic engineering and researched semiconductor physics.
    design:
      columns: "2"

  - block: portfolio
    # - block: collection
    id: projects
    content:
      title: Projects
      filters:
        folders:
          - project
      # Default filter index (e.g. 0 corresponds to the first `filter_button` instance below).
      default_button_index: 0
      # Filter toolbar (optional).
      # Add or remove as many filters (`filter_button` instances) as you like.
      # To show all items, set `tag` to "*".
      # To filter by a specific tag, set `tag` to an existing tag name.
      # To remove the toolbar, delete the entire `filter_button` block.
      buttons:
        - name: Featured
          tag: featured
        - name: All
          tag: "*"
      sort_by: "custom_order"
      sort_ascending: true
    design:
      # Choose how many columns the section has. Valid values: '1' or '2'.
      columns: "2"
      view: showcase
      # For Showcase view, flip alternate rows?
      flip_alt_rows: true
      # view: compact
      # view: masonry
      # view: card

  - block: collection
    id: publication
    content:
      title: Select Publications
      #      text: |-
      #        {{% callout note %}}
      #        Quickly discover relevant content by [filtering publications](./publication/).
      #        {{% /callout %}}
      filters:
        folders:
          - publication
        # featured_only: true
        # exclude_featured: true
      sort_by: "featured"
      count: 3
    design:
      columns: "2"
      view: citation

  - block: collection
    id: media
    design:
      columns: "2"
      # view: compact
      # view: masonry
      view: custom-media
    content:
      title: Select Media
      filters:
        folders:
          - media
        # featured_only: true
        # exclude_featured: true
      sort_by: "featured"
      # sort_by: 'date'
      count: 3

  - block: portfolio
    id: webapps
    content:
      title: Interactive Web Applications
      # text: Explore my collection of interactive tools for biodiversity research and data visualization
      filters:
        folders:
          - webapp
      # Default filter index (e.g. 0 corresponds to the first `filter_button` instance below).
      default_button_index: 0
      # Filter toolbar (optional).
      # Add or remove as many filters (`filter_button` instances) as you like.
      # To show all items, set `tag` to "*".
      # To filter by a specific tag, set `tag` to an existing tag name.
      # To remove the toolbar, delete the entire `filter_button` block.
      buttons:
        - name: Featured
          tag: featured
        - name: All
          tag: "*"
      sort_by: "custom_order"
      sort_ascending: true
    design:
      # Choose how many columns the section has. Valid values: '1' or '2'.
      columns: "2"
      view: masonry #showcase
      # For Showcase view, flip alternate rows?
      flip_alt_rows: false
      # view: compact
      # view: masonry
      # view: card

  - block: markdown
    id: contact
    content:
      title: Contact
      text: apaytonhill [at] gmail [dot] com

    # - block: contact
    #   id: contact
    #   content:
    #     title: Contact
    # subtitle:
    # text: |-
    #   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mi diam, venenatis ut magna et, vehicula efficitur enim.
    # Contact (add or remove contact options as necessary)
    # email: test@example.org
    # phone: 888 888 88 88
    # appointment_url: 'https://calendly.com'
    # address:
    #   street: 450 Serra Mall
    #   city: Stanford
    #   region: CA
    #   postcode: '94305'
    #   country: United States
    #   country_code: US
    # directions: Enter Building 1 and take the stairs to Office 200 on Floor 2
    # office_hours:
    #   - 'Monday 10:00 to 13:00'
    #   - 'Wednesday 09:00 to 10:00'
    # Choose a map provider in `params.yaml` to show a map from these coordinates
    # coordinates:
    #   latitude: '37.4275'
    #   longitude: '-122.1697'
    # contact_links:
    #   - icon: twitter
    #     icon_pack: fab
    #     name: DM Me
    #     link: 'https://twitter.com/Twitter'

    # Automatically link email and phone or display as text?
    # autolink: true
    # Email form provider
    # form:
    #   provider: netlify
    #   formspree:
    #     id:
    #   netlify:
    #     # Enable CAPTCHA challenge to reduce spam?
    #     captcha: false
    design:
      columns: "2"

  # - block: collection
  #   id: talks
  #   content:
  #     title: Recent & Upcoming Talks
  #     filters:
  #       folders:
  #         - event
  #   design:
  #     columns: '2'
  #     view: compact
  # # - block: tag_cloud
  # #   content:
  # #     title: Popular Topics
  # #   design:
  # #     columns: '2'

  # - block: markdown
  #   content:
  #     title: Gallery
  #     subtitle: ''
  #     text: |-
  #       {{< gallery album="demo" >}}
  #   design:
  #     columns: '1'
  # - block: collection
  #   id: featured
  #   content:
  #     title: Featured Publications
  #     filters:
  #       folders:
  #         - publication
  #       featured_only: true
  #   design:
  #     columns: '2'
  #     view: card

  # - block: accomplishments
  #   content:
  #     # Note: `&shy;` is used to add a 'soft' hyphen in a long heading.
  #     title: 'Accomplish&shy;ments'
  #     subtitle:
  #     # Date format: https://docs.hugoblox.com/customization/#date-format
  #     date_format: Jan 2006
  #     # Accomplishments.
  #     #   Add/remove as many `item` blocks below as you like.
  #     #   `title`, `organization`, and `date_start` are the required parameters.
  #     #   Leave other parameters empty if not required.
  #     #   Begin multi-line descriptions with YAML's `|2-` multi-line prefix.
  #     items:
  #       - certificate_url: https://www.coursera.org
  #         date_end: ''
  #         date_start: '2021-01-25'
  #         description: ''
  #         icon: coursera
  #         organization: Coursera
  #         organization_url: https://www.coursera.org
  #         title: Neural Networks and Deep Learning
  #         url: ''
  #   design:
  #     columns: '2'
  # - block: collection
  #   id: posts
  #   content:
  #     title: Recent Posts
  #     subtitle: ''
  #     text: ''
  #     # Choose how many pages you would like to display (0 = all pages)
  #     count: 5
  #     # Filter on criteria
  #     filters:
  #       folders:
  #         - post
  #       author: ""
  #       category: ""
  #       tag: ""
  #       exclude_featured: false
  #       exclude_future: false
  #       exclude_past: false
  #       publication_type: ""
  #     # Choose how many pages you would like to offset by
  #     offset: 0
  #     # Page order: descending (desc) or ascending (asc) date.
  #     order: desc
  #   design:
  #     # Choose a layout view
  #     view: compact
  #     columns: '2'
---
