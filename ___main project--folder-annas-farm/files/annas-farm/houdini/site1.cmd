// Anna's Farm — Site One parametric landscape
// 60 x 60 ft, 3600 sqft, 6 boulders, 4 tons flagstone, 10 solar lights, dry-riverbed accent line
//
// Run headless:
//   HIP_FILE=site1.hip CMD_FILE=site1.cmd tools/houdini-hbatch-runner.sh
//
// Authoring conventions:
//   - All user-facing numbers come from brief.json; this file mirrors them as HScript vars
//     so pw_Houdini_VEX_Editor ("Pascal editor") can edit VEX on the scatter SOPs without
//     breaking the parameter contract.
//   - Coordinates: +X right, +Z back, +Y up. Units: feet.

echo "=== Anna's Farm — Site One ==="

// ── Parameters from brief.json ──────────────────────────────────────────────
set -g SITE_W = 60
set -g SITE_D = 60
set -g SITE_AREA_SQFT = 3600
set -g N_BOULDERS = 6
set -g BOULDER_TONS = 6
set -g FLAGSTONE_TONS = 4
set -g N_LIGHTS = 10
set -g ROCK_UNDERLAYER_VIS = 0

echo "Params: ${SITE_W}x${SITE_D} ft, ${N_BOULDERS} boulders, ${N_LIGHTS} lights"

// ── Scene root ──────────────────────────────────────────────────────────────
opcf /obj
opadd -n geo annas_farm_site1
opcf annas_farm_site1

// ── Ground plane (decomposed granite field) ─────────────────────────────────
opadd -n grid ground
opparm ground sizex ${SITE_W} sizey ${SITE_D} rows 61 cols 61 orient ( zx )
opparm ground t ( 0 0 0 )

// Displace ground slightly for natural raking-light texture
opadd -n mountain ground_disp
opparm ground_disp height 0.05 elementsize 2
opconnect ground_disp 0 ground 0

// ── Boulder scatter (attribute-driven, VEX-editable via Pascal editor) ──────
opadd -n scatter boulder_scatter
opparm boulder_scatter npts ${N_BOULDERS} seed 17
opconnect boulder_scatter 0 ground_disp 0

opadd -n attribwrangle boulder_rules
opparm boulder_rules class points snippet '
// EDIT ME: boulder size + orientation rules (pw_Houdini_VEX_Editor friendly)
// Cluster weight: foreground-left dominant (3), center-right (2), back-accent (1)
int cluster = (@ptnum < 3) ? 0 : (@ptnum < 5) ? 1 : 2;
vector cluster_anchor[] = array(set(-12, 0,  8),
                                set(  6, 0, -2),
                                set( 14, 0,-18));
@P = lerp(@P, cluster_anchor[cluster], 0.55);
@P.y = fit01(rand(@ptnum+1), 0.6, 1.4);
f@size_ft = fit01(rand(@ptnum+7), 1.5, 3.0);
f@yaw_rad = rand(@ptnum+13) * 6.2831853;
i@cluster = cluster;
'
opconnect boulder_rules 0 boulder_scatter 0

// Copy a boulder proxy onto each scatter point
opadd -n sphere boulder_proxy
opparm boulder_proxy type poly rows 8 cols 12 radx 1.0 rady 0.7 radz 1.0
opadd -n copytopoints boulder_copy
opconnect boulder_copy 0 boulder_proxy 0
opconnect boulder_copy 1 boulder_rules 0

// ── Flagstone groupings ─────────────────────────────────────────────────────
opadd -n add flagstone_anchors
opparm flagstone_anchors points 5 usept0 1 pt0 ( -8  0.05  6) usept1 1 pt1 ( -6  0.05  8) usept2 1 pt2 ( 10  0.05 -4) usept3 1 pt3 ( 12  0.05 -6) usept4 1 pt4 (  0  0.05  0)

opadd -n scatter flagstone_scatter
opparm flagstone_scatter npts 32 seed 23
opconnect flagstone_scatter 0 flagstone_anchors 0

opadd -n attribwrangle flagstone_rules
opparm flagstone_rules class points snippet '
// EDIT ME: flagstone size/rotation
f@size_ft = fit01(rand(@ptnum+3), 0.8, 1.6);
f@yaw_rad = rand(@ptnum+5) * 6.2831853;
@P.y = 0.02;
'
opconnect flagstone_rules 0 flagstone_scatter 0

opadd -n box flagstone_proxy
opparm flagstone_proxy sizex 1 sizey 0.15 sizez 0.8
opadd -n copytopoints flagstone_copy
opconnect flagstone_copy 0 flagstone_proxy 0
opconnect flagstone_copy 1 flagstone_rules 0

// ── Dry-riverbed accent line (rust-ochre rip-rap) ──────────────────────────
opadd -n curve riverbed_curve
opparm riverbed_curve coords "-26,0.02,22 -10,0.02,6 4,0.02,-6 18,0.02,-22"
opadd -n scatter riverbed_scatter
opparm riverbed_scatter npts 80 seed 29
opconnect riverbed_scatter 0 riverbed_curve 0

// ── Solar path lights (instances) ───────────────────────────────────────────
opadd -n curve walkway_curve
opparm walkway_curve coords "-22,0.1,-18 -10,0.1,-10 0,0.1,-2 10,0.1,6 20,0.1,14"

opadd -n resample walkway_samples
opparm walkway_samples maxsegs ${N_LIGHTS} method 0
opconnect walkway_samples 0 walkway_curve 0

opadd -n tube light_post_proxy
opparm light_post_proxy type poly rad1 0.04 rad2 0.04 height 1.5 cap 1

opadd -n copytopoints light_instances
opconnect light_instances 0 light_post_proxy 0
opconnect light_instances 1 walkway_samples 0

// ── Merge everything + export GLB for Claw3D ────────────────────────────────
opadd -n merge scene_merge
opconnect scene_merge 0 ground_disp 0
opconnect scene_merge 1 boulder_copy 0
opconnect scene_merge 2 flagstone_copy 0
opconnect scene_merge 3 riverbed_scatter 0
opconnect scene_merge 4 light_instances 0

opadd -n rop_gltf glb_out
opparm glb_out file '$HIP/../../renders/houdini/site1.glb' sopoutput '$HIP/../../renders/houdini/site1.glb'
opconnect glb_out 0 scene_merge 0

// Execute the GLB export ROP
render glb_out

// Save the HIP for later GUI iteration
opsave -v $HIP/site1.hip

echo "=== Anna's Farm — Site One complete ==="
quit
