/////
//     General configuration
/////

$fn = 96;

/////
//     PCB circle dimensions
/////

pcb_diameter = 26.5;
pcb_thickness = 1.6;
pcb_radius = pcb_diameter / 2;
pcb_color = [0.2, 0.2, 0.2];
// Height of the SMD pads on the circuit board
smd_pad_height = 0.035;


/////
//     PCB drill holes
/////

// M2 mounting holes
pcb_screw_hole_diameter = 2.0;

/////
//     LED dimensions
/////

// Size is 5050, so five by five millimeters
led_size = 5.0;
led_height = 1.0;

// How far outwards to psuh the LEDs in their octagonal arrangement
led_radius= 20.2;

// How many millimeters the pad is inset from the edge of the LED.
led_smd_pad_inset = 0.4;
// How many millimeters the square pad extends out to the side from the LED edge.
led_smd_pad_outset = 0.2;
led_smd_pad_width = 1.0;
led_smd_pad_height = 1.0;



/////
//     SMD mount dimensions for female USB-C socket
/////

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
usb_through_hole_border_radius = usb_through_hole_height / 2;

// Dimensions and extents of the SMD pads for the USB-C port
usb_smd_pad_height = 1.6;
usb_smd_pad_width = 0.55;
// Horizontal distance between the centers of two USB-C SMD pads
usb_smd_pad_horizontal_spacing = 1.0;

// Total vertical extent of the USB SMD pads, or the distance from the top edge of an upper SMD pad to the bottom edge of a lower SMD pad.
usb_smd_vertical_extent = 2.9;
// Horizontal spacing between the centers of the outermost SMD contacts.
usb_smd_horizontal_spacing = 7.0;