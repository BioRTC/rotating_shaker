//motor adapter
//gears library from: https://github.com/chrisspen/gears
include </home/andre/OpenScad/libraries/gears.scad>


shaftL=9;
shaftD=4;
indentL=8;
indentT=0.5;
screwD = 5;
tol=0.1;
gearW = 5;

$fn=30;
module motor_shaft(){
    difference(){
cylinder(d=shaftD,h=shaftL);
translate([shaftD/2-indentT,-((shaftD+1)/2),1])
cube([indentT,shaftD+1,indentL+1]);
    }//end difference
}//end module


difference(){
spur_gear (modul=1.03, tooth_number=23,width=5, bore=0, pressure_angle=20,helix_angle=0, optimized=true);

translate([0,0,-3]){
motor_shaft();
}//end translate
}//end difference