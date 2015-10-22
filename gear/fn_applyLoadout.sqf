﻿/*
loadout script by joko
Idea by Belbo
adds the loadouts to the specific playable units for the side West
Call from initPlayerLocal.sqf via:
[object,true] call JK_loadOut_fnc_applyLoadout;
    with
    _this select 0 = object - target the loadout is applied to.
    _this select 1 = boolean - whether or not the target in _zeus is supposed to be invincible.
*/
JK_var_gearByClasses = false;
// insert names of new units here in their correspondent Objects:
//commanders
_command = ["a_sl", "b_sl", "plt_sgt"];
//group leaders
_SL = ["b1_ftl", "b2_ftl", "a1_ftl", "a2_ftl"];
//medics
_medics = ["plt_med", "a_med", "b_med"];

//MG-Schützen
_MG = ["b1_ar" ,"b2_ar", "a1_ar", "a2_ar"];
//assistant MG
_assMG = ["b1_aar", "b2_aar", "a1_aar", "a2_aar"];
//AT-Soldiers/AT-Specialists
_AT = ["a1_at", "a2_at", "b1_at", "b2_at"];
//AT-Assistent
_ATass = ["a1_ab", "a2_ab", "b1_ab", "b2_ab"];
//Grenadiers
_grenadier = ["b2_rm", "a2_rm"];
//Riflemen
_soldier = ["a1_rm", "b1_rm"];
//designated Marksmen
_marksmen = [""];
//engineers/repair-/explosive-specialists
_spec = ["plt_eng"];
//pilots
_pilots = ["r_1", "r_2", "r_3"];
//Crew
_crew = ["rh1_driver", "rh1_co", "rh1_gunner"];
//Pilot
_jetPilot = ["pj_1", "pj_2"];
//PJ
_pjMedic = ["r_4"];
//AT-SMAW
_ATmk153 = [];
//Paratrooper
_paratrooper = [];

// insert Classnames of the units
_commandClass = ["B_Soldier_SL_F"];
_SLClass = ["B_Soldier_TL_F"];
_medicsClass = ["B_medic_F"];
_MGClass = ["B_soldier_AR_F"];
_assMGClass = ["B_soldier_AAR_F"];
_ATClass = ["B_soldier_LAT_F"];
_ATmk153Class = ["B_Soldier_HAT_F"];
_ATassClass = ["B_Soldier_A_F"];
_grenadierClass = [];
_soldierClass = ["B_Soldier_F"];
_paratrooperClass = ["B_Soldier_P_F"];
_marksmenClass = [];
_specClass = [];
_pilotsClass = ["B_Pilot_F"];
_crewClass = ["B_crew_F"];
_jetPilotClass = [];
_pjMedicClass = [];

///// No editing necessary below this line /////
private ["_object","_target"];
params [["_target", player, [objNull]]];
_object = str _target;

_class = "";

//switch to select the applicable loadout function
if (!JK_var_gearByClasses) then {
    _class = switch true do {
        case (_object in _command): {"command"};
        case (_object in _SL): {"leader"};
        case (_object in _medics): {"medic"};
        case (_object in _MG): {"MG"};
        case (_object in _paratrooper): {"paratrooper"};
        case (_object in _assMG): {"assMG"};
        case (_object in _AT): {"AT"};
        case (_object in _ATmk153): {"ATmk153"};
        case (_object in _ATass): {"ATAss"};
        case (_object in _grenadier): {"grenadier"};
        case (_object in _soldier): {"Rifleman"};
        case (_object in _marksmen): {"marksman"};
        case (_object in _spec): {"specialist"};
        case (_object in _pilots): {"pilot"};
        case (_object in _crew): {"crew"};
        case (_object in _jetPilot): {"jetPilot"};
        case (_object in _pjMedic): {"pjMedic"};
        default{""};
    };
};
if (_class == "" || JK_var_gearByClasses) then {
    _class = switch true do {
        case (typeOf _target in _commandClass): {"command"};
        case (typeOf _target in _SLClass): {"leader"};
        case (typeOf _target in _medicsClass): {"medic"};
        case (typeOf _target in _MGClass): {"MG"};
        case (typeOf _target in _assMGClass): {"assMG"};
        case (typeOf _target in _ATClass): {"AT"};
        case (typeOf _target in _ATmk153Class): {"ATmk153"};
        case (typeOf _target in _ATassClass): {"ATAss"};
        case (typeOf _target in _grenadierClass): {"grenadier"};
        case (typeOf _target in _soldierClass): {"Rifleman"};
        case (typeOf _target in _paratrooperClass): {"paratrooper"};
        case (typeOf _target in _marksmenClass): {"marksman"};
        case (typeOf _target in _specClass): {"specialist"};
        case (typeOf _target in _pilotsClass): {"pilot"};
        case (typeOf _target in _crewClass): {"crew"};
        case (typeOf _target in _jetPilotClass): {"jetPilot"};
        case (typeOf _target  in _pjMedicClass): {"pjMedic"};
        default {"Rifleman"};
    };
};

[_target, _class] call JK_loadOut_fnc_selectGear;

if (true) exitWith {};
