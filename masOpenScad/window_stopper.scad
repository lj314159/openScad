// a window stopper with rotating wedge
// (all sizes in millimeter)

module window_stopper(
    window_thickness,         // thickness of window frame
    windowsill_dist,          // distance between window and windowsill
    windowsill_adj     = 0,   // adjustment for windowsill distance
    stopper_width      = 30,  // width of the stopper
    material_thickness = 5,   // material thickness of the stopper
    window_overlap     = 7,   // overlap of stopper and window
    axle_dm            = 10,  // axle diameter
    axle_clearance     = 0.5, // axle clearance towards bushing
){

    $fn = 36;
    axle_height = 
        material_thickness + (windowsill_dist - material_thickness) / 2;

    module window() {
        color("LightSkyBlue")
        translate( [-20, -window_thickness / 2, windowsill_dist] )
        cube( [100, window_thickness, 0.1] );
    }

    module stopper_case() {
        case_size = [
            stopper_width,                              
            window_thickness + 2 * material_thickness,  
            windowsill_dist + window_overlap    
        ];
        
        translate( [0, -case_size.y / 2, 0] ) 
        difference() {
            cube( case_size );
            
            translate( [-1, material_thickness, material_thickness] )
            cube( [case_size.x + 2, window_thickness, case_size.z] );
            
            axle_bushing = axle_dm + axle_clearance;
            
            translate( [case_size.x / 2, -1, axle_height] )
            rotate( [-90, 0, 0] )
            cylinder( d = axle_bushing, h = case_size.y + 2);
            
            translate( [(case_size.x - axle_bushing) / 2, -1, axle_height] )
            cube( [axle_bushing, case_size.y + 2, case_size.z] );
        }
        
        translate( [0, -case_size.y / 2, -windowsill_adj] )
        cube( [case_size.x, case_size.y, windowsill_adj] );
    }

    module stopper() {
    }
    
    window();    
    stopper_case();    
    stopper();

}

window_stopper(

	/* parameters */

);