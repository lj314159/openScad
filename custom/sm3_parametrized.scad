module missile (
    missileLength   = 30,   //length
    missileRadius   = 1,    //length
    noseRatio       = 4,    //ratio
    midFromNose     = 4,    //length
    midFromLow      = 1,    //length
    midHeight       = 1.7,  //length
    lowLength       = 1,    //length
    lowHeight       = 4,    //length
    lowTopAngle     = 55,   //angle
    lowBottomAngle  = 75,   //angle
    finSharpness    = 5     //angle
)
{
    cylinder(r=missileRadius, h=missileLength); // missile tube
    noseHeight = noseRatio * missileRadius;
    translate([0,0,missileLength])
    cylinder(r1=missileRadius, r2=0, h=noseHeight); // nose
    module lowFin() {
    lx_2 = lowHeight;
    ly_2 = 0;
    lz_2 = lowHeight / tan(lowBottomAngle);
    lx_1 = lowHeight;
    ly_1 = 0;
    lz_1 = lowLength + lz_2;
    lx_5 = 0;
    ly_5 = -lowHeight * tan(finSharpness/2);
    lz_5 = lz_1;
    lx_4 = 0;
    ly_4 = -ly_5;
    lz_4 = lz_5;
    lx_7 = 0;
    ly_7 = ly_5;
    lz_7 = lz_2;
    lx_6 = 0;
    ly_6 = -ly_7;
    lz_6 = lz_7;
    lx_3 = 0;
    ly_3 = 0;
    lz_3 = 0;
    lx_0 = 0;
    ly_0 = 0;
    lz_0 = lz_1 + lowHeight / tan(lowTopAngle);
    lowFinPoints = [
    [lx_0,ly_0,lz_0],
    [lx_1,ly_1,lz_1],
    [lx_2,ly_2,lz_2],
    [lx_3,ly_3,lz_3],
    [lx_4,ly_4,lz_4],
    [lx_5,ly_5,lz_5],
    [lx_6,ly_6,lz_6],
    [lx_7,ly_7,lz_7]];
    lowFinFaces = [
    [0,1,4],
    [1,2,6,4],
    [2,3,6],
    [2,3,7],
    [2,7,5,1],
    [0,1,5],
    [0,4,6,3,7,5]];
    polyhedron(points = lowFinPoints, faces = lowFinFaces);
    }
    //lowFin();
    module midFin() {
    mx_0 = 0;
    my_0 = 0;
    mz_0 = missileLength - missileRadius * noseRatio - midFromNose;
    mx_3 = 0;
    my_3 = 0;
    mz_3 = lowHeight + lowHeight / tan(lowTopAngle) + midFromLow;
    mx_5 = 0;
    my_5 = -lowHeight * tan(finSharpness/2);
    mz_5 = mz_0 - midHeight;
    mx_4 = 0;
    my_4 = -my_5;
    mz_4 = mz_5;
    mx_7 = 0;
    my_7 = my_5;
    mz_7 = mz_3 + midHeight;
    mx_6 = 0;
    my_6 = -my_7;
    mz_6 = mz_7;
    mx_1 = midHeight;
    my_1 = 0;
    mz_1 = mz_5;
    mx_2 = midHeight;
    my_2 = 0;
    mz_2 = mz_7;
    midFinPoints = [
    [mx_0, my_0, mz_0],
    [mx_1, my_1, mz_1],
    [mx_2, my_2, mz_2],
    [mx_3, my_3, mz_3],
    [mx_4, my_4, mz_4],
    [mx_5, my_5, mz_5],
    [mx_6, my_6, mz_6],
    [mx_7, my_7, mz_7]];
    midFinFaces = [
    [0,1,4],
    [1,2,6,4],
    [2,3,6],
    [2,3,7],
    [2,7,5,1],
    [0,1,5],
    [0,4,6,3,7,5]];
    polyhedron(points = midFinPoints, faces = midFinFaces);
    }
    //midFin();
    for (i = [0:3]) {
        rotate([0,0,i*90]){
            lowFin();
            midFin();
        }
    }
}
module aresenal (
    aresenalSize = 10,
    spread = 20
)
{
    for (i = [0:aresenalSize-1]) {
    for (j = [0:aresenalSize-1]) {
        translate([i*spread,0,0]) 
        translate([0,j*spread,0]) 
        missile();
    }
}
for (i = [0:aresenalSize-2]) {
    for (j = [0:aresenalSize-2]) {
        translate([i*spread+spread/2,0,0]) 
        translate([0,j*spread+spread/2,0]) 
        missile();
    }
}
}
$fn = 50;
aresenal();