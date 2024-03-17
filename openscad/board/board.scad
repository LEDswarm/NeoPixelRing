include <../config.scad>;

// The circular circuit board of the NeoPixel ring.
module BoardPcb () {
    color(pcb_color)
    cylinder(d=pcb_diameter, h=pcb_thickness, center = true);

    starting_angle_degrees = 0;

    for (i = [0:7]) {
        current_angle = i * 45;
        x = led_radius / 2 * cos(starting_angle_degrees + current_angle);
        y = led_radius / 2 * sin(starting_angle_degrees + current_angle);
        translate([x, y, 0])
        led(rotation = current_angle);
    }
}

module led (rotation = 0.0) {
    rotate(rotation, [0, 0, 1])
    translate([0, 0, pcb_thickness / 2])
    LED_5050_RGBW();
}