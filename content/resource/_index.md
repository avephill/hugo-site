---
# Leave the homepage title empty to use the site title
title: ''
date: 2022-10-24
type: landing

sections:
  - block: portfolio
  # - block: collection
    id: resource
    content:
      title: Resources
      filters:
        folders:
          - resource
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
        - name: DIY
          tag: diy
        - name: Research
          tag: research
        - name: All
          tag: '*'
      # sort_by: 'custom_order'
      sort_ascending: true
    design:
      # Choose how many columns the section has. Valid values: '1' or '2'.
      columns: '1'
      # view: showcase
      # For Showcase view, flip alternate rows?
      flip_alt_rows: false
      # view: compact
      view: masonry
      # view: card

---
