/*
shaker design:
part to hold rollers and sample holders



*/

$fn=30;
tol=0.1;
wallT = 3;
screwD = 5;
screwL = 10;
spacerL = 10;
spacerD = 8;
nrollers = 4;
rollerD = 24;

offset = 5;
rollerVisible = 0;

difference(){
union(){
    translate([-2*offset,-rollerD/2+2,0]){
cube([nrollers*rollerD+2*offset,2*rollerD,2.9]);
    }
for(i = [1 : nrollers]){
    translate([(i-1)*(rollerD+5),0,2]){
        cylinder(d=spacerD+2*tol+wallT,h=spacerL);   
    }//end translate
}//end for

for(i = [1:nrollers-1]){
    translate([(i-1)*(rollerD+5)+(rollerD+5)/2,rollerD-5.3,2]){
        cylinder(d=spacerD+2*tol+wallT,h=spacerL);
    }//end translate

}//end for

}//end union

for(i = [1 : nrollers]){
    translate([(i-1)*(rollerD+5),0,2]){
        cylinder(d=spacerD+2*tol,h=screwL+10);
        translate([0,0,-5]){
        cylinder(d=screwD+2*tol,h=screwL+20);
            if(rollerVisible==1){
            %cylinder(d=rollerD,h=screwL+20);
            }//end if
        }
    }//end translate

}//end for

for(i = [1:nrollers-1]){
    translate([(i-1)*(rollerD+5)+(rollerD+5)/2,rollerD-5.3,2]){
        cylinder(d=spacerD+2*tol,h=screwL+10);
        translate([0,0,-5]){
        cylinder(d=screwD+2*tol,h=screwL+20);
            if(rollerVisible==1){
            %cylinder(d=rollerD,h=screwL+20);
            }//end if
        }
    }//end translate

}//end for
}//end difference

/*
translate([screwD,8,-1]){
for(i = [1 : nrollers]){
    translate([offset+(i-1)*(rollerD+screwD-2),0,2]){
        cylinder(d=spacerD+2*tol,h=screwL+10);
        translate([0,0,-5]){
        cylinder(d=screwD+2*tol,h=screwL+20);
            if(rollerVisible==1){
            %cylinder(d=rollerD,h=screwL+20);
            }//end if
        }
    }//end translate

}//end for

for(i = [1 : nrollers-1]){
    translate([offset+0.5*(i)*(rollerD+screwD-2),rollerD-rollerD/4+0.1,2]){
        cylinder(d=spacerD+2*tol,h=screwL+10);
        translate([0,0,-5]){
            cylinder(d=screwD+2*tol,h=screwL+20);
            if(rollerVisible==1){
            %cylinder(d=rollerD,h=screwL+20);
            }//end if
            }//end translate
        }//end translate
    }//end for
}//end translate
}//end difference

*/