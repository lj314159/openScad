module missile (
    missileLength   = 30,   //length
    missileRadius   = 1,    //length
    noseRatio       = 4,    //ratio
    midFromNose     = 0.25, //ratio
    midFromLow      = 0.25, //ratio
    midHeight       = 1,    //length
    lowHeight       = 2,    //length
    lowTopAngle     = 60,   //angle
    lowBottomAngle  = 80,   //angle
    finSharpness    = 10    //angle
)
{
    cylinder(r=missileRadius, h=missileLength); // missile tube
    noseHeight = noseRatio * missileRadius;
    translate([0,0,missileLength])
    cylinder(r1=missileRadius, r2=0, h=noseHeight); // nose
    lowFinPoints = [
    [0, 0, 5],     //0
    [0,0.5, 1],    //1
    [4, 0, 2],     //2
    [0, -0.5, 1]]; //3
    lowFinFaces = [
    [0,1,2],
    [0,1,3],
    [0,2,3],
    [1,2,3]];
    polyhedron(points = lowFinPoints, faces = lowFinFaces);
}
$fn = 50;
missile();