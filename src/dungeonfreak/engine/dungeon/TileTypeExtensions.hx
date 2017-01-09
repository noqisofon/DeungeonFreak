package dungeonfreak.engine.dungeon;


/*!
 *
 */
class TileTypeExtensions {
    public static function isPassable(type : TileType) : Bool {
        return switch ( type ) {
            case TileType.Wall:                    return false;
            case TileType.Door(DoorStatus.Closed): return false;
            default:                               return true;
        }
    }

    public static function isTransparent(type : TileType) : Bool {
        return switch ( type ) {
            case TileType.Wall:                    return false;
            case TileType.Door(DoorStatus.Closed): return false;
            default:                               return true;
        }
    }
}

// Local Variables:
//   coding: utf-8
// End: