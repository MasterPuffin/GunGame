scriptName "fn_suspensemusic";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_suspensemusic.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_suspensemusic.sqf"

if (!isNil "gg_suspensemusic") exitWith {};

0 fadeMusic 0.4;
playmusic "LeadTrack04_F_EPC";
gg_suspensemusic = 1;