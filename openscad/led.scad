include <config.scad>;

module LED_5050_RGBW() {
    translate([0, 0, (led_height / 2) + smd_pad_height])
    difference () {
        color([0.6, 0.6, 0.6])
        cube([led_size, led_size, led_height], center=true);

        translate([0, 0, 0.8])
        color([1, 1, 1])
        cylinder(r=(led_size / 2) - 0.15, h=1, center=true);
    }

    led_pad_double();
    mirror([1, 0, 0])
    led_pad_double();
}

module led_pad_double () {
    // LED Pad Top Right
    translate([(led_size / 2) - 0.3, (led_size / 2) - led_smd_pad_height / 2 - led_smd_pad_inset, 0])
    cube([led_smd_pad_width, led_smd_pad_height, smd_pad_height], center = true);

    // LED Pad Bottom Right
    mirror([0, 1, 0])
    translate([(led_size / 2) - 0.3, (led_size / 2) - led_smd_pad_height / 2 - led_smd_pad_inset, 0])
    cube([led_smd_pad_width, led_smd_pad_height, smd_pad_height], center = true);
}