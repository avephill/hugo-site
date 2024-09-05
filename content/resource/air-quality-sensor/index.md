---
date: "2024-04-27T00:00:00Z"
focal_point: Smart
summary: A cheap, DIY air quality sensor with esphome and homeassistant
title: DIY Air Quality Sensor
tags:
  - diy
  - featured

---

My folks live out in the woods, and are grappling with the the recent wildfires in California that have resulted from the displacement of indigenous peoples, a century of wildfire suppression, and climate change.
My Grandpa and Mom are asthmatic, and it's important for the family to know what the air quality is outside as the many fires burn through the season.
The problem is that we can't say for certain what the air quality is at their exact location, because they live far away from publicly available sensors.

I wanted to make an air quality sensor that could provide real-time data to me and my family on our phones.
[PurpleAir sensors](https://www2.purpleair.com/products/list) seem cool, but as of this writing they are \$229. I was convinced that I could build something similar for much cheaper.

Because I planned to integrate some more sensors and functionality eventually, I decided to set up a [homeassistant](https://www.home-assistant.io/) server on a raspberry pi, and build a sensor that connected to homeassistant. The result is an extensible, cheap, air quality sensor that my family and I use to monitor air quality from our phones, which can be set to send alerts when the AQI crosses certain thresholds.

This project was heavily based on [Pieter Brinkman's tutorial](https://www.pieterbrinkman.com/2021/02/03/build-a-cheap-air-quality-meter-using-esphome-home-assistant-and-a-particulate-matter-sensor/)

# Table of Contents

1.  [Supplies](#Supplies)
2.  [The AQI Sensor](#the-sensor)
3.  [Homeassistant Server](#homeassistant-server)

An exhaustive list of all materials used in this project (total = \$77, \$61 of which is the raspberry pi home server)

# Supplies

#### Tools

- soldering iron
  \#### Sensor
- [ESP-32 Board (\$3.50)](https://www.aliexpress.us/item/3256805801999922.html?spm=a2g0o.order_list.order_list_main.26.2aa11802zGpZUy&gatewayAdapt=glo2usa)
- [DuPont Wires (\$3 for a ton)](https://www.aliexpress.com/item/1005002046765371.html?spm=a2g0o.productlist.0.0.6bce128bHvV1Xy&algo_pvid=45b12b05-9dfa-4b86-974a-0db7bec9f996&algo_exp_id=45b12b05-9dfa-4b86-974a-0db7bec9f996-2&pdp_ext_f=%7B%22sku_id%22%3A%2212000018543604511%22%7D) (socket-socket)
- [PMS5003 Air Particle Sensor (\$10)](https://www.aliexpress.com/w/wholesale-PMS5003.html?catId=0&initiative_id=SB_20230921084033&SearchText=PMS5003&spm=a2g0o.order_detail.1000002.0)
- [microUSB charger (\$1)](https://www.monoprice.com/product?p_id=4867)
- [DHT22 Humidity and Temperature sensor (\$1.50)](https://www.aliexpress.us/w/wholesale-dht22.html?spm=a2g0o.detail.search.0)
  \#### Raspberry Pi server
- [Raspberry Pi 4, 2 GB memory (\$45)](https://www.pishop.us/product/raspberry-pi-4-model-b-2gb/)
- [microSD (\$8)](https://www.banggood.com/Mini-128GB-CLASS10-Memory-TF-Card-Flash-Card-Smart-Card-16GB-32GB-64GB-for-Mobile-Phone-Laptop-p-1727878.html?cur_warehouse=CN&ID=3150&rmmds=search)
- [microSD --\> SD/USB converter (\$8)](https://www.banggood.com/USB-2_0-Multi-Card-Reader-TF-Card-OTG-Reader-USB2_0-Micro-USB-Interface-480MB-or-S-for-Smartphone-p-1553700.html?cur_warehouse=CN&rmmds=search)
- [USB-C charger (\$8)](https://www.monoprice.com/product?p_id=31201)

# The Sensor

<figure>
<img
src="./DIY%20Air%20Quality%20Sensor/9a60c8fe262c1832fcdd3971ecdedc1455e7b359.jpeg"
title="wikilink" alt="aqi-materials1.jpeg" />
<figcaption aria-hidden="true">aqi-materials1.jpeg</figcaption>
</figure>

## Wiring

### PMS5003

<figure>
<img
src="./DIY%20Air%20Quality%20Sensor/5cc595c9acb760865f7e23c961f06dd41b50f621.png"
title="wikilink" alt="Pastedimage20240619142006.png" />
<figcaption
aria-hidden="true">Pastedimage20240619142006.png</figcaption>
</figure>

To connect the *PMS5003* you must clip the ends and solder one end of dupont wire onto the wires coming out of the sensor.
![aqi-soldering.jpeg](./DIY%20Air%20Quality%20Sensor/4911f4f03e46585aca43f9931cdc00a776945d24.jpeg "wikilink")

Then we connect the other ends of the dupont wires to the corresponding pins on the *ESP32* board. Don't mind the *DHT22* humidity sensor yet
![aqi-assembled.jpeg](./DIY%20Air%20Quality%20Sensor/92ae59bacf2790dba6ffab590f763f966c29c01e.jpeg "wikilink")

### DHT22 Humidity Sensor

<figure>
<img
src="./DIY%20Air%20Quality%20Sensor/61581c0747e8f268b18a9f5edd31135e1da447c3.png"
title="wikilink" alt="Pastedimage20240619143426.png" />
<figcaption
aria-hidden="true">Pastedimage20240619143426.png</figcaption>
</figure>

Wire it up with the socket-socket dupont connectors, no soldering needed here. The picture at the end of the previous section shows what it looks like wired up.

## Software

I'm assuming you have a unix system (linux or mac)
open Terminal or some other terminal emulator.

I use pip as a python package manager. It should be installed by default with python3

download the esphome package

``` bash
pip install esphome
```

Now we're going to make a `.yaml` configuration file that will be used to flash the software onto the sensor.

Here's my `air-quality.yaml`

```yaml
esphome:
  name: airquality
  platform: ESP32
  board: nodemcu-32s

# Enable logging
logger:

# Enable Home Assistant API
api:

ota:
  password: ""

wifi:
  ssid: "WIFI NAME"
  password: "WIFI PASSWORD"

  # Enable fallback hotspot (captive portal) in case wifi connection fails
  ap:
    ssid: "Airquality Fallback Hotspot"
    password: "PASSWORD"

captive_portal:

uart:
  tx_pin: GPIO17 
  rx_pin: GPIO16 
  baud_rate: 9600

sensor:
  - platform: pmsx003
    type: PMSX003
    pm_1_0:
      name: "Particulate Matter <1.0µm Concentration"
    pm_2_5:
      name: "Particulate Matter <2.5µm Concentration"
    pm_10_0:
      name: "Particulate Matter <10.0µm Concentration"
  - platform: dht
    pin: GPIO19 #D19 #D4
    temperature:
      name: "Air quality meter Temperature"
    humidity:
      name: "Air quality meter Humidity"
    update_interval: 60s

switch:
  - platform: gpio
    pin: 
      number: GPIO21
    id: pms_set
    name: "Start measuring"
  
interval:
  - interval: 120s
    then:
      - switch.turn_on: pms_set
      - delay: 20s
      - switch.turn_off: pms_set
```

``` bash
esphome air-quality.yaml run
```

It compiled, but I received the following error

``` bash
INFO Successfully compiled program.
INFO Resolving IP address of barntank_sensor.local
ERROR Error resolving IP address of barntank_sensor.local. Is it connected to WiFi?
ERROR (If this error persists, please set a static IP address: https://esphome.io/components/wifi.html#manual-ips)
ERROR Error resolving IP address: Error resolving address with mDNS: Did not respond. Maybe the device is offline., [Errno 8] nodename nor servname provided, or not known
```

After about an hour of trouble shooting I realized it was because the microUSB cable I was using does not transfer data, it only charges devices, which is the case with [some cheap cables](https://www.quora.com/Are-some-USB-cables-for-power-only-no-data-Is-there-a-quick-way-to-tell-by-looking?share=1). After replacing the cable with another microUSB I had lying around, it worked.

It's gonna compile and take a few minutes. When prompted, select the option to flash over 'serial' i.e. USB.

If you change the configuration and flash it again you can use the following command to flash it over wifi

``` bash
esphome water.yaml run --upload-port XX.XX.XX.XX
```

where xx.xx.xx.xx is the IP address of the sensor (the IP of the sensor is reported after you flash it over USB the first time. Might be worth writing it down.)

Flash/update the software on the sensor as often as you change the .yaml configuration.
Now the sensor should be set up

## Homeassistant Server

This part is pretty easy, but opens up pandora's box. There are so many things you *can* do. But to integrate our sensor it's pretty easy.

So we're gonna install Home Assistant on a raspberry pi 4. You can install Home Assistant software on a bunch of different machines/computers, but raspberry pis are cheap and effective.

You're going to start by taking your microSD card and using the microSD converter and plugging it into your computer.

Once you've got the microSD in, follow [this tutorial](https://www.home-assistant.io/installation/raspberrypi/) for installing Home Assistant. It says to use Balena Etcher but you can also use [Raspberry Pi Imager](https://www.raspberrypi.org/software/), which is what I used.

Once you set up home assistant it may tell you that there is a device discovered. If not, you can add it manually under `Settings > Devices & Services > Add Integration > ESPHome`
Enter the ip address of the sensor under in the 'host' field.
And now it's added!

Go to the `Overview` dashboard tab in the sidebar.
Edit the dashboard by clicking the pencil in the top right
Click `Add Card` in the bottom right
Search by entity
![Screenshot 2024-06-19 at 2.48.09 PM.png](./DIY%20Air%20Quality%20Sensor/682150a95dd16c338868e98d4d2bc3a7898e8dbe.png "wikilink")
And add the card once you've identified the sensor or set of sensors you would like to add.
Now you can customize how to display the sensor data in your Home Assistant dashboard!

I use the following custom card configuration to show PM2.5 as AQI categories

``` yaml
type: gauge
entity: sensor.particulate_matter_2_5um_concentration_2
needle: true
min: 0
max: 300
segments:
  - from: 0
    color: '#00e400'
    label: Good
  - from: 12
    color: '#ffff00'
    label: Moderate
  - from: 35.5
    color: '#ff7e00'
    label: Unhealthy for sensitive groups
  - from: 55.5
    color: '#ff0000'
    label: Unhealthy
  - from: 150.5
    color: '#8f3f97'
    label: Very Unhealthy
  - from: 250.5
    color: '#800000'
    label: Hazardous
name: Air Quality (PM2.5)
```

You can edit a card in the dashboard and click `Show code editor` in the bottom left and paste it in
![Pasted image 20240619145114.png](./DIY%20Air%20Quality%20Sensor/705340f9c761d66a3b84344e73c87a929af8d591.png "wikilink")

# Conclusion

I put it in a box and drilled some holes in it and mounted it on the side of my grandparent's shed. So far so good.
![aqi-mounted.jpeg](./DIY%20Air%20Quality%20Sensor/d70efcaae35bdc734ebd3e80132b0f12e33d9bf4.jpeg "wikilink")

<figure>
<img
src="./DIY%20Air%20Quality%20Sensor/b14a3db5d231b4eff348cfc32a428937370c8d7f.jpg"
title="wikilink" alt="IMG_97162.jpg" />
<figcaption aria-hidden="true">IMG_97162.jpg</figcaption>
</figure>

<figure>
<img
src="./DIY%20Air%20Quality%20Sensor/5ea6442f47364011070f59117a6bce2884b1f149.jpg"
title="wikilink" alt="IMG_9713.jpg" />
<figcaption aria-hidden="true">IMG_9713.jpg</figcaption>
</figure>
