# Sparkle Shelf

A Raspberry Pi project to control strips of addressable RGB LEDs on a glass shelf, illuminating whatever is on display.

## Overview
Most addressable LED strips cannot be driven by a Raspberry Pi alone and require a microcontroller, such as an Arduino, to be responsible for pushing bits through the data line. As the Raspberry Pi is running an operating system with interrupt-driven hardware, it cannot drive strips like the WS2812b that have strict timing requirements. The APA102 differs from these as it features a 4-wire layout (power, ground, data, clock) vs the common 3-wire (power, ground, data). The existence of the clock input allows data to be pushed through without having to deal with timing issues.

A benefit of being able to drive LEDs with a Pi is being able to use an arbitrary programming language. With an Arduino, it is necessary to do all the programming in a C-like language that has to be compiled onto the chip. As someone who primarily works with high-level languages, this reduces productivity, and consequently enjoyment.

For this project, I developed a small [library](https://github.com/matl33t/apa102_rbpi) in Ruby to interface with a connected APA102 strip. One nice thing about this setup is being able to `ssh` into the Pi over a wireless network and develop using the interactive ruby console. I've found it cumbersome at times to constantly need to recompile microcontroller code connected to a laptop through a mess of wires when controlling the WS2812b.

## Components
- [Raspbbery Pi B+](https://www.raspberrypi.org/products/model-b-plus/)
- [Logic level converter](https://www.sparkfun.com/products/12009)
- [APA102 LED strip "DotStar"](https://www.adafruit.com/product/2238)

## Setup
TODO

## Update Log
### 20160430
- Set up this README
- Hardware state:
  * connections are set up using a breadboard and some loose jumper cables.
  * next goal will be to solder proper connectors and fix the logic level shifter to a stable base.
  * the led strip is too long for the shelf, so it needs to be cut into multiple parts with connectors to line different parts of the shelf.
- Software state:
  * ruby gem is in a working state. it may be desirable to build higher-level abstractions on top of it to control sections of non-contiguous leds.
  * setting up a webserver (i.e. rails, sinatra) will be needed for easier remote control of the lights. having an API and a mobile client is a bit of a stetch goal timewise, but straightforward to implement.

### 20160507
- Hardware state:
  * Soldered into a proto board
  * Mounted strips onto shelf


