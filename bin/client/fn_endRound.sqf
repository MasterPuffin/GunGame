scriptName "fn_endRound";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_endRound.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_endRound.sqf"

// Play music
//playMusic "ending";

if (!isNil "gg_roundended") exitWith {};
gg_roundended = 1;

// Disable user input
disableUserInput true;
disableSerialization;

// Smooth transition
1000 cutRsc ["gungame_wintransition", "PLAIN"];
0.5 fadeMusic 0;

sleep 0.5;
playMusic "";
0 fadeMusic 1;

// Delete progression title
150 cutRsc ["Default", "PLAIN"];

// End screen
500 cutRsc ["EndScreen","PLAIN"];

[parseText "", [0,0,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

// Fill with data
_display = uiNamespace getVariable ["gg_endscreen", displayNull];

(_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>%1 HAS WON THE ROUND</t>", name gg_winner];

// Personal data
(_display displayCtrl 1) ctrlSetText format["%1", gg_kills];
(_display displayCtrl 2) ctrlSetText format["%1", gg_deaths];
(_display displayCtrl 3) ctrlSetText format["%1", gg_level + 1];
(_display displayCtrl 4) ctrlSetText format["%1", (count gg_weaponList) + 1];

// Final cam
gg_exitcam_object = "camera" camCreate (getPos player);
gg_exitcam_object cameraEffect ["Internal", "Back"];
gg_exitcam_object camSetFOV .65;
gg_exitcam_object camSetFocus [150, 1];
gg_exitcam_object camCommit 0;
sleep 0.05;
showCinemaBorder false;

// Proper cam animation
gg_exitcam_object camPreparePos [(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 0) - 200,(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 1) - 200, 100];
gg_exitcam_object camPrepareTarget ((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0);
gg_exitcam_object camCommitPrepared 0;
gg_exitcam_object camPreparePos [(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 0) + 200,(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 1) - 200, 100];
gg_exitcam_object camPrepareTarget ((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0);
gg_exitcam_object camCommitPrepared 38;

sleep 0.05;

// End music
playSound "ending";

// Sleep
sleep 30;

10000 cutRsc ["gungame_blackoutlong","PLAIN"];
sleep 2.3;
disableUserInput false;
endMission "END1";