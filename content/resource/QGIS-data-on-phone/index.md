---
date: "2024-04-27T00:00:00Z"
focal_point: Smart
title: Store custom maps on phone with QGIS and QField
summary: A cheap, DIY air quality sensor with esphome and homeassistant
tags:
  - research
  - featured
---

I tried many different iOS apps to try and load simple spatial data on to my phone for offline use, and the only way I got it to work for free was with QGIS and QFieldSync plugin, with the QField iOS app.

1.  Setup QGIS and QFieldSync
    1.  Download [QGIS](https://download.qgis.org/qgisdata/QGIS-Website/live/html/en/site/forusers/download.html) on your computer
    2.  Go to `Plugins > Manage and Install Plugins > All`
    3.  Search `QField Sync` and install
2.  Add geospatial data
    1.  Create a QGIS project
    2.  Add the geospatial data of your choosing
        <img src="./GIS%20data%20on%20phone%20with%20QGIS%20and%20QField/b6c77be5110cb187ad2f93c5b2865d74b6ace29c.png" alt="QGIS interface" width="450" style="display: block; margin: 0 auto;">
    3.  When happy, go to `Plugins > QFieldSync > Package for QField` and choose a directory
3.  Add to iOS device
    1.  download `QField for QGIS` app
    2.  Plug your phone into your computer (MacOS) and navigate to the phone in finder
        <img src="./GIS%20data%20on%20phone%20with%20QGIS%20and%20QField/813184d7c42d47e5e931534e7610d4ad2f698e35.png" alt="Finder view" width="450" style="display: block; margin: 0 auto;">
    3.  Drag folder that you exported from QGIS into the QField data folder on your phone
        <img src="./GIS%20data%20on%20phone%20with%20QGIS%20and%20QField/f3d4aa6b2205b700ff4f1b586ab52c1307fa6bba.png" alt="QField folder" width="450" style="display: block; margin: 0 auto;">
    4.  Now that it's loaded onto your phone, pick up your phone and go to the Qfield app. Select `Open local file > QField files directory` and then select the folder you just added, which for me is `sf protected spaces`
    5.  Select the _project file_ at the top and there you go, the spatial data should load, and will be available offline
        <img src="./GIS%20data%20on%20phone%20with%20QGIS%20and%20QField/01ee80d85c1f6f6f97a6f100fdd44c201e4822af.png" alt="QField app" width="450" style="display: block; margin: 0 auto;">
