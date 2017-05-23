scriptName "fn_voteForMap";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_voteForMap.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_voteForMap.sqf"

_index = _this select 0;

// Update map voting array
gg_mapvotes set [_index, (gg_mapvotes select _index) + 1];