scriptName "fn_selectMap";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_selectMap.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_selectMap.sqf"

// Close dialogs
closeDialog 0;
disableSerialization;

// Create cam that hovers above arena
gg_introcam_object = "camera" camCreate (getPos player);
gg_introcam_object cameraEffect ["Internal", "Back"];
gg_introcam_object camSetFOV .65;
gg_introcam_object camSetFocus [150, 1];
gg_introcam_object camCommit 0;
sleep 0.05;
showCinemaBorder false;

// Note that I was in the map selection screen
gg_didSelectMap = 1;

// Smooth transition
50000 cutRsc ["gungame_selectmaptransition","PLAIN"];
sleep 3;

// Open map selection dialog
createDialog "gg_dialog_votemap";
waitUntil {dialog};

// Clear listbox
_listbox = (findDisplay 5100) displayCtrl 1;
lbClear _listbox;

// Load arenas into listbox
_arenas = getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data");
{
	_listbox lbAdd (_x select 1);
} forEach _arenas;

// Select first map
_listbox lbSetCurSel 0;
[0, 0] spawn gg_fnc_showArena;