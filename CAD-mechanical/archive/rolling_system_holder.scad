/*
shaker design:
part to hold rollers and sample holders
//gears library from: https://github.com/chrisspen/gears


*/
include </home/andre/OpenScad/libraries/gears.scad>


$fn=30;
tol=0.1;
wallT = 3;
screwD = 5;
screwL = 10;
spacerL = 10;
spacerD = 8;

rollerD = 24;
pipeD = 21.8;
motorD = 25;
offset = 10;
motorxOffset = 9.3;

nrollers = 4;
useMotor = 1;
rollerVisible = 0;
gearsVisible = 1;

module motor_holder(){


translate([0,-1-(25+wallT)/2,10]){
        cube([10,4,20],center=true);
}//end translate





        difference(){
     cylinder(d=25+wallT,h=20); 
          translate([0,0,-1])  
     cylinder(d=25+2*tol,h=25);   
            }
    
}//end module

module holder(useMotor=1){
difference(){
union(){
    translate([-rollerD/2,-rollerD/2-offset,0]){
    cube([(nrollers+1)*rollerD+2*offset,2*rollerD,2.9]);
    }
for(i = [1 : nrollers]){
    translate([(i-1)*(rollerD+5),0,2-tol]){
        cylinder(d=spacerD+2*tol+wallT,h=spacerL);   
    }//end translate
}//end for

for(i = [1:nrollers-1]){
    translate([(i-1)*(rollerD+5)+(rollerD+5)/2,rollerD-5.3,2-tol]){
        cylinder(d=spacerD+2*tol+wallT,h=spacerL);
    }//end translate

}//end for

}//end union

if (useMotor==1){
    translate([(nrollers+1)*(rollerD)-motorxOffset,0,-tol]){
        cylinder(d=motorD+tol,h=20);}
    }
for(i = [1 : nrollers]){
    translate([(i-1)*(rollerD+5),0,2]){
        cylinder(d=spacerD+2*tol,h=screwL+10);
        translate([0,0,-5]){
        cylinder(d=screwD+2*tol,h=screwL+20);
           if(rollerVisible==1){

           %cylinder(d=rollerD,h=screwL+20);
           %cylinder(d=pipeD,h=screwL+50);
                
            }//end if
        }
    }//end translate

}//end for

for(i = [1:nrollers-1]){
 
    translate([(i-1)*(rollerD+5)+(rollerD+5)/2,rollerD-5.3,2]){
    //if (i==nrollers){
        cylinder(d=spacerD+2*tol,h=screwL+10);
        translate([0,0,-5]){
        cylinder(d=screwD+2*tol,h=screwL+20);
            if(rollerVisible==1){
            %cylinder(d=rollerD,h=screwL+20);
            }//end if
        }//end translate
        
    }//end translate
//}
}//end for

}//end difference




if(gearsVisible==1){
    translate([0,0,10]){
for(i = [1 : nrollers]){
    translate([(i-1)*(rollerD+5),0,2-tol]){
            %spur_gear (modul=1.03, tooth_number=23, width=5, bore=screwD+2*tol, pressure_angle=20, helix_angle=0, optimized=true);
    }//end translate
}//end for
for(i = [1:nrollers-1]){
    translate([(i-1)*(rollerD+5)+(rollerD+5)/2,rollerD-5.3,2-tol]){
        rotate([0,0,10.5]){
            %spur_gear (modul=1.03, tooth_number=23, width=5, bore=screwD+2*tol, pressure_angle=20, helix_angle=0, optimized=true);
        }
    }//end translate

}//end for
    translate([(nrollers+1)*(rollerD)-motorxOffset,0,2-tol]){
            %spur_gear (modul=1.03, tooth_number=23, width=5, bore=screwD+2*tol, pressure_angle=20, helix_angle=0, optimized=true);
    }//end translate
    
}//end translate
}//end if
if (useMotor==1){
    translate([(nrollers+1)*(rollerD)-motorxOffset,0,-20+tol]){motor_holder();}
}//end if
    
}// end module


holder();


translate([-30,0,0]){
mirror([1,0,0]){holder(useMotor=0);}
}