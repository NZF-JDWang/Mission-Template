_box = (_this select 0);

[_box, false, [0, 0, 0], 0] call ace_dragging_fnc_setDraggable;   
[_box, false, [0, 0, 0], 0] call ace_dragging_fnc_setCarryable;   
clearMagazineCargo _box;
clearWeaponCargo _box;
clearItemCargoGlobal _box;
clearBackpackCargo _box;
_box allowDamage false;

private _nameID = ((squadparams player) Select 1) select 1;

_playerRole = roleDescription player;
private "_role";

if ("Command" in _playerRole) then {_role = "command"};
if ("Leader" in _playerRole) then {_role = "command"};
if ("JTAC" in _playerRole) then {_role = "command"};
if ("Combat" in _playerRole) then {_role = "CLS"; player setVariable ["Ace_medical_medicClass", 1];}; 
if ("edic" in _playerRole) then {_role = "Medic"; player setVariable ["Ace_medical_medicClass", 2];}; 
if ("EOD" in _playerRole) then {_role = "Engineer"; player setVariable ["ACE_isEngineer", 2, true]; player setUnitTrait ["UAVHacker", true];}; 
if ("Machinegunner" in _playerRole) then {_role = "Machinegunner"};
if ("Marksman" in _playerRole) then {_role = "Marksman"};
if ("Operator" in _playerRole) then {_role = "Operator"};
if ("Pilot" in _playerRole) then {_role = "Helicopter"};
if ("CoPilot" in _playerRole) then {_role = "Helicopter"};
if ("TEST" in _playerRole) then {_role = "Operator"};
if ("ZEUS" in _playerRole) exitwith {};
//*******************************************************************

//*******************************************************************
_pmcUniforms = [
	"CUP_I_B_PMC_Unit_37",
	"CUP_I_B_PMC_Unit_38",
	"CUP_I_B_PMC_Unit_36",
	"CUP_I_B_PMC_Unit_39",
	"CUP_I_B_PMC_Unit_40",
	"CUP_I_B_PMC_Unit_43",
	"CUP_I_B_PMC_Unit_41",
	"CUP_I_B_PMC_Unit_42"
];

_heliHelmet = ["H_CrewHelmetHeli_B"];

_genericGear = [
//headgear
	"VSM_BackwardsHat_Peltor_black",
	"VSM_BackwardsHat_Peltor_CMMG",
	"VSM_BackwardsHat_Peltor_ION",
	"VSM_BackwardsHat_Peltor_OD",
	"VSM_BackwardsHat_Peltor_Sero",
	"VSM_BackwardsHat_Peltor_tan",
	"VSM_BackwardsHat_Peltor_US",
	"VSM_Beanie_Black",
	"VSM_Beanie_OD",
	"VSM_Beanie_tan",
	"VSM_Multicam_Boonie",
	"VSM_AOR1_Boonie",
	"VSM_OGA_Helmet1",
	"VSM_OGA_OD_Helmet1",
	"VSM_OGA_Helmet2",
	"VSM_OGA_OD_Helmet2",
	"VSM_OPS_2_multicam",
	"VSM_OD_Spray_OPS_2",
	"VSM_OGA_OD_OPS_2",
	"VSM_oga_OPS_2",
	"VSM_Tan_spray_OPS_2",
	"VSM_OPS_2_AOR1",
	"VSM_Peltor_coyote",
	"CUP_H_USA_Cap_Mcam_DEF",
	"CUP_H_USA_Cap_UT_DEF",
	"CUP_H_USA_Cap_PUNISHER_DEF",
	"CUP_H_USA_Cap_NY_DEF",
	"CUP_H_USA_Cap_MARSOC_DEF",
	"CUP_H_USA_Cap_TREAD_DEF",
	"CUP_H_USA_Cap_AU_DEF",
//Uniforms
	"VSM_Multicam_Crye_Tee_Camo",
	"VSM_Multicam_Crye_SS_Camo",
	"VSM_Multicam_Crye_SS_tan_shirt_Camo",
	"VSM_Multicam_Crye_SS_od_shirt_Camo",
	"VSM_Multicam_Crye_SS_grey_shirt_Camo",
	"VSM_Multicam_Crye_Camo",
	"VSM_Multicam_Crye_tan_shirt_Camo",
	"VSM_Multicam_Crye_od_shirt_Camo",
	"VSM_Multicam_Crye_grey_shirt_Camo",
	"VSM_AOR1_Crye_grey_shirt_Camo",
	"VSM_AOR1_Crye_od_shirt_Camo",
	"VSM_AOR1_Crye_tan_shirt_Camo",
	"VSM_AOR1_Crye_Camo",
	"VSM_AOR1_Crye_SS_grey_shirt_Camo",
	"VSM_AOR1_Crye_SS_od_shirt_Camo",
	"VSM_AOR1_Crye_SS_tan_shirt_Camo",
	"VSM_AOR1_Crye_SS_Camo",
	"VSM_AOR1_Crye_Tee_Camo",
//Facewear
	"CUP_G_ESS_BLK_Facewrap_Black",
	"CUP_G_ESS_RGR_Facewrap_Skull",
	"CUP_G_ESS_KHK_Facewrap_Tan",
	"CUP_G_ESS_BLK_Scarf_Blk_Beard_Blonde",
	"CUP_G_ESS_BLK_Scarf_Blk_Beard",
	"CUP_G_ESS_BLK_Scarf_Grn_Beard",
	"CUP_G_ESS_BLK_Scarf_Grn_Beard_Blonde",
	"CUP_G_ESS_BLK_Scarf_Red_Beard",
	"CUP_G_ESS_BLK_Scarf_Red_Beard_Blonde",
	"CUP_G_ESS_KHK_Scarf_Tan_Beard",
	"CUP_G_ESS_KHK_Scarf_Tan_Beard_Blonde",
	"CUP_G_ESS_BLK_Scarf_White_Beard_Blonde",
	"CUP_G_ESS_BLK_Scarf_White_Beard",
	"CUP_G_ESS_BLK_Scarf_Grn_GPS",
	"CUP_G_ESS_KHK_Scarf_Tan_GPS",
	"CUP_G_ESS_BLK_Scarf_White_GPS",
	"CUP_G_Grn_Scarf_Shades",
	"CUP_G_Tan_Scarf_Shades",
	"CUP_G_White_Scarf_Shades",
	"CUP_G_Grn_Scarf_Shades_Beard_Blonde",
	"CUP_G_Grn_Scarf_Shades_Beard",
	"CUP_G_Tan_Scarf_Shades_Beard",
	"CUP_G_Tan_Scarf_Shades_Beard_Blonde",
	"CUP_G_White_Scarf_Shades_Beard",
	"CUP_G_White_Scarf_Shades_Beard_Blonde",
	"CUP_G_Beard_Shades_Black",
	"CUP_G_Beard_Shades_Blonde",
	"CUP_G_Grn_Scarf_Shades_GPSCombo",
	"CUP_G_Tan_Scarf_Shades_GPSCombo",
	"CUP_G_White_Scarf_Shades_GPSCombo",
	"CUP_G_Grn_Scarf_Shades_GPSCombo_Beard_Blonde",
	"CUP_G_Grn_Scarf_Shades_GPSCombo_Beard",
	"CUP_G_Tan_Scarf_Shades_GPSCombo_Beard",
	"CUP_G_Tan_Scarf_Shades_GPSCombo_Beard_Blonde",
	"CUP_G_White_Scarf_Shades_GPSCombo_Beard",
	"CUP_G_White_Scarf_Shades_GPSCombo_Beard_Blonde",
	"CFP_Oakley_Goggles_Blk",
	"CFP_Oakley_Goggles_Grn",
	"CFP_Oakley_Goggles_DTan",
	"CFP_Oakley_Goggles_MCam",
	"CFP_Oakley_Goggles_Blk_Drk",
	"CFP_Oakley_Goggles_DTan_Drk",
	"CFP_Oakley_Goggles_Grn_Drk",
	"CFP_Oakley_Goggles_MCam_Drk",
	"CFP_Tac_Goggles_Blk_Clr",
	"CFP_Tac_Goggles_Blk_Drk",
	"CFP_Tac_Goggles_Smoke_Citrus",
	"CFP_Tac_Goggles_Tan_Clr",
	"CFP_Tac_Goggles_Tan_Drk",
	"CFP_Tac_Goggles_Blk_Ylw",
	"CUP_G_Grn_Scarf_GPS_Beard_Blonde",
	"CUP_G_Grn_Scarf_GPS_Beard",
	"CUP_G_Tan_Scarf_GPS_Beard_Blonde",
	"CUP_G_Tan_Scarf_GPS_Beard",
	"CUP_G_White_Scarf_GPS_Beard",
	"CUP_G_White_Scarf_GPS_Beard_Blonde",
	"rhsusf_shemagh_od",
	"rhsusf_shemagh2_od",
	"rhsusf_shemagh_tan",
	"rhsusf_shemagh2_tan",
	"rhsusf_shemagh_gogg_od",
	"rhsusf_shemagh2_gogg_od",
	"rhsusf_shemagh_gogg_tan",
	"rhsusf_shemagh2_gogg_tan",
	"rhsusf_oakley_goggles_blk",
	"rhsusf_oakley_goggles_clr",
	"rhsusf_oakley_goggles_ylw",
	"VSM_balaclava2_Black",
	"VSM_Balaclava2_black_Peltor",
	"VSM_Balaclava2_OD_Peltor",
	"VSM_Balaclava2_tan_Peltor",
	"VSM_FaceMask_black",
	"VSM_FaceMask_Ghost",
	"VSM_FaceMask_Ghost_olive",
	"VSM_FaceMask_Ghost_tan",
	"VSM_FaceMask_olive",
	"VSM_FaceMask_tan",
	"VSM_Facemask_black_Goggles",
	"VSM_Facemask_OD_Goggles",
	"VSM_Facemask_tan_Goggles",
	"VSM_Facemask_black_Peltor",
	"VSM_Facemask_OD_Peltor",
	"VSM_Facemask_tan_Peltor",
	"VSM_Facemask_black_Peltor_Goggles",
	"VSM_Facemask_OD_Peltor_Goggles",
	"VSM_Facemask_tan_Peltor_Goggles",
	"VSM_Goggles",
	"VSM_Peltor_coyote_glasses",
	"VSM_Peltor_OD_glasses",
	"VSM_Shemagh_OD",
	"VSM_Shemagh_tan",
	"VSM_Shemagh_Balaclava2_OD",
	"VSM_Shemagh_Balaclava2_tan",
	"VSM_Shemagh_Balaclava2_OD_Peltor",
	"VSM_Shemagh_Balaclava2_tan_Peltor",
	"VSM_Shemagh_Facemask_OD",
	"VSM_Shemagh_Facemask_tan",
	"VSM_Shemagh_Facemask_OD_Goggles",
	"VSM_Shemagh_Facemask_tan_Goggles",
	"VSM_Shemagh_Facemask_OD_Peltor",
	"VSM_Shemagh_Facemask_tan_Peltor",
	"VSM_Shemagh_Facemask_OD_Peltor_Goggles",
	"VSM_Shemagh_Facemask_tan_Peltor_Goggles",
	"VSM_Shemagh_Glasses_OD",
	"VSM_Shemagh_glasses_tan",
	"VSM_Shemagh_Goggles_OD",
	"VSM_Shemagh_goggles_tan",
//Backpacks
	"VSM_OGA_OD_Backpack_Kitbag",
	"VSM_OGA_Backpack_Kitbag",
	"VSM_OGA_OD_Backpack_Compact",
	"VSM_OGA_Backpack_Compact",
	"VSM_Multicam_Backpack_Kitbag",
	"VSM_Multicam_Backpack_Compact",
	"VSM_AOR1_Backpack_Compact",
	"VSM_AOR1_Backpack_Kitbag",
	"B_LegStrapBag_black_F",
	"B_LegStrapBag_coyote_F",
	"B_LegStrapBag_olive_F",
//NVG's
	"CUP_NVG_GPNVG_black",
//Ammo 
	"ACE_7Rnd_408_305gr_Mag",
	"Tier1_20Rnd_762x51_M118_Special_SR25_Mag",
	"rhs_mag_20Rnd_SCAR_762x51_m118_special",
	"rhsusf_100Rnd_556x45_mixed_soft_pouch_coyote",
	"rhs_mag_30Rnd_556x45_M855A1_PMAG",
	"rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",
	"rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan",
	"rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red",
	"rhsusf_mag_40Rnd_46x30_AP",
	"rhsusf_mag_40Rnd_46x30_FMJ",
	"rhsusf_mag_40Rnd_46x30_JHP",
	"rhsusf_5Rnd_00Buck",
	"rhsusf_5Rnd_Slug",
	"UK3CB_BAF_762_100Rnd",
	"UK3CB_BAF_762_100Rnd_T",
	"UK3CB_BAF_762_200Rnd",
	"UK3CB_BAF_762_200Rnd_T",
	"UK3CB_BAF_338_5Rnd",
	"murshun_cigs_cigpack",
	"murshun_cigs_lighter",
//Throwables
	"ACE_Chemlight_HiBlue",
	"ACE_Chemlight_HiGreen",
	"ACE_Chemlight_HiRed",
	"ACE_Chemlight_HiWhite",
	"ACE_Chemlight_HiYellow",
	"ACE_Chemlight_IR",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_White",
	"ACE_HandFlare_Yellow",
	"ACE_M84",
	"rhs_mag_an_m8hc",
	"rhs_mag_m18_green",
	"rhs_mag_m18_purple",
	"rhs_mag_m18_red",
	"rhs_mag_m18_yellow",
	"rhs_mag_m67",
	"MS_Strobe_Mag_1",
	"MS_Strobe_Mag_2",
//Explosives
	"AMP_Breaching_Charge_Mag",
//Misc
	"ACE_RangeTable_82mm",
	"ACE_artilleryTable",
	"acex_intelitems_notepad",
	"ACE_SpareBarrel",
	"ACE_key_lockpick",
	"ACE_key_west",
	"Nikon_DSLR_HUD",
	"Hate_Smartphone_HUD",
	"rhsusf_bino_m24_ARD",
	"ItemMap",
	"B_UavTerminal",
	"ItemCompass",
	"ATM_ALTIMETER",
	"ACRE_PRC343",
	"sps_black_hornet_01_Static_F",
	"ACE_CableTie",
	"ACE_Chemlight_Shield",
	"ACE_EarPlugs",
	"ACE_EntrenchingTool",
	"ACE_Fortify",
	"ACE_Flashlight_MX991",
	"ItemAndroid",
	"ItemcTabHCam",
	"ACE_IR_Strobe_Item",
	"ACE_Flashlight_XL50",
	"ACE_MapTools",
	"ACE_microDAGR",
	"ACE_SpraypaintBlack",
	"ACE_SpraypaintBlue",
	"ACE_SpraypaintGreen",
	"ACE_SpraypaintRed",
	"ACE_wirecutter",
	"hgun_esd_01_F",
	"Laserbatteries",
	"muzzle_antenna_02_f"
];

_leaderVests = [
	"CUP_V_CPC_communications_coy",
	"CUP_V_CPC_tl_coy",
	"CUP_V_CPC_communicationsbelt_coy",
	"CUP_V_CPC_tlbelt_coy",
	"CUP_V_CPC_communications_mc",
	"CUP_V_CPC_tl_mc",
	"CUP_V_CPC_communicationsbelt_mc",
	"CUP_V_CPC_tlbelt_mc",
	"CUP_V_CPC_communications_rngr",
	"CUP_V_CPC_tl_rngr",
	"CUP_V_CPC_communicationsbelt_rngr",
	"CUP_V_CPC_tlbelt_rngr",
	"rhsusf_plateframe_teamleader",
	"VSM_LBT6094_operator_Multicam",
	"VSM_FAPC_Operator_Multicam",
	"VSM_LBT6094_operator_OGA",
	"VSM_FAPC_Operator_OGA",
	"VSM_LBT6094_operator_OGA_OD",
	"VSM_FAPC_Operator_OGA_OD",
	"VSM_FAPC_Operator_AOR1",
	"VSM_LBT6094_operator_AOR1",
	"VSM_RAV_Breacher_Multicam",
	"VSM_RAV_operator_Multicam",
	"VSM_RAV_Breacher_AOR1",
	"VSM_RAV_operator_AOR1"
];

_medicVests = [
	"CUP_V_CPC_medical_coy",
	"CUP_V_CPC_medicalbelt_coy",
	"CUP_V_CPC_medical_mc",
	"CUP_V_CPC_medicalbelt_mc",
	"CUP_V_CPC_medical_rngr",
	"CUP_V_CPC_medicalbelt_rngr",
	"rhsusf_plateframe_medic",
	"VSM_LBT6094_operator_Multicam",
	"VSM_FAPC_Operator_Multicam",
	"VSM_LBT6094_operator_OGA",
	"VSM_FAPC_Operator_OGA",
	"VSM_LBT6094_operator_OGA_OD",
	"VSM_FAPC_Operator_OGA_OD",
	"VSM_FAPC_Operator_AOR1",
	"VSM_LBT6094_operator_AOR1",
	"VSM_RAV_Breacher_Multicam",
	"VSM_RAV_operator_Multicam",
	"VSM_RAV_Breacher_AOR1",
	"VSM_RAV_operator_AOR1"
];

_machinegunnerVests = [
	"rhsusf_plateframe_machinegunner",
	"VSM_FAPC_MG_Multicam",
	"VSM_LBT6094_MG_Multicam",
	"VSM_FAPC_MG_OGA",
	"VSM_LBT6094_MG_OGA",
	"VSM_FAPC_MG_OGA_OD",
	"VSM_LBT6094_MG_OGA_OD",
	"VSM_FAPC_MG_AOR1",
	"VSM_LBT6094_MG_AOR1",
	"VSM_RAV_MG_AOR1",
	"VSM_RAV_MG_Multicam"
];

_marksmanVests = [
	"CUP_V_CPC_light_coy",
	"CUP_V_CPC_lightbelt_coy",
	"CUP_V_CPC_light_mc",
	"CUP_V_CPC_lightbelt_mc",
	"CUP_V_CPC_light_rngr",
	"CUP_V_CPC_lightbelt_rngr",
	"rhsusf_plateframe_marksman",
	"VSM_FAPC_Operator_Multicam",
	"VSM_FAPC_Operator_OGA",
	"VSM_FAPC_Operator_OGA_OD",
	"VSM_FAPC_Operator_AOR1"
];

_operatorVests = [
	"CUP_V_CPC_Fast_coy",
	"CUP_V_CPC_weapons_coy",
	"CUP_V_CPC_Fastbelt_coy",
	"CUP_V_CPC_weaponsbelt_coy",
	"CUP_V_CPC_Fast_mc",
	"CUP_V_CPC_weapons_mc",
	"CUP_V_CPC_Fastbelt_mc",
	"CUP_V_CPC_weaponsbelt_mc",
	"CUP_V_CPC_Fast_rngr",
	"CUP_V_CPC_weapons_rngr",
	"CUP_V_CPC_Fastbelt_rngr",
	"CUP_V_CPC_weaponsbelt_rngr",
	"rhsusf_plateframe_light",
	"rhsusf_plateframe_rifleman",
	"VSM_LBT6094_operator_Multicam",
	"VSM_FAPC_Operator_Multicam",
	"VSM_LBT6094_operator_OGA",
	"VSM_FAPC_Operator_OGA",
	"VSM_LBT6094_operator_OGA_OD",
	"VSM_FAPC_Operator_OGA_OD",
	"VSM_FAPC_Operator_AOR1",
	"VSM_LBT6094_operator_AOR1",
	"VSM_RAV_Breacher_Multicam",
	"VSM_RAV_operator_Multicam",
	"VSM_RAV_Breacher_AOR1",
	"VSM_RAV_operator_AOR1"
];

_basicMedical = [
	"nzf_FAK",
	"kat_Pulseoximeter"
];

_advancedMedical = [
	"kat_accuvac",
	"nzf_Medikit",
	"kat_stethoscope",
	"kat_Pulseoximeter"
];

_drugs = [
	"kat_larynx",	
	"ACE_personalAidKit",	
	"kat_X_AED",
	"kat_amiodarone",
	"kat_lidocaine",
	"kat_phenylephrine"
];

_firesupport = [
	"UK3CB_BAF_L7A2",
	"UK3CB_BAF_L16_Tripod",
	"UK3CB_BAF_Javelin_Slung_Tube",
	"UK3CB_BAF_L16",
	"UK3CB_BAF_M6",
	"UK3CB_BAF_Javelin_CLU",
	"ACE_RangeTable_82mm",
	"ACE_artilleryTable",
	"ACE_RangeCard",
	"ace_dragon_super",
	"ace_dragon_sight"
];

_pistols = [
	"Tier1_Glock19_Urban_TB",
	"Tier1_Glock22_TB_Rail",
	"Tier1_P320_TB",
	"Tier1_P320_PMM",
	"tier1_evo9",
	"tier1_tirant9",
	"tier1_tirant9s",
	"tier1_agency_compensator",
	"tier1_octane9",
	"tier1_dbalpl",
	"tier1_dbalpl_fl",
	"tier1_tlr1",
	"tier1_x300u",
	"tier1_docter",
	"tier1_mrds",
	"tier1_sig_romeo1",
	"tier1_docter_ris",
	"tier1_microt1_low_black",
	"tier1_microt2_low_black",
	"tier1_romeo4t_bcd_low_black",
	"tier1_romeo4t_bcq_low_black",
	"Tier1_15Rnd_9x19_FMJ",
	"Tier1_15Rnd_9x19_JHP",
	"Tier1_20Rnd_9x19_FMJ",
	"Tier1_20Rnd_9x19_JHP",
	"Tier1_15Rnd_40SW_JHP",
	"Tier1_15Rnd_40SW_FMJ",
	"Tier1_20Rnd_40SW_JHP",
	"Tier1_20Rnd_40SW_FMJ",
	"Tier1_17Rnd_9x19_P320_FMJ",
	"Tier1_17Rnd_9x19_P320_JHP",
	"Tier1_21Rnd_9x19_P320_FMJ",
	"Tier1_21Rnd_9x19_P320_JHP",
	"rhs_weap_M320",
	"ACE_40mm_Flare_ir",
	"rhs_mag_M397_HET",
	"rhs_mag_M433_HEDP",
	"rhs_mag_M441_HE",
	"rhs_mag_M583A1_white",
	"rhs_mag_M585_white_cluster",
	"rhs_mag_m661_green",
	"rhs_mag_m662_red",
	"rhs_mag_M663_green_cluster",
	"rhs_mag_M664_red_cluster",
	"rhs_mag_m713_Red",
	"rhs_mag_m714_White",
	"rhs_mag_m715_Green",
	"rhs_mag_m716_yellow"
];

_launchers = [
	"UK3CB_BAF_Javelin_CLU",
	"UK3CB_BAF_Javelin_Slung_Tube",
	"UK3CB_BAF_NLAW_Launcher",
	"launch_MRAWS_green_F",
	"MRAWS_HE_F",
	"MRAWS_HEAT55_F",
	"MRAWS_HEAT_F",
	"rhs_weap_m72a7",
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	"ace_dragon_super",
	"ace_dragon_sight"
];

_marksmanRifles = [
	"Tier1_SR25_EC_tan",
	"Tier1_SR25_EC",
	"Tier1_SR25_tan",
	"Tier1_SR25",
	"Tier1_M110k5_ACS",
	"Tier1_M110k5",
	"Tier1_M110k1_CTR",
	"Tier1_M110k1",
	"tier1_leupoldm3a_geissele_docter_tan",
	"tier1_leupoldm3a_geissele_docter_black",
	"tier1_leupoldm3a_adm_t2_tan",
	"tier1_leupoldm3a_adm_t2_black",
	"rhsusf_acc_nxs_3515x50f1_md_sun",
	"tier1_anpvs10_tan",
	"UK3CB_BAF_L115A3_DE",
	"uk3cb_underbarrel_acc_bipod",
	"rksl_optic_pmii_525",
	"rksl_optic_pmii_312_sunshade"
];

_machineguns = [
	"UK3CB_BAF_L7A2",
	"Tier1_MK46_Mod1_Savit_Desert",
	"Tier1_MK46_Mod1_Savit",
	"Tier1_MK46_Mod1_Desert",
	"Tier1_MK46_Mod1",
	"Tier1_MK46_Mod0_Para_Desert",
	"Tier1_MK46_Mod0_Para",
	"Tier1_MK46_Mod0_Desert",
	"Tier1_MK46_Mod0"
];

_rifles = [
	"Tier1_HK416D10_CTR",
	"Tier1_HK416D10_CTR_Desert",
	"Tier1_HK416D10_LMT",
	"Tier1_HK416D10_LMT_Desert",
	"Tier1_HK416D10_MW9_CTR",
	"Tier1_HK416D10_MW9_CTR_BlackDesert",
	"Tier1_HK416D10_MW9_CTR_Desert",
	"Tier1_HK416D10_MW9_IMOD",
	"Tier1_HK416D10_MW9_IMOD_BlackDesert",
	"Tier1_HK416D10_MW9_IMOD_Desert",
	"Tier1_HK416D10_MW9_LMT",
	"Tier1_HK416D10_MW9_LMT_BlackDesert",
	"Tier1_HK416D10_MW9_LMT_Desert",
	"Tier1_HK416D10_MW9_MFT",
	"Tier1_HK416D10_MW9_MFT_BlackDesert",
	"Tier1_HK416D10_MW9_MFT_Desert",
	"Tier1_HK416D10_RAHG_CTR",
	"Tier1_HK416D10_RAHG_CTR_BlackDesert",
	"Tier1_HK416D10_RAHG_CTR_Desert",
	"Tier1_HK416D10_RAHG_IMOD",
	"Tier1_HK416D10_RAHG_IMOD_BlackDesert",
	"Tier1_HK416D10_RAHG_IMOD_Desert",
	"Tier1_HK416D10_RAHG_LMT",
	"Tier1_HK416D10_RAHG_LMT_BlackDesert",
	"Tier1_HK416D10_RAHG_LMT_Desert",
	"Tier1_HK416D10_RAHG_MFT",
	"Tier1_HK416D10_RAHG_MFT_BlackDesert",
	"Tier1_HK416D10_RAHG_MFT_Desert",
	"Tier1_HK416D10_SMR_CTR",
	"Tier1_HK416D10_SMR_CTR_BlackDesert",
	"Tier1_HK416D10_SMR_CTR_Desert",
	"Tier1_HK416D10_SMR_IMOD",
	"Tier1_HK416D10_SMR_IMOD_BlackDesert",
	"Tier1_HK416D10_SMR_IMOD_Desert",
	"Tier1_HK416D10_SMR_LMT",
	"Tier1_HK416D10_SMR_LMT_BlackDesert",
	"Tier1_HK416D10_SMR_LMT_Desert",
	"Tier1_HK416D10_SMR_MFT",
	"Tier1_HK416D10_SMR_MFT_BlackDesert",
	"Tier1_HK416D10_SMR_MFT_Desert",
	"Tier1_HK416D145_CTR",
	"Tier1_HK416D145_CTR_Desert",
	"Tier1_HK416D145_LMT",
	"Tier1_HK416D145_LMT_Desert",
	"Tier1_HK416D145_MW13_CTR",
	"Tier1_HK416D145_MW13_CTR_BlackDesert",
	"Tier1_HK416D145_MW13_CTR_Desert",
	"Tier1_HK416D145_MW13_IMOD",
	"Tier1_HK416D145_MW13_IMOD_BlackDesert",
	"Tier1_HK416D145_MW13_IMOD_Desert",
	"Tier1_HK416D145_MW13_LMT",
	"Tier1_HK416D145_MW13_LMT_BlackDesert",
	"Tier1_HK416D145_MW13_LMT_Desert",
	"Tier1_HK416D145_MW13_MFT",
	"Tier1_HK416D145_MW13_MFT_BlackDesert",
	"Tier1_HK416D145_MW13_MFT_Desert",
	"Tier1_HK416D145_RAHG_CTR",
	"Tier1_HK416D145_RAHG_CTR_BlackDesert",
	"Tier1_HK416D145_RAHG_CTR_Desert",
	"Tier1_HK416D145_RAHG_IMOD",
	"Tier1_HK416D145_RAHG_IMOD_BlackDesert",
	"Tier1_HK416D145_RAHG_IMOD_Desert",
	"Tier1_HK416D145_RAHG_LMT",
	"Tier1_HK416D145_RAHG_LMT_BlackDesert",
	"Tier1_HK416D145_RAHG_LMT_Desert",
	"Tier1_HK416D145_RAHG_MFT",
	"Tier1_HK416D145_RAHG_MFT_BlackDesert",
	"Tier1_HK416D145_RAHG_MFT_Desert",
	"Tier1_HK416D145_SMR_CTR",
	"Tier1_HK416D145_SMR_CTR_BlackDesert",
	"Tier1_HK416D145_SMR_CTR_Desert",
	"Tier1_HK416D145_SMR_IMOD",
	"Tier1_HK416D145_SMR_IMOD_BlackDesert",
	"Tier1_HK416D145_SMR_IMOD_Desert",
	"Tier1_HK416D145_SMR_LMT",
	"Tier1_HK416D145_SMR_LMT_BlackDesert",
	"Tier1_HK416D145_SMR_LMT_Desert",
	"Tier1_HK416D145_SMR_MFT",
	"Tier1_HK416D145_SMR_MFT_BlackDesert",
	"Tier1_HK416D145_SMR_MFT_Desert",
	"Tier1_SIG_MCX_115_Virtus",
	"Tier1_SIG_MCX_115_Virtus_Black",
	"Tier1_SIG_MCX_115_Virtus_Desert",
	"Tier1_SIG_MCX_115_Virtus_FDE",
	"Tier1_SR16_Carbine_Mod2_CTR_Black",
	"Tier1_SR16_Carbine_Mod2_CTR_FDE",
	"Tier1_SR16_Carbine_Mod2_IMOD_Black",
	"Tier1_SR16_Carbine_Mod2_IMOD_FDE",
	"Tier1_SR16_Carbine_Mod2_LMT_Black",
	"Tier1_SR16_Carbine_Mod2_LMT_FDE",
	"Tier1_SR16_Carbine_Mod2_MFT_Black",
	"Tier1_SR16_Carbine_Mod2_MFT_FDE",
	"Tier1_SR16_CQB_Mod2_CTR_Black",
	"Tier1_SR16_CQB_Mod2_CTR_FDE",
	"Tier1_SR16_CQB_Mod2_IMOD_Black",
	"Tier1_SR16_CQB_Mod2_IMOD_FDE",
	"Tier1_SR16_CQB_Mod2_LMT_Black",
	"Tier1_SR16_CQB_Mod2_LMT_FDE",
	"Tier1_SR16_CQB_Mod2_MFT_Black",
	"Tier1_SR16_CQB_Mod2_MFT_FDE",
	"rhsusf_weap_MP7A2",
	"rhsusf_weap_MP7A2_desert",
	"rhs_weap_mk17_CQC",
	"rhs_weap_mk17_STD",
	"rhs_weap_M590_5RD"
];


_optics = [
	"cup_optic_ac11704_black",
	"cup_optic_ac11704_coyote",
	"rhsusf_acc_acog",
	"rhsusf_acc_acog2",
	"rhsusf_acc_acog3",
	"rhsusf_acc_eotech",
	"rhsusf_acc_g33_t1",
	"rhsusf_acc_g33_xps3",
	"rhsusf_acc_g33_xps3_tan",
	"rhsusf_acc_compm4",
	"rhsusf_acc_su230",
	"rhsusf_acc_su230_c",
	"rhsusf_acc_t1_high",
	"rhsusf_acc_t1_low",
	"rhsusf_acc_acog_rmr",
	"rhsusf_acc_acog_d",
	"rhsusf_acc_eotech_xps3",
	"tier1_exps3_0_desert",
	"tier1_exps3_0_black",
	"tier1_exps3_0_3xmag_black_up",
	"tier1_exps3_0_3xmag_desert_up",
	"tier1_exps3_0_g33_black_up",
	"tier1_exps3_0_g33_desert_up",
	"tier1_microt2_3xmag_black_up",
	"tier1_microt2_3xmag_tan_up",
	"tier1_microt2_g33_black_up",
	"tier1_microt2_g33_desert_up",
	"tier1_romeo4t_bcd_black",
	"tier1_romeo4t_bcd_tan",
	"tier1_romeo4t_bcd_g33_black_up",
	"tier1_romeo4t_bcd_g33_tanblack_up",
	"tier1_romeo4t_bcd_g33_tan_up",
	"tier1_shortdot_adm_black",
	"tier1_shortdot_adm_desert",
	"tier1_razor_gen2_16_geissele",
	"tier1_razor_gen3_110_adm_t2",
	"tier1_razor_gen3_110_geissele",
	"tier1_atacr18_adm_black",
	"tier1_atacr18_adm_desert_pip",
	"tier1_atacr18_adm_t1_black",
	"tier1_atacr18_adm_t1_desert"
];

_railAttachments = [
	"tier1_harris_bipod_rvg_mlok_tan",
	"tier1_harris_bipod_rvg_mlok_black",
	"tier1_harris_bipod_kac_mlok_tan",
	"tier1_harris_bipod_kac_mlok_black",
	"tier1_harris_bipod_mlok_tan",
	"tier1_harris_bipod_mlok_black_2",
	"tier1_harris_bipod_dd_mlok_tan",
	"tier1_harris_bipod_dd_mlok_black",
	"rhsusf_acc_grip2",
	"rhsusf_acc_grip2_tan",
	"rhsusf_acc_harris_bipod",
	"tier1_harris_bipod_tan",
	"tier1_harris_bipod_black",
	"rhsusf_acc_tdstubby_blk",
	"rhsusf_acc_tdstubby_tan",
	"tier1_harris_bipod_kac_black",
	"tier1_harris_bipod_kac_tan",
	"Tier1_DD_VFG_Black",
    "Tier1_Larue_FUG_Black",
    "Tier1_Larue_FUG_Tan",
	"Tier1_Larue_FUG_UDE",
	"Tier1_KAC_VFG_DE",
	"Tier1_KAC_VFG_Black",
	"Tier1_Gangster_Grip_Black",
	"Tier1_Gangster_Grip_Tan",
	"Tier1_GripPod_Black",
	"Tier1_GripPod_Tan",
	"Tier1_GripPod_MLOK_Black",
	"Tier1_GripPod_MLOK_Tan",
	"Tier1_AFG_MLOK_FDE",
	"Tier1_AFG_MLOK_Black",
	"Tier1_MVG_MLOK_FDE",
	"Tier1_MVG_MLOK_Black",
	"Tier1_BCM_Gunfighter_VG_FDE",
	"Tier1_BCM_Gunfighter_VG_Black",
	"Tier1_DD_MLOK_VFG_FDE",
	"Tier1_DD_MLOK_VFG_Black",
	"Tier1_RVG_MLOK_FDE",
	"Tier1_RVG_MLOK_Black",
	"Tier1_DD_MLOK_VFG_Black",
	"Tier1_DD_MLOK_VFG_FDE",
	"Tier1_KAC_VFG_MLOK_Black",
	"Tier1_KAC_VFG_MLOK_DE",
	"Tier1_TLR1",
	"Tier1_DBALPL",
	"Tier1_DBALPL_FL",
	"Tier1_X300U",
	"Tier1_M300C",
	"Tier1_M300C_Black",
	"Tier1_M600V",
	"Tier1_M600V_Black",
	"Tier1_416_LA5_Top",
	"Tier1_416_LA5_Side",
	"Tier1_416_LA5_M300C",
	"Tier1_416_LA5_M300C_FL",
	"Tier1_416_LA5_M300C_Black",
	"Tier1_416_LA5_M300C_Black_FL",
	"Tier1_416_LA5_M600V",
	"Tier1_416_LA5_M600V_FL",
	"Tier1_416_LA5_M600V_Black",
	"Tier1_416_LA5_M600V_Black_FL",
	"Tier1_416_LA5_M600V_alt",
	"Tier1_416_LA5_M600V_alt_FL",
	"Tier1_416_LA5_M600V_alt_Black",
	"Tier1_416_LA5_M600V_alt_Black_FL",
	"Tier1_416_LA5_M603V",
	"Tier1_416_LA5_M603V_FL",
	"Tier1_145_LA5_Top",
	"Tier1_145_LA5_Side",
	"Tier1_145_LA5_M300C",
	"Tier1_145_LA5_M300C_FL",
	"Tier1_145_LA5_M600V",
	"Tier1_145_LA5_M600V_FL",
	"Tier1_145_LA5_M600V_alt",
	"Tier1_145_LA5_M600V_alt_FL",
	"Tier1_145_LA5_M603V",
	"Tier1_145_LA5_M603V_FL",
	"Tier1_145_NGAL_Top",
	"Tier1_145_NGAL_Side",
	"Tier1_145_NGAL_M300C",
	"Tier1_145_NGAL_M300C_FL",
	"Tier1_145_NGAL_M600V",
	"Tier1_145_NGAL_M600V_FL",
	"Tier1_145_NGAL_M600V_alt",
	"Tier1_145_NGAL_M600V_alt_FL",
	"Tier1_145_NGAL_M603V",
	"Tier1_145_NGAL_M603V_FL",
	"Tier1_10_LA5_Top",
	"Tier1_10_LA5_Side",
	"Tier1_10_LA5_M300C",
	"Tier1_10_LA5_M300C_FL",
	"Tier1_10_LA5_M600V",
	"Tier1_10_LA5_M600V_FL",
	"Tier1_10_LA5_M600V_alt",
	"Tier1_10_LA5_M600V_alt_FL",
	"Tier1_10_LA5_M603V",
	"Tier1_10_LA5_M603V_FL",
	"Tier1_10_NGAL_Top",
	"Tier1_10_NGAL_Side",
	"Tier1_10_NGAL_M300C",
	"Tier1_10_NGAL_M300C_FL",
	"Tier1_10_NGAL_M600V",
	"Tier1_10_NGAL_M600V_FL",
	"Tier1_10_NGAL_M600V_alt",
	"Tier1_10_NGAL_M600V_alt_FL",
	"Tier1_10_NGAL_M603V",
	"Tier1_10_NGAL_M603V_FL",
	"Tier1_RAHG_LA5_M300C",
	"Tier1_RAHG_LA5_M300C_FL",
	"Tier1_RAHG_LA5_M300C_Black",
	"Tier1_RAHG_LA5_M300C_Black_FL",
	"Tier1_RAHG_LA5_M600V",
	"Tier1_RAHG_LA5_M600V_FL",
	"Tier1_RAHG_LA5_M600V_Black",
	"Tier1_RAHG_LA5_M600V_Black_FL",
	"Tier1_RAHG_LA5_M600V_alt",
	"Tier1_RAHG_LA5_M600V_alt_FL",
	"Tier1_RAHG_LA5_M600V_alt_Black",
	"Tier1_RAHG_LA5_M600V_alt_Black_FL",
	"Tier1_RAHG_LA5_M603V",
	"Tier1_RAHG_LA5_M603V_FL",
	"Tier1_RAHG_LA5_Top",
	"Tier1_RAHG_LA5_Side",
	"Tier1_RAHG_NGAL_M300C",
	"Tier1_RAHG_NGAL_M300C_FL",
	"Tier1_RAHG_NGAL_M300C_Black",
	"Tier1_RAHG_NGAL_M300C_Black_FL",
	"Tier1_RAHG_NGAL_M600V",
	"Tier1_RAHG_NGAL_M600V_FL",
	"Tier1_RAHG_NGAL_M600V_Black",
	"Tier1_RAHG_NGAL_M600V_Black_FL",
	"Tier1_RAHG_NGAL_M600V_alt",
	"Tier1_RAHG_NGAL_M600V_alt_FL",
	"Tier1_RAHG_NGAL_M600V_alt_Black",
	"Tier1_RAHG_NGAL_M600V_alt_Black_FL",
	"Tier1_RAHG_NGAL_M603V",
	"Tier1_RAHG_NGAL_M603V_FL",
	"Tier1_RAHG_NGAL_Top",
	"Tier1_RAHG_NGAL_Side",
	"Tier1_MW_LA5_M300C",
	"Tier1_MW_LA5_M300C_FL",
	"Tier1_MW_LA5_M300C_Black",
	"Tier1_MW_LA5_M300C_Black_FL",
	"Tier1_MW_LA5_M600V",
	"Tier1_MW_LA5_M600V_FL",
	"Tier1_MW_LA5_M600V_Black",
	"Tier1_MW_LA5_M600V_Black_FL",
	"Tier1_MW_LA5_M600V_alt",
	"Tier1_MW_LA5_M600V_alt_FL",
	"Tier1_MW_LA5_M600V_alt_Black",
	"Tier1_MW_LA5_M600V_alt_Black_FL",
	"Tier1_MW_LA5_M603V",
	"Tier1_MW_LA5_M603V_FL",
	"Tier1_MW_LA5_Top",
	"Tier1_MW_LA5_Side",
	"Tier1_MW_NGAL_M300C",
	"Tier1_MW_NGAL_M300C_FL",
	"Tier1_MW_NGAL_M300C_Black",
	"Tier1_MW_NGAL_M300C_Black_FL",
	"Tier1_MW_NGAL_M600V",
	"Tier1_MW_NGAL_M600V_FL",
	"Tier1_MW_NGAL_M600V_Black",
	"Tier1_MW_NGAL_M600V_Black_FL",
	"Tier1_MW_NGAL_M600V_alt",
	"Tier1_MW_NGAL_M600V_alt_FL",
	"Tier1_MW_NGAL_M600V_alt_Black",
	"Tier1_MW_NGAL_M600V_alt_Black_FL",
	"Tier1_MW_NGAL_M603V",
	"Tier1_MW_NGAL_M603V_FL",
	"Tier1_MW_NGAL_Top",
	"Tier1_MW_NGAL_Side",
	"Tier1_URX4_LA5_Top",
	"Tier1_URX4_LA5_Side",
	"Tier1_URX4_LA5_M300C",
	"Tier1_URX4_LA5_M300C_FL",
	"Tier1_URX4_LA5_M300C_Black",
	"Tier1_URX4_LA5_M300C_Black_FL",
	"Tier1_URX4_LA5_M600V",
	"Tier1_URX4_LA5_M600V_FL",
	"Tier1_URX4_LA5_M600V_Black",
	"Tier1_URX4_LA5_M600V_Black_FL",
	"Tier1_URX4_LA5_M600V_alt",
	"Tier1_URX4_LA5_M600V_alt_FL",
	"Tier1_URX4_LA5_M600V_alt_Black",
	"Tier1_URX4_LA5_M600V_alt_Black_FL",
	"Tier1_URX4_LA5_M603V",
	"Tier1_URX4_LA5_M603V_FL",
	"Tier1_URX4_NGAL_Top",
	"Tier1_URX4_NGAL_Side",
	"Tier1_URX4_NGAL_M300C",
	"Tier1_URX4_NGAL_M300C_FL",
	"Tier1_URX4_NGAL_M300C_Black",
	"Tier1_URX4_NGAL_M300C_Black_FL",
	"Tier1_URX4_NGAL_M600V",
	"Tier1_URX4_NGAL_M600V_FL",
	"Tier1_URX4_NGAL_M600V_Black",
	"Tier1_URX4_NGAL_M600V_Black_FL",
	"Tier1_URX4_NGAL_M600V_alt",
	"Tier1_URX4_NGAL_M600V_alt_FL",
	"Tier1_URX4_NGAL_M600V_alt_Black",
	"Tier1_URX4_NGAL_M600V_alt_Black_FL",
	"Tier1_URX4_NGAL_M603V",
	"Tier1_URX4_NGAL_M603V_FL",
	"Tier1_MCX_LA5_M300C",
	"Tier1_MCX_LA5_M300C_FL",
	"Tier1_MCX_LA5_M300C_Black",
	"Tier1_MCX_LA5_M300C_Black_FL",
	"Tier1_MCX_LA5_M600V",
	"Tier1_MCX_LA5_M600V_FL",
	"Tier1_MCX_LA5_M600V_Black",
	"Tier1_MCX_LA5_M600V_Black_FL",
	"Tier1_MCX_LA5_M603V",
	"Tier1_MCX_LA5_M603V_FL",
	"Tier1_MCX_LA5_Top",
	"Tier1_MCX_LA5_Side",
	"Tier1_MCX_NGAL_M300C",
	"Tier1_MCX_NGAL_M300C_FL",
	"Tier1_MCX_NGAL_M300C_Black",
	"Tier1_MCX_NGAL_M300C_Black_FL",
	"Tier1_MCX_NGAL_M600V",
	"Tier1_MCX_NGAL_M600V_FL",
	"Tier1_MCX_NGAL_M600V_Black",
	"Tier1_MCX_NGAL_M600V_Black_FL",
	"Tier1_MCX_NGAL_M603V",
	"Tier1_MCX_NGAL_M603V_FL",
	"Tier1_MCX_NGAL_Top",
	"Tier1_MCX_NGAL_Side",
	"Tier1_LA5_Side",
	"Tier1_LA5_Top",
	"Tier1_NGAL_Side",
	"Tier1_NGAL_Top",
	"Tier1_SCAR_LA5_Top",
	"Tier1_SCAR_LA5_Side",
	"Tier1_SCAR_LA5_M300C",
	"Tier1_SCAR_LA5_M300C_FL",
	"Tier1_SCAR_LA5_M300C_Black",
	"Tier1_SCAR_LA5_M300C_Black_FL",
	"Tier1_SCAR_LA5_M600V",
	"Tier1_SCAR_LA5_M600V_FL",
	"Tier1_SCAR_LA5_M600V_Black",
	"Tier1_SCAR_LA5_M600V_Black_FL",
	"Tier1_SCAR_LA5_M603V",
	"Tier1_SCAR_LA5_M603V_FL",
	"Tier1_SCAR_NGAL_Top",
	"Tier1_SCAR_NGAL_Side",
	"Tier1_SCAR_NGAL_M300C",
	"Tier1_SCAR_NGAL_M300C_FL",
	"Tier1_SCAR_NGAL_M300C_Black",
	"Tier1_SCAR_NGAL_M300C_Black_FL",
	"Tier1_SCAR_NGAL_M600V",
	"Tier1_SCAR_NGAL_M600V_FL",
	"Tier1_SCAR_NGAL_M600V_Black",
	"Tier1_SCAR_NGAL_M600V_Black_FL",
	"Tier1_SCAR_NGAL_M603V",
	"Tier1_SCAR_NGAL_M603V_FL",
	"Tier1_M4BII_LA5_Top",
	"Tier1_M4BII_LA5_Side",
	"Tier1_M4BII_LA5_M300C",
	"Tier1_M4BII_LA5_M300C_FL",
	"Tier1_M4BII_LA5_M300C_Black",
	"Tier1_M4BII_LA5_M300C_Black_FL",
	"Tier1_M4BII_LA5_M600V",
	"Tier1_M4BII_LA5_M600V_FL",
	"Tier1_M4BII_LA5_M600V_Black",
	"Tier1_M4BII_LA5_M600V_Black_FL",
	"Tier1_M4BII_LA5_M603V",
	"Tier1_M4BII_LA5_M603V_FL",
	"Tier1_M4BII_NGAL_Top",
	"Tier1_M4BII_NGAL_Side",
	"Tier1_M4BII_NGAL_M300C",
	"Tier1_M4BII_NGAL_M300C_FL",
	"Tier1_M4BII_NGAL_M300C_Black",
	"Tier1_M4BII_NGAL_M300C_Black_FL",
	"Tier1_M4BII_NGAL_M600V",
	"Tier1_M4BII_NGAL_M600V_FL",
	"Tier1_M4BII_NGAL_M600V_Black",
	"Tier1_M4BII_NGAL_M600V_Black_FL",
	"Tier1_M4BII_NGAL_M603V",
	"Tier1_M4BII_NGAL_M603V_FL",
	"Tier1_Mk18_LA5_Top",
	"Tier1_Mk18_LA5_Side",
	"Tier1_Mk18_LA5_M300C",
	"Tier1_Mk18_LA5_M300C_FL",
	"Tier1_Mk18_LA5_M300C_Black",
	"Tier1_Mk18_LA5_M300C_Black_FL",
	"Tier1_Mk18_LA5_M600V",
	"Tier1_Mk18_LA5_M600V_FL",
	"Tier1_Mk18_LA5_M600V_Black",
	"Tier1_Mk18_LA5_M600V_Black_FL",
	"Tier1_Mk18_LA5_M603V",
	"Tier1_Mk18_LA5_M603V_FL",
	"Tier1_Mk18_NGAL_Top",
	"Tier1_Mk18_NGAL_Side",
	"Tier1_Mk18_NGAL_M300C",
	"Tier1_Mk18_NGAL_M300C_FL",
	"Tier1_Mk18_NGAL_M300C_Black",
	"Tier1_Mk18_NGAL_M300C_Black_FL",
	"Tier1_Mk18_NGAL_M600V",
	"Tier1_Mk18_NGAL_M600V_FL",
	"Tier1_Mk18_NGAL_M600V_Black",
	"Tier1_Mk18_NGAL_M600V_Black_FL",
	"Tier1_Mk18_NGAL_M603V",
	"Tier1_Mk18_NGAL_M603V_FL",
	"Tier1_MP7_LA5_Side",
	"Tier1_MP7_LA5_M300C",
	"Tier1_MP7_LA5_M300C_FL",
	"Tier1_MP7_LA5_M300C_Black",
	"Tier1_MP7_LA5_M300C_Black_FL",
	"Tier1_MP7_NGAL_Side",
	"Tier1_MP7_NGAL_M300C",
	"Tier1_MP7_NGAL_M300C_FL",
	"Tier1_MP7_NGAL_M300C_Black",
	"Tier1_MP7_NGAL_M300C_Black_FL",
	"Tier1_M249_LA5_Side",
	"Tier1_M249_LA5_M600V",
	"Tier1_M249_LA5_M600V_FL",
	"Tier1_M249_LA5_M600V_Black",
	"Tier1_M249_LA5_M600V_Black_FL",
	"Tier1_M249_LA5_M603V",
	"Tier1_M249_LA5_M603V_FL",
	"Tier1_Gemtech_Halo",
	"Tier1_Gemtech_Halo_DE",
	"Tier1_RotexIIIC_DE",
	"Tier1_RotexIIIC_Grey",
	"Tier1_SOCOM556_DE",
	"Tier1_SOCOM556_Black",
	"Tier1_SOCOM556_2_DE",
	"Tier1_SOCOM556_2_Black",
	"Tier1_SOCOM556_2_Mini_DE",
	"Tier1_SOCOM556_2_Mini_Black",
	"Tier1_SOCOM762_2_DE",
	"Tier1_SOCOM762_2_Black",
	"Tier1_SOCOM762_2_Mini_DE",
	"Tier1_SOCOM762_2_Mini_Black",
	"Tier1_SOCOM762MG_DE",
	"Tier1_SOCOM762MG_Black",
	"Tier1_KAC_762_QDC_Tan",
	"Tier1_KAC_762_QDC_Black",
	"Tier1_KAC_762_DSR",
	"Tier1_KAC_556_QDC_Tan",
	"Tier1_KAC_556_QDC_Black",
	"Tier1_KAC_556_QDC_CQB_Tan",
	"Tier1_KAC_556_QDC_CQB_Black",
	"Tier1_AAC_M42000_Black",
	"Tier1_AAC_M42000_Desert",
	"Tier1_SandmanS_Black",
	"Tier1_SandmanS_Desert",
	"Tier1_SRD762_Black",
	"Tier1_SRD762_Desert",
	"Tier1_SR25S_tan",
	"Tier1_Octane9",
	"Tier1_Evo9",
	"Tier1_TiRant9",
	"Tier1_TiRant9S",
	"Tier1_Agency_Compensator",
	"cup_muzzle_mfsup_flashhider_556x45_black",
	"cup_muzzle_mfsup_flashhider_556x45_tan"
];
//*********************************************************************************************
private "_beret";
if (squadParams player select 0 select 0 == "NZF") then {_beret = ["nzf_beret_black_silver"]} else {_beret = ["SP_Beret2_Black"]};

//*******************************************************************

_personalGear = [];
_removableGear = [
	"VSM_OGA_Helmet1",
	"VSM_OGA_OD_Helmet1",
	"VSM_OGA_Helmet2",
	"VSM_OGA_OD_Helmet2",
	"VSM_OPS_2_multicam",
	"VSM_OD_Spray_OPS_2",
	"VSM_OGA_OD_OPS_2",
	"VSM_oga_OPS_2",
	"VSM_Tan_spray_OPS_2",
	"VSM_OPS_2_AOR1"
];

//*******************************************************************
if (_nameID == "Agent F") then {
	_personalGear = [
		"nzf_AGENT_ECH_ODA_Lite",
		"nzf_AGENT_ECH_OGA_Lite",
		"nzf_AGENT_OPS_2_AOR",
		"nzf_AGENT_OPS_2_Multicam",
		"nzf_AGENT_OPS_2_OD_SPRAY",
		"nzf_AGENT_OPS_2_OD",
		"nzf_AGENT_OPS_2_OGA",
		"nzf_AGENT_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
	_heliHelmet = ["nzf_AGENT_Helo_Helmet"];
};
//*******************************************************************
if (_nameID == "Anubis") then {
	_personalGear = [
		"nzf_ANUBIS_ECH_ODA_Lite",
		"nzf_ANUBIS_ECH_OGA_Lite",
		"nzf_ANUBIS_OPS_2_AOR",
		"nzf_ANUBIS_OPS_2_Multicam",
		"nzf_ANUBIS_OPS_2_OD_SPRAY",
		"nzf_ANUBIS_OPS_2_OD",
		"nzf_ANUBIS_OPS_2_OGA",
		"nzf_ANUBIS_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "JLBane") then {
	_personalGear = [
		"nzf_BANE_ECH_ODA_Lite",
		"nzf_BANE_ECH_OGA_Lite",
		"nzf_BANE_OPS_2_AOR",
		"nzf_BANE_OPS_2_Multicam",
		"nzf_BANE_OPS_2_OD_SPRAY",
		"nzf_BANE_OPS_2_OD",
		"nzf_BANE_OPS_2_OGA",
		"nzf_BANE_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "Benma") then {
	_personalGear = [
		"nzf_BENMA_ECH_ODA_Lite",
		"nzf_BENMA_ECH_OGA_Lite",
		"nzf_BENMA_OPS_2_AOR",
		"nzf_BENMA_OPS_2_Multicam",
		"nzf_BENMA_OPS_2_OD_SPRAY",
		"nzf_BENMA_OPS_2_OD",
		"nzf_BENMA_OPS_2_OGA",
		"nzf_BENMA_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "PAINLESS") then {
	_personalGear = [
		"nzf_PAINLESS_ECH_ODA_Lite",
		"nzf_PAINLESS_ECH_OGA_Lite",
		"nzf_PAINLESS_OPS_2_AOR",
		"nzf_PAINLESS_OPS_2_Multicam",
		"nzf_PAINLESS_OPS_2_OD_SPRAY",
		"nzf_PAINLESS_OPS_2_OD",
		"nzf_PAINLESS_OPS_2_OGA",
		"nzf_PAINLESS_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "Fox") then {
	_personalGear = [
		"nzf_FOX_ECH_ODA_Lite",
		"nzf_FOX_ECH_OGA_Lite",
		"nzf_FOX_OPS_2_AOR",
		"nzf_FOX_OPS_2_Multicam",
		"nzf_FOX_OPS_2_OD_SPRAY",
		"nzf_FOX_OPS_2_OD",
		"nzf_FOX_OPS_2_OGA",
		"nzf_FOX_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
	_heliHelmet = ["nzf_FOX_Helo_Helmet"];
};
//*******************************************************************
if (_nameID == "GGPC") then {
	_personalGear = [
		"nzf_GGPC_ECH_ODA_Lite",
		"nzf_GGPC_ECH_OGA_Lite",
		"nzf_GGPC_OPS_2_AOR",
		"nzf_GGPC_OPS_2_Multicam",
		"nzf_GGPC_OPS_2_OD_SPRAY",
		"nzf_GGPC_OPS_2_OD",
		"nzf_GGPC_OPS_2_OGA",
		"nzf_GGPC_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "iRock") then {
	_personalGear = [
		"nzf_IROCK_ECH_ODA_Lite",
		"nzf_IROCK_ECH_OGA_Lite",
		"nzf_IROCK_OPS_2_AOR",
		"nzf_IROCK_OPS_2_Multicam",
		"nzf_IROCK_OPS_2_OD_SPRAY",
		"nzf_IROCK_OPS_2_OD",
		"nzf_IROCK_OPS_2_OGA",
		"nzf_IROCK_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "JD Wang") then {
	_personalGear = [
		"nzf_JD_ECH_ODA_Lite",
		"nzf_JD_ECH_OGA_Lite",
		"nzf_JD_OPS_2_AOR",
		"nzf_JD_OPS_2_Multicam",
		"nzf_JD_OPS_2_OD_SPRAY",
		"nzf_JD_OPS_2_OD",
		"nzf_JD_OPS_2_OGA",
		"nzf_JD_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
	_heliHelmet = ["nzf_AGENT_Helo_Helmet","nzf_FOX_Helo_Helmet","nzf_LIAM_Helo_Helmet"];
};
//*******************************************************************
if (_nameID == "Kevina") then {
	_personalGear = [
		"nzf_KEV_ECH_ODA_Lite",
		"nzf_KEV_ECH_OGA_Lite",
		"nzf_KEV_OPS_2_AOR",
		"nzf_KEV_OPS_2_Multicam",
		"nzf_KEV_OPS_2_OD_SPRAY",
		"nzf_KEV_OPS_2_OD",
		"nzf_KEV_OPS_2_OGA",
		"nzf_KEV_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "Liam") then {
	_personalGear = [
		"nzf_LIAM_ECH_ODA_Lite",
		"nzf_LIAM_ECH_OGA_Lite",
		"nzf_LIAM_OPS_2_AOR",
		"nzf_LIAM_OPS_2_Multicam",
		"nzf_LIAM_OPS_2_OD_SPRAY",
		"nzf_LIAM_OPS_2_OD",
		"nzf_LIAM_OPS_2_OGA",
		"nzf_LIAM_OPS_2_OGA_SPRAY"
	];
	_genericGear = _genericGear - _removableGear;
	_heliHelmet = ["nzf_LIAM_Helo_Helmet"];
};
//*******************************************************************

if (_nameID == "[NZF] Mirkea") then {
	_personalGear = [
		"nzf_MIRKEA_ECH_ODA_Lite",
		"nzf_MIRKEA_ECH_OGA_Lite",
		"nzf_MIRKEA_OPS_2_AOR",
		"nzf_MIRKEA_OPS_2_Multicam",
		"nzf_MIRKEA_OPS_2_OD_SPRAY",
		"nzf_MIRKEA_OPS_2_OD",
		"nzf_MIRKEA_OPS_2_OGA",
		"nzf_MIRKEA_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "Psych") then {
	_personalGear = [
		"nzf_PSYCH_ECH_ODA_Lite",
		"nzf_PSYCH_ECH_OGA_Lite",
		"nzf_PSYCH_OPS_2_Multicam",
		"nzf_PSYCH_OPS_2_OD_SPRAY",
		"nzf_PSYCH_OPS_2_OD",
		"nzf_PSYCH_OPS_2_OGA",
		"nzf_PSYCH_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "Tepz") then {
	_personalGear = [
		"nzf_TEPZ_ECH_ODA_Lite",
		"nzf_TEPZ_ECH_OGA_Lite",
		"nzf_TEPZ_OPS_2_AOR",
		"nzf_TEPZ_OPS_2_Multicam",
		"nzf_TEPZ_OPS_2_OD_SPRAY",
		"nzf_TEPZ_OPS_2_OD",
		"nzf_TEPZ_OPS_2_OGA",
		"nzf_TEPZ_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "BK") then {
	_personalGear = [
		"nzf_BK_ECH_ODA_Lite",
		"nzf_BK_ECH_OGA_Lite",
		"nzf_BK_OPS_2_AOR",
		"nzf_BK_OPS_2_Multicam",
		"nzf_BK_OPS_2_OD",
		"nzf_BK_OPS_2_OD_SPRAY",
		"nzf_BK_OPS_2_OGA",
		"nzf_BK_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "CaptainPi") then {
	_personalGear = [
		"nzf_CAP_ECH_ODA_Lite",
		"nzf_CAP_ECH_OGA_Lite",
		"nzf_CAP_OPS_2_AOR",
		"nzf_CAP_OPS_2_Multicam",
		"nzf_CAP_OPS_2_OD",
		"nzf_CAP_OPS_2_OD_SPRAY",
		"nzf_CAP_OPS_2_OGA",
		"nzf_CAP_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "erircuit") then {
	_personalGear = [
		"nzf_EIRCUIT_ECH_ODA_Lite",
		"nzf_EIRCUIT_ECH_OGA_Lite",
		"nzf_EIRCUIT_OPS_2_AOR",
		"nzf_EIRCUIT_OPS_2_Multicam",
		"nzf_EIRCUIT_OPS_2_OD",
		"nzf_EIRCUIT_OPS_2_OD_SPRAY",
		"nzf_EIRCUIT_OPS_2_OGA",
		"nzf_EIRCUIT_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "Juan") then {
	_personalGear = [
		"nzf_JUAN_ECH_ODA_Lite",
		"nzf_JUAN_ECH_OGA_Lite",
		"nzf_JUAN_OPS_2_AOR",
		"nzf_JUAN_OPS_2_Multicam",
		"nzf_JUAN_OPS_2_OD",
		"nzf_JUAN_OPS_2_OD_SPRAY",
		"nzf_JUAN_OPS_2_OGA",
		"nzf_JUAN_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "-_LP_-") then {
	_personalGear = [
		"nzf_PANDA_ECH_ODA_Lite",
		"nzf_PANDA_ECH_OGA_Lite",
		"nzf_PANDA_OPS_2_AOR",
		"nzf_PANDA_OPS_2_Multicam",
		"nzf_PANDA_OPS_2_OD",
		"nzf_PANDA_OPS_2_OD_SPRAY",
		"nzf_PANDA_OPS_2_OGA",
		"nzf_PANDA_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "Wes") then {
	_personalGear = [
		"nzf_WES_ECH_ODA_Lite",
		"nzf_WES_ECH_OGA_Lite",
		"nzf_WES_OPS_2_AOR",
		"nzf_WES_OPS_2_Multicam",
		"nzf_WES_OPS_2_OD",
		"nzf_WES_OPS_2_OD_SPRAY",
		"nzf_WES_OPS_2_OGA",
		"nzf_WES_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*******************************************************************
if (_nameID == "Doomben") then {
	_personalGear = [
		"nzf_DOOM_ECH_ODA_Lite",
		"nzf_DOOM_ECH_OGA_Lite",
		"nzf_DOOM_OPS_2_AOR",
		"nzf_DOOM_OPS_2_Multicam",
		"nzf_DOOM_OPS_2_OD",
		"nzf_DOOM_OPS_2_OD_SPRAY",
		"nzf_DOOM_OPS_2_OGA",
		"nzf_DOOM_OPS_2_OGA_SPRAY"	
	];
	_genericGear = _genericGear - _removableGear;
};
//*********************************************************************************************
switch (_role) do {

case "command": {
		[_box, _beret + _personalGear + _genericGear + _leaderVests + _basicMedical + _pistols + _rifles + _optics + _railAttachments + [
				"ACRE_PRC117F",
				"ACRE_PRC152",
				"ItemcTab",
				"Laserdesignator",
				"ACE_MX2A",
				"ACE_Vector"
			],false] call ace_arsenal_fnc_initBox; 
	};

case "support": {
		[_box, _beret + _personalGear + _genericGear + _operatorVests + _machinegunnerVests + _basicMedical + _pistols + _firesupport + _rifles + _optics + _railAttachments + [
				"ACRE_PRC117F",
				"ACRE_PRC152",
				"VSM_AOR1_carryall",
				"VSM_Multicam_carryall",
				"VSM_OGA_OD_carryall",
				"ItemcTab",
				"Laserdesignator",
				"ACE_MX2A",
				"ACE_Vector"
			],false] call ace_arsenal_fnc_initBox;
	};

case "Medic": {
		[_box, _beret + _personalGear + _genericGear + _medicVests + _advancedMedical + _drugs + _pistols + _rifles + _optics + _railAttachments + [
				"immersion_pops_poppack"
		],false] call ace_arsenal_fnc_initBox;
	};

case "CLS": {
		[_box, _beret +  _personalGear + _genericGear + _medicVests + _advancedMedical + _pistols + _rifles + _optics + _railAttachments + [

		],false] call ace_arsenal_fnc_initBox;
	};

case "Engineer": {
		[_box, _beret +  _personalGear + _genericGear + _operatorVests + _basicMedical + _pistols + _rifles + _optics + _railAttachments + [
				"VSM_AOR1_carryall",
				"VSM_Multicam_carryall",
				"VSM_OGA_OD_carryall",
				"VSM_OGA_carryall",
				"ACE_M26_Clacker",
				"ACE_Clacker",
				"ACE_VMH3",
				"ToolKit",
				"DemoCharge_Remote_Mag",
				"SatchelCharge_Remote_Mag",
				"SLAMDirectionalMine_Wire_Mag",
				"ACE_DefusalKit"
		],false] call ace_arsenal_fnc_initBox;
	};

case "Machinegunner": {
		[_box, _beret + _personalGear +  _genericGear + _machinegunnerVests + _basicMedical + _pistols + _machineguns + _optics + _railAttachments + [

		],false] call ace_arsenal_fnc_initBox;

	};

case "Marksman": {
		[_box, _beret +  _personalGear + _genericGear + _marksmanVests + _basicMedical + _pistols + _marksmanRifles + _railAttachments + [
				"ACE_ATragMX",
				"ACE_Kestrel4500",
				"ACRE_PRC152",
				"Rangefinder",
				"ACE_RangeCard",
				"ACE_Tripod"
		],false] call ace_arsenal_fnc_initBox;
	};

case "Operator": {
		[_box, _beret +  _personalGear + _genericGear + _operatorVests + _basicMedical + _pistols + _rifles + _optics + _railAttachments + _launchers + [

		],false] call ace_arsenal_fnc_initBox;
	};

case "Helicopter": {
		[_box, _beret + _heliHelmet + _basicMedical + _pistols + [
				"VSM_OGA_Camo_SS",
				"VSM_OGA_od_Camo_SS",
				"VSM_OGA_Camo",
				"VSM_OGA_od_Camo",
				"V_TacVest_khk",
				"V_TacVest_oli",
				"V_TacVest_blk",
				"V_TacVest_brn",
				"B_LegStrapBag_coyote_F",
				"B_LegStrapBag_black_F",
				"B_LegStrapBag_olive_F",
				"rhsusf_weap_MP7A2",
				"rhsusf_acc_t1_low",
				"ACRE_PRC152",
				"ACE_Chemlight_HiBlue",
				"ACE_Chemlight_HiGreen",
				"ACE_Chemlight_HiRed",
				"ACE_Chemlight_HiWhite",
				"ACE_Chemlight_HiYellow",
				"ACE_Chemlight_IR",
				"ACE_HandFlare_Green",
				"ACE_HandFlare_Red",
				"ACE_HandFlare_White",
				"ACE_HandFlare_Yellow",
				"ACE_M84",
				"rhs_mag_an_m8hc",
				"rhs_mag_m18_green",
				"rhs_mag_m18_purple",
				"rhs_mag_m18_red",
				"rhs_mag_m18_yellow",
				"rhs_mag_m67",
				"acex_intelitems_notepad",
				"ACE_key_west",
				"ItemMap",
				"ItemCompass",
				"ATM_ALTIMETER",
				"ACE_EarPlugs",
				"ACE_Flashlight_MX991",
				"ItemAndroid",
				"ItemcTabHCam",
				"ACE_IR_Strobe_Item",
				"ACE_Flashlight_XL50",
				"ACE_MapTools",
				"ACE_microDAGR",
				"CUP_NVG_GPNVG_black",
				"rhsusf_mag_40Rnd_46x30_AP",
				"rhsusf_mag_40Rnd_46x30_FMJ",
				"rhsusf_mag_40Rnd_46x30_JHP",
				"rhsusf_acc_grip2",
				"rhsusf_acc_grip2_tan",
				"rhsusf_acc_harris_bipod",
				"tier1_harris_bipod_tan",
				"tier1_harris_bipod_black",
				"rhsusf_acc_tdstubby_blk",
				"rhsusf_acc_tdstubby_tan"

		],false] call ace_arsenal_fnc_initBox;
	};

case "Pilot": {
		[_box, _beret + _basicMedical + _pistols + [
				"FIR_Fighter_Pilot_Nomex3",
				"FIR_Fighter_Pilot_USN_Nomex3",
				"FIR_Fighter_Pilot_VF103_Nomex3",
				"FIR_pilot_vest",
				"ACE_NonSteerableParachute",
				"FIR_hgu26p",
				"FIR_HGU33P",
				"ACRE_PRC152",
				"ACE_Chemlight_HiBlue",
				"ACE_Chemlight_HiGreen",
				"ACE_Chemlight_HiRed",
				"ACE_Chemlight_HiWhite",
				"ACE_Chemlight_HiYellow",
				"ACE_Chemlight_IR",
				"ACE_HandFlare_Green",
				"ACE_HandFlare_Red",
				"ACE_HandFlare_White",
				"ACE_HandFlare_Yellow",
				"rhs_mag_an_m8hc",
				"rhs_mag_m18_green",
				"rhs_mag_m18_purple",
				"rhs_mag_m18_red",
				"rhs_mag_m18_yellow",
				"rhs_mag_m67",
				"acex_intelitems_notepad",
				"ACE_key_west",
				"CUP_NVG_GPNVG_black",
				"ItemMap",
				"ItemCompass",
				"ATM_ALTIMETER",
				"ACE_EarPlugs",
				"ACE_Flashlight_MX991",
				"ItemAndroid",
				"ItemcTabHCam",
				"ACE_IR_Strobe_Item",
				"ACE_Flashlight_XL50",
				"ACE_MapTools",
				"ACE_microDAGR"

		],false] call ace_arsenal_fnc_initBox;
	};

default {
		[_box, _beret + _personalGear + _genericGear + _operatorVests + _basicMedical + _pistols + _rifles + _optics + _railAttachments + _launchers + [
				
		],false] call ace_arsenal_fnc_initBox;
	};


};


