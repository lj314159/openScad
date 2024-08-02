module wall_anchor (
    drill_hole_dm,         // drill hole diameter
    screw_dm,              // screw diameter
    length,                // anchor length
    oversize        = 2,   // outer diameter oversize
    outer_taper     = .75, // outer taper factor
    inner_taper     = .2,  // inner taper factor
    inner_taper_end = .3,  // relative end of inner taper along length
    collar          = .1,  // relative length of initial non slit part
    slit            = .5,  // slit width
    cap_size        = .2   // length of cap size 
    )
{
    difference() {
        outer_dm = drill_hole_dm + oversize;
        side_length = sqrt(pow(drill_hole_dm, 2) / 2);
        // slits
        abs_collar = length * collar;
        for (i = [0:1])
        rotate([0,0,i*90])
        translate([
            -(side_length + 2) / 2,
            -slit / 2,
            abs_collar
        ])
        cube ([
            side_length + 2,
            slit,
            length - cap_size - abs_collar
        ]);
    }
}
wall_anchor(8,5,50);