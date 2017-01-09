package dungeonfreak.engine.dungeon;


interface IDungeonTile {
    function setTileType(a_tile_type : TileType) : Bool;
    function setVisible(visible : Bool) : Bool;
    function setExplored() : Bool;
    function setTileThingLight(light : Bool) : Bool;
    function setTilePermanentLight(light : Bool) : Bool;
}

// Local Variables:
//   coding: utf-8
// End: