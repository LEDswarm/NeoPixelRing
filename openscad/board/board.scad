include <../config.scad>;

include <../capacitor.scad>;
include <../smd/usb_contacts.scad>;

// The circular circuit board of the NeoPixel ring.
module BoardPcb () {
    difference () {
        union () {
            color(pcb_color)
            cylinder(d=pcb_diameter, h=pcb_thickness, center = true);
            
            translate([0, -usb_vertical_offset, 0])
            usb_smd();
        }

        BoardDrillHoles();
    }

    //LedCircularArrangement();
    //CapacitorCircularArrangement();
    //color([0.7, 0.3, 0.3])
    //LedSilkscreenCircularArrangement();
}

module BoardDrillHoles () {
    BoardScrewHole();

    mirror([1, 0, 0])
    BoardScrewHole();

    // usb_pin_hole_spacing
    BoardUsbPinhole();
    mirror([1, 0, 0])
    BoardUsbPinhole();

    translate([0, vertical_center, -3])
    usb_smd_corner_cutouts();
}

module BoardScrewHole () {
    echo("Screw hole at ", pcb_diameter / 2 - pcb_screw_hole_inset - pcb_screw_hole_diameter / 2, " 0 -1");
    translate([pcb_diameter / 2 - pcb_screw_hole_inset - pcb_screw_hole_diameter / 2, 0, -1])
    cylinder(d=pcb_screw_hole_diameter, h=pcb_thickness + 3, center = true);
}

module BoardUsbPinhole () {
    translate([usb_pin_hole_spacing / 2, -usb_vertical_offset, -1])
    cylinder(d=usb_pin_hole_diameter, h=pcb_thickness + 3, center = true);
}

module LedCircularArrangement () {
    for (i = [0 : num_leds - 1]) {
        current_angle = i * (360.0 / num_leds);
        x = led_radius / 2 * cos(led_starting_angle + current_angle);
        y = led_radius / 2 * sin(led_starting_angle + current_angle);
        echo("LED ", i, " at X ", x, "   Y ", y, "     Angle ", led_starting_angle + current_angle);

        translate([x, y, 0])
        led(rotation = led_starting_angle + current_angle);
    }
}

module CapacitorCircularArrangement () {
    for (i = [0 : num_leds - 1]) {
        current_angle = i * (360.0 / num_leds);
        x = led_capacitor_radius / 2 * cos(led_capacitor_starting_angle + current_angle);
        y = led_capacitor_radius / 2 * sin(led_capacitor_starting_angle + current_angle);

        echo("Capacitor ", i, " at X ", x, "   Y ", y, "     Angle ", led_capacitor_starting_angle + current_angle);

        if (led_capacitor_distribution[i]) {
            translate([x, y, 1.2])
            Capacitor(rotation = led_capacitor_starting_angle + current_angle);
        }
    }
}

led_vdd_via_circle_radius = 23.0;

module LedSilkscreenCircularArrangement () {
    for (i = [0 : num_leds - 1]) { // Condition: num_leds - 1
        current_angle = i * (360.0 / num_leds) + 180;
        x = led_vdd_via_circle_radius / 2 * cos(led_starting_angle + current_angle);
        y = led_vdd_via_circle_radius / 2 * sin(led_starting_angle + current_angle);

        echo("LED Silkscreen Number ", i, " at X ", x, "   Y ", y, "     Angle ", led_starting_angle - 20 + current_angle);

        translate([x - 0.2, y - 0.2, 0])
        cylinder(h=4, d=1);

        translate([x + 1.1, y - 3.1, 0])
        cylinder(h=4, d=1);
    }
}

module led (rotation = 0.0) {
    rotate(rotation, [0, 0, 1])
    translate([0, 0, pcb_thickness / 2])
    LED_5050_RGBW();
}