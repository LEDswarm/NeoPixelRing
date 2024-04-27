include <../config.scad>;

radius = usb_through_hole_inner_border_radius;
vertical_center = -usb_vertical_offset;

// The rounded rectangular SMD through-hole cutouts for the four large pins of the USB-C socket.
function usb_smd_corner_cutout_profile(extension=0,edgeRadius=10)=translateRadiiPoints(
    [
      [-usb_through_hole_inner_width / 2, -usb_through_hole_inner_height / 2, radius],
      [usb_through_hole_inner_width / 2, -usb_through_hole_inner_height / 2, radius],
      [usb_through_hole_inner_width / 2, usb_through_hole_inner_height / 2, radius],
      [-usb_through_hole_inner_width / 2, usb_through_hole_inner_height / 2, radius],
    ],
  [0,0]
);

// The outline of the via surrounding one of the through-holes for the four large pins of the USB-C socket.
function usb_smd_corner_via_profile(extension=0,edgeRadius=10)=translateRadiiPoints(
    [
      [-usb_through_hole_width / 2, -usb_through_hole_height / 2, usb_through_hole_border_radius],
      [usb_through_hole_width / 2, -usb_through_hole_height / 2, usb_through_hole_border_radius],
      [usb_through_hole_width / 2, usb_through_hole_height / 2, usb_through_hole_border_radius],
      [-usb_through_hole_width / 2, usb_through_hole_height / 2, usb_through_hole_border_radius],
    ],
  [0,0]
);

module usb_smd_corner_cutout () {
  translate([usb_through_hole_horizontal_spacing / 2, usb_through_hole_vertical_spacing / 2, 0])
  linear_extrude(height = 8) polygon(polyRound(usb_smd_corner_cutout_profile(), $fn));
};

module usb_smd_corner_cutout_row () {
  usb_smd_corner_cutout();

  mirror([1, 0, 0])
  usb_smd_corner_cutout();
};

module usb_smd_corner_cutouts () {
  usb_smd_corner_cutout_row();

  mirror([0, 1, 0])
  usb_smd_corner_cutout_row();
};

module usb_smd_corner_via () {
  translate([usb_through_hole_horizontal_spacing / 2 - via_correction_factor, usb_through_hole_vertical_spacing / 2, (pcb_thickness + 2 * smd_pad_height) / -2])
  linear_extrude(height = pcb_thickness + 2 * smd_pad_height) polygon(polyRound(usb_smd_corner_via_profile(), $fn));
};

module usb_smd_corner_via_row () {
  usb_smd_corner_via();

  mirror([1, 0, 0])
  usb_smd_corner_via();
};

module usb_corner_vias () {
  usb_smd_corner_via_row();

  mirror([0, 1, 0])
  usb_smd_corner_via_row();
}

//  --------

module usb_smd_pin_smd () {
  cube([usb_smd_pad_width, usb_smd_pad_height, smd_pad_height], center = true);
}

//translate([usb_through_hole_horizontal_spacing / 2, 0, 0])
module usb_smd_pin_row () {
  for (i = [0 : usb_smd_pad_num_h - 1]) {
    translate([-(usb_smd_horizontal_spacing / 2) + i * 1, (usb_smd_vertical_extent - 2 * usb_smd_pad_height) / 2 + usb_smd_pad_height / 2, -pcb_thickness / 2])
    usb_smd_pin_smd();
  }
}

module usb_smd() {
  usb_corner_vias();

  usb_smd_pin_row();

  mirror([0, 1, 0])
  usb_smd_pin_row();
}