/////
//     General configuration
/////

$fn = 96;

/////
//     PCB dimensions
/////

pcb_diameter = 28.5;
pcb_thickness = 1.6;

pcb_radius = pcb_diameter / 2;
pcb_color = [0.2, 0.2, 0.2];
// Height of the SMD pads on the circuit board
smd_pad_height = 0.035;


/////
//     PCB drill holes
/////

pcb_screw_diameter = 2.0;
pcb_screw_hole_diameter = 2.0;

// How far to inset the screw holes from the edge of the PCB
pcb_screw_hole_inset = 0.7;

/////
//     LED dimensions
/////

// Size is 5050, so five by five millimeters
led_size = 5.0;
led_height = 1.0;

// How many LEDs to place in the circle
num_leds = 8;
// Set rotation phase of the LEDs
led_starting_angle = (360 / num_leds) / 2;

// How far outwards to push the LEDs in their octagonal arrangement
led_radius= 20.3;

// How far outwards to put the capacitors
led_capacitor_length = 4 / 2.54;
led_capacitor_width = 2 / 2.54;
led_capacitor_height = 2 / 2.54;

led_capacitor_color = [0.7, 0.45, 0];

led_text_num_radius = 12.5;

led_capacitor_radius= 24.5;
led_capacitor_starting_angle = 45.0;
// Make sure to respect screw holes when placing eight possible capacitor spots on circle.
led_capacitor_distribution = [true, true, true, false, true, true, true, false];

// How many millimeters the pad is inset from the edge of the LED.
led_smd_pad_inset = 0.4;
// How many millimeters the square pad extends out to the side from the LED edge.
led_smd_pad_outset = 0.2;
led_smd_pad_width = 1.5;
led_smd_pad_height = 1.0;


/////
//     SMD mount dimensions for female USB-C socket
/////

// Ensures the vias are aligned to the through holes correctly.
via_correction_factor = 0.07;

// Vertical offset of the USB-C port from the center of the PCB, to accomodate for the breadboard pin vias.
male_usb_c_height = 2.4;
//usb_vertical_offset = pcb_thickness / 2 + male_usb_c_height / 2;
// The male connector is vertically centered.
usb_vertical_offset = 0;

echo("USB vertical offset: ", usb_vertical_offset);

// Pin hole size for the USB-C port
usb_pin_hole_diameter = 0.9;

// Distance between the centers of the two pin holes
usb_pin_hole_spacing = 10.8;

// Horizontal distance between the centers of two USB-C through-hole pins
usb_through_hole_horizontal_spacing = 8.45;
usb_through_hole_vertical_spacing = 4.04;

// Dimensions of the cut holes for the USB-C port
usb_through_hole_width = 1.85;
usb_through_hole_height = 1.0;
usb_through_hole_inner_width = 1.3;
usb_through_hole_inner_height = 0.6;
usb_through_hole_inner_border_radius = usb_through_hole_inner_height / 2;
usb_through_hole_border_radius = usb_through_hole_height / 2;

// Dimensions and extents of the SMD pads for the USB-C port
usb_smd_pad_height = 1.6;
usb_smd_pad_width = 0.55;
// Horizontal distance between the centers of two USB-C SMD pads
usb_smd_pad_horizontal_spacing = 1.0;
// How many pads to place for single contact row in the USB-C SMD connector
usb_smd_pad_num_h = 8;

// Total vertical extent of the USB SMD pads, or the distance from the top edge of an upper SMD pad to the bottom edge of a lower SMD pad.
usb_smd_vertical_extent = 3.9;
// Horizontal spacing between the centers of the outermost SMD contacts.
usb_smd_horizontal_spacing = 7.0;