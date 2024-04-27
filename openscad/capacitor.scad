module Capacitor (rotation = 0.0) {
    color(led_capacitor_color)
    rotate([0, 0, rotation])
    cube([led_capacitor_length, led_capacitor_width, led_capacitor_height], center=true);
}