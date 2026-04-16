// Anna's Farm — Site Two parametric landscape
// 60 x 30 ft, 1800 sqft, 4 boulders (3+1 composition), 3 tons flagstone, 10 solar lights
// Same authoring conventions as site1.cmd.

echo "=== Anna's Farm — Site Two ==="

set -g SITE_W = 60
set -g SITE_D = 30
set -g SITE_AREA_SQFT = 1800
set -g N_BOULDERS = 4
set -g BOULDER_TONS = 4
set -g FLAGSTONE_TONS = 3
set -g N_LIGHTS = 10
set -g ROCK_UNDERLAYER_VIS = 0

opcf /obj
opadd -n geo annas_farm_site2
opcf annas_farm_site2

opadd -n grid ground
opparm ground sizex ${SITE_W} sizey ${SITE_D} rows 61 cols 31 orient ( zx )

opadd -n mountain ground_disp
opparm ground_disp height 0.05 elementsize 2
opconnect ground_disp 0 ground 0

// ── Boulder scatter: 3+1 asymmetric ─────────────────────────────────────────
opadd -n scatter boulder_scatter
opparm boulder_scatter npts ${N_BOULDERS} seed 41
opconnect boulder_scatter 0 ground_disp 0

opadd -n attribwrangle boulder_rules
opparm boulder_rules class points snippet '
// 3+1: main cluster of three center-left, single accent right
int is_accent = (@ptnum == 3);
vector main_anchor = set(-8, 0,  0);
vector accent_anchor = set(16, 0, -4);
vector target = is_accent ? accent_anchor : main_anchor;
@P = lerp(@P, target, 0.65);
@P.y = fit01(rand(@ptnum+1), 0.5, 1.2);
f@size_ft = fit01(rand(@ptnum+7), 1.5, 2.5);
f@yaw_rad = rand(@ptnum+13) * 6.2831853;
i@cluster = is_accent;
'
opconnect boulder_rules 0 boulder_scatter 0

opadd -n sphere boulder_proxy
opparm boulder_proxy type poly rows 8 cols 12 radx 1.0 rady 0.6 radz 1.0
opadd -n copytopoints boulder_copy
opconnect boulder_copy 0 boulder_proxy 0
opconnect boulder_copy 1 boulder_rules 0

// ── Flagstone groupings ─────────────────────────────────────────────────────
opadd -n add flagstone_anchors
opparm flagstone_anchors points 4 usept0 1 pt0 ( -12  0.05  4) usept1 1 pt1 ( -4  0.05  -2) usept2 1 pt2 (  8  0.05  2) usept3 1 pt3 ( 14  0.05  0)

opadd -n scatter flagstone_scatter
opparm flagstone_scatter npts 24 seed 47
opconnect flagstone_scatter 0 flagstone_anchors 0

opadd -n attribwrangle flagstone_rules
opparm flagstone_rules class points snippet '
f@size_ft = fit01(rand(@ptnum+3), 0.8, 1.5);
f@yaw_rad = rand(@ptnum+5) * 6.2831853;
@P.y = 0.02;
'
opconnect flagstone_rules 0 flagstone_scatter 0

opadd -n box flagstone_proxy
opparm flagstone_proxy sizex 1 sizey 0.15 sizez 0.8
opadd -n copytopoints flagstone_copy
opconnect flagstone_copy 0 flagstone_proxy 0
opconnect flagstone_copy 1 flagstone_rules 0

// ── Dry-riverbed accent (along long edge) ──────────────────────────────────
opadd -n curve riverbed_curve
opparm riverbed_curve coords "-28,0.02,-13 -10,0.02,-13 10,0.02,-13 28,0.02,-13"
opadd -n scatter riverbed_scatter
opparm riverbed_scatter npts 60 seed 53
opconnect riverbed_scatter 0 riverbed_curve 0

// ── Solar path lights: rhythmic straight line along long axis ──────────────
opadd -n line walkway_line
opparm walkway_line origin ( -27 0.1 10 ) dir ( 1 0 0 ) dist 54 points ${N_LIGHTS}

opadd -n tube light_post_proxy
opparm light_post_proxy type poly rad1 0.04 rad2 0.04 height 1.5 cap 1

opadd -n copytopoints light_instances
opconnect light_instances 0 light_post_proxy 0
opconnect light_instances 1 walkway_line 0

// ── Merge + GLB export ─────────────────────────────────────────────────────
opadd -n merge scene_merge
opconnect scene_merge 0 ground_disp 0
opconnect scene_merge 1 boulder_copy 0
opconnect scene_merge 2 flagstone_copy 0
opconnect scene_merge 3 riverbed_scatter 0
opconnect scene_merge 4 light_instances 0

opadd -n rop_gltf glb_out
opparm glb_out file '$HIP/../../renders/houdini/site2.glb' sopoutput '$HIP/../../renders/houdini/site2.glb'
opconnect glb_out 0 scene_merge 0

render glb_out
opsave -v $HIP/site2.hip

echo "=== Anna's Farm — Site Two complete ==="
quit
