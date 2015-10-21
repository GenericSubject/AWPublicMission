/*
unit loadout script by joko
Idea by Belbo
creates a specific loadout for playable units. Add the items to their respective variables. (expected data type is given).
The kind of ammo a player gets with this loadout does not necessarily have to be specified. If tracer ammo is supposed to be used, you should set _primaryweaponAmmo to 0 and add those
magazines one for one in _items.
*/

//Vehicle Array
JK_vvsArray = ["rhs_vehclass_car", "rhs_vehclass_car_wd", "rhs_vehclass_mrap", "rhs_vehclass_mrap_wd", "rhs_vehclass_truck", "rhs_vehclass_truck_wd", "rhsusf_rg33_m2_usmc_wd", "rhsusf_rg33_usmc_wd"];

//clothing - (string)
_uniforms = ["rhs_uniform_FROG01_m81", "rhs_uniform_FROG01_wd"];
_vests = ["rhsusf_spc_squadleader"];
_headgears = ["rhsusf_ach_bare", "rhsusf_ach_bare_des", "rhsusf_ach_bare_des_ess", "rhsusf_ach_bare_des_headset", "rhsusf_ach_bare_des_headset_ess", "rhsusf_ach_bare_ess", "rhsusf_ach_bare_headset", "rhsusf_ach_bare_headset_ess", "rhsusf_ach_bare_semi", "rhsusf_ach_bare_semi_ess", "rhsusf_ach_bare_semi_headset", "rhsusf_ach_bare_semi_headset_ess", "rhsusf_ach_bare_tan", "rhsusf_ach_bare_tan_ess", "rhsusf_ach_bare_tan_headset", "rhsusf_ach_bare_tan_headset_ess", "rhsusf_ach_bare_wood", "rhsusf_ach_bare_wood_ess", "rhsusf_ach_bare_wood_headset", "rhsusf_ach_bare_wood_headset_ess","rhsusf_ach_helmet_M81", "rhsusf_lwh_helmet_marpatwd", "rhsusf_lwh_helmet_marpatwd_ess", "rhsusf_lwh_helmet_marpatwd_headset", "rhsusf_mich_bare_norotos", "rhsusf_mich_bare_norotos_arc", "rhsusf_mich_helmet_marpatwd", "rhsusf_mich_helmet_marpatwd_alt", "rhsusf_mich_helmet_marpatwd_norotos", "rhsusf_mich_helmet_marpatwd_norotos_arc"];
_backpacks = ["tf_rt1523g_big_rhs"];
_insignium = "";
_useProfileGoggles = 1;        //If set to 1, goggles from your profile will be used. If set to 0, _goggles will be added (or profile goggles will be removed when _goggles is left empty).
_goggles = "";

//weapons - primary weapon - (string)
_primaryweapon = ["rhs_weap_m16a4_carryhandle_M203", "rhs_weap_m4_m203", "rhs_weap_m4_m203S", "rhs_weap_m4_m320"];

//primary weapon items - (array)
_itemsPrimaryweapon = [["rhsusf_acc_ACOG2_USMC","rhsusf_acc_ACOG3_USMC","rhsusf_acc_ACOG_USMC","rhsusf_acc_ACOG","rhsusf_acc_ACOG2","rhsusf_acc_ACOG3","rhsusf_acc_ACOG_d","rhsusf_acc_ACOG_sa","rhsusf_acc_ACOG_wd"],"rhsusf_acc_anpeq15side"];

//primary weapon ammo (if a primary weapon is given) and how many tracer mags - (integer)
_ARhandle = 0;        //should stay 0. Determines the class of ammunition for BIS_fnc_addWeapon. Specific Rifles need specific _ARhandles. Test it out.
_primaryweaponAmmo = 6;
_primaryweaponTracers = 0;

//40mm Grenades - (integer)
_40mmHeGrenadesAmmo = 5 ;
_40mmSmokeGrenadesWhite = 1;
_40mmSmokeGrenadesYellow = 1;
_40mmSmokeGrenadesOrange = 0;
_40mmSmokeGrenadesRed = 1;
_40mmSmokeGrenadesPurple = 1;
_40mmSmokeGrenadesBlue = 0;
_40mmSmokeGrenadesGreen = 0;
_40mmFlareWhite = 0;
_40mmFlareYellow = 1;
_40mmFlareRed = 0;
_40mmFlareGreen = 0;
_40mmFlareIR = 0;

//weapons - handgun - (string)
_handgun = "rhsusf_weap_m1911a1";

//handgun items - (array)
_itemsHandgun = [];

//handgun ammo (if a handgun is given) - (integer)
_handgunAmmo = 2;
_launcher = "rhs_weap_M136";
//weapons - launcher - (string)
_launcher = "rhs_weap_M136";
if (JK_TF47_Launcher) then {
    _launcher = "tf47_at4_HEDP";
} else {
    _launcher = "rhs_weap_M136";
};
_launcherHandle = 0;    //should stay the way it is. Determines the class of ammunition for BIS_fnc_addWeapon. Specific launchers need specific _launcherHandle. Test it out.

//launcher ammo (if a launcher is given) - (integer)
_launcherAmmo = 1;

//binocular - (string)
_binocular = "ACE_Vector";

//throwables - (integer)
_grenadeHE = 3;
_grenadeSmokeWhite = 2;
_grenadeSmokeYellow = 0;
_grenadeSmokeOrange = 0;
_grenadeSmokeRed = 0;
_grenadeSmokePurple = 1;
_grenadeSmokeBlue = 1;
_grenadeSmokeGreen = 1;
_chemlightYellow = 0;
_chemlightRed = 0;
_chemlightGreen = 0;
_chemlightBlue = 0;
_IRgrenade = 0;

//ACE Items
_IVBagSaline250 = 1;
_IVBagSaline500 = 0;
_IVBagSaline1000 = 0;
_epinephrine = 3;
_morphine = 3;
_atropine = 0;

_fieldDressing = 10;
_packingBandage = 0;
_elasticBandage = 0;
_quikclot = 0;
_tourniquet = 0;

_earPlugs = 1;
_swapBarrel = 0;

//first aid kits and medi kits- (integer)
_FirstAidKits = 0;
_MediKit = 0;        //if set to 1, a MediKit and all FirstAidKits will be added to the backpack; if set to 0, FirstAidKits will be added to inventory in no specific order.

//items added specifically to uniform: - (array)
_itemsUniform = [];

//items added specifically to vest: - (array)
_itemsVest = [];

//items added specifically to Backpack: - (array)
_itemsBackpack = [];


//linked items - (array)
_itemsLink = [
        "ItemRadio",
        "ItemWatch",
        "ACE_NVG_Wide",
        "ItemCompass",
        "ItemMap"
        ];

//items added to any container - (array)
_items = ["ACE_Flashlight_MX991","ACE_HuntIR_M203","ACE_HuntIR_M203","ACE_HuntIR_M203","ACE_HuntIR_M203","ACE_HuntIR_monitor","ACE_MapTools","ACE_CableTie","ACE_microDAGR","rhsusf_acc_compm4"];

///// No editing necessary below this line /////

params ["_player"];
_player setCaptive true;    //unfortunately necessary due to the time consumed by changing the weapon
[_player] call jk_loadOut_fnc_gear;
_player setVariable ["ace_medical_medicClass", 0];
_player setVariable ["JK_CrateSpawnAllowed", true];
_player setVariable ["ACE_IsEngineer", 0];
_player setVariable ["JK_isPilot", false];
_player setCaptive false;

if (true) exitWith {};
