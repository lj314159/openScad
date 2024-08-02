module xhole_plate(size, h_dm, h_num, margin) {
    difference(){
        cube(size);
        h_distance = (size.x - margin) / (h_num + 1);
        for (x = [1:h_num])
        translate ([
            margin + x * h_distance,
            size.y/2,
            -1
        ]) cylinder( d = h_dm, h = size.z + 2, $fn=18);
    }		
}
module shelf_bracket(side_a, side_b, width, thickness) {
difference() {
union() {
	// side A
	xhole_plate(
		[side_a[0], width, thickness],
		side_a[1],
		side_a[2],
		thickness
	);
	// side B
    translate([thickness,0,0])
    rotate([0,-90,0])
	xhole_plate(
		[side_b[0], width, thickness],
		side_b[1],
		side_b[2],
		thickness
	);
	// stringer
	cube([side_a[0], thickness, side_b[0]]);
	translate([0, width - thickness, 0])
	cube([side_a[0], thickness, side_b[0]]);
    }
    diag  = sqrt( pow(side_a[0], 2) + pow(side_b[0], 2) );
    //angle = asin( side_a[0] / diag );
    angle = atan(side_a[0]/side_b[0]);

    translate( [side_a[0], -1, 0] )
    rotate( [0, -angle, 0] )
    cube( [diag, width + 2, diag + 2] );
}
}
module output(templates = false) {
	if (templates) {
		projection(cut = true)
		children(0);		
		translate( [-0.01, 0, 0] )
		projection(cut = true)
		rotate( [0, -90, 0] )
		children(0);		
	} else {
		children(0);
	}
}
//projection(cut = true)
//rotate( [0, -90, 0] )
output(templates = false)
shelf_bracket(
//[length, hole size, number of holes]
  side_a    = [50, 6, 1],
  side_b    = [75, 4, 3],
  width     = 35,
  thickness = 4
);
