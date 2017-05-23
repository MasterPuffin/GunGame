scriptName "fn_voteForMap";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_voteForMap.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_voteForMap.sqf"

disableSerialization;

_index = lbCurSel ((findDisplay 5100) displayCtrl 1);

// Send vote to server
[_index] remoteExec ["mav_fnc_voteForMap", 2];

// Close dialog
closeDialog 0;

// Display what map he voted for
100 cutRsc ["gungame_mapvotedfor", "PLAIN"];

_display = uiNamespace getVariable "gg_mapvotedfor",
_ctrl = _display displayCtrl 0;

// Display text
_ctrl ctrlSetText format ["You have voted for %1. Waiting for voting to finish...", (getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select _index) select 1];