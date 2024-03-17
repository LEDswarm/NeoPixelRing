include <../config.scad>;

// The circular circuit board of the NeoPixel ring.
module BoardPcb () {
    cylinder(d=pcb_diameter, h=pcb_thickness);
}