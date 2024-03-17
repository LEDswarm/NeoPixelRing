# A custom NeoPixel ring with a board-to-board USB-C socket

A custom circular PCB with a ring of eight cool-white SK6812 RGBW LEDs on it, used to illuminate the diffusor of an LEDswarm controller enclosure.

Many of the first experiments were done with the NeoPixel Jewels by Adafruit, which is basically a short LED strip of seven NeoPixels arranged in a hexagon and with one in the middle. However, that board turned out to be not easily adaptable to a connector-based, board-to-board design, so we decided to use USB-C to mate the boards and directly use a few pins of a USB-C connection to transfer +5V, the data signal, ground and an optional I2C connection for additional peripherals. 