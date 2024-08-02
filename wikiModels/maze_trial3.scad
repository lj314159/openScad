$fn=50;
length=40;
width=2;
height=15;
module wall() {
cube([length,width,height]);
}
wall();
translate([length,0,0])
    rotate([0,0,90])
        wall();
translate([0,length,0])
    wall();

translate([width,0,0])
    rotate([0,0,90])
        wall();
// ceiling
translate([0,0,height])
    cube([length,length+width,width]);
// laser module
translate([35,5,height-2])
    cylinder(h=4,r=.5);
