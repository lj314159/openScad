length=60;
width=2;
height=15;
module myCube() {
cube([length,width,height]);
}
myCube();
translate([60,0,0])
    rotate([0,0,90])
        myCube();
translate([60-width,60,0])
    myCube();
