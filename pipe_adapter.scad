
//gears library from: https://github.com/chrisspen/gears

include </home/andre/OpenScad/libraries/gears.scad>

tol = 0.2;
$fn=30;

pipeD = 21.8;

wallT = 2;
screwD = 5;
nutW = 7.95;
nutL = 9;
nutH= 3.9;//5.75;
holderH = nutH+wallT;
gearW = 5;

difference(){
union(){
cylinder(d=pipeD+wallT*2+2*tol,h=holderH+5);
translate([0,0,-gearW])
cylinder(d=20,h=gearW);
    
     translate([0,0,-gearW]){
    spur_gear (modul=1.03, tooth_number=23, width=5, bore=screwD+2*tol, pressure_angle=20, helix_angle=0, optimized=true);
    }//end translate
}//end union


translate([0,0,wallT]){
cylinder(d=pipeD+tol,h=holderH+5);
}//end translate
translate([0,0,-holderH+tol-2])
cylinder(d=screwD+tol,h=holderH+10);

//
//translate([-nutW/2,-nutL/2,-nutH-tol-0.01]){

//cube([nutW,nutL+10,nutH+tol]);
//}//end translate

//translate([0,0,-nutH-10]){
//    rotate([0,0,30]){
//cylinder($fn=6,d=nutW,h=nutH+10);
//    }//end rotate
//}//end translate
}//end difference




