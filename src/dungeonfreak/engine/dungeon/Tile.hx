package dungeonfreak.engine.dungeon;


/*!
 *
 */
class Tile implements IDungeonTile {
    /*!
     *
     */
    public function new(a_tile_type : TileType, self_light : Bool = false) {
        type_                 = a_tile_type;
        self_light_           = self_light;

        visible_              = false;
        explored_             = false;
        light_by_thing_       = false;
        tile_permanent_light_ = false;
    }

    public var          type (get, set)                   : TileType;
    public function get_type()                            : TileType { return type_; }
    public function set_type(value : TileType)            : Void     {        type_ = value; }

    public var          isVisible (get, never)            : Bool;
    public function get_isVisible()                       : Bool     { return visible_; }

    public var          isExplored (get, never)           : Bool;
    public function get_isExplored()                      : Bool     { return explored_; }

    public var          isExplored (get, never)           : Bool;
    public function get_isExplored()                      : Bool     { return explored_; }

    public var          isTileThingLight (get, never)     : Bool;
    public function get_isTileThingLight()                : Bool     { return light_by_thing_; }

    public var          isTilePermanentLight (get, never) : Bool;
    public function get_isTilePermanentLight()            : Bool     { return tile_permanent_light_; }

    public var          isLight (get, never)              : Bool;
    public function get_isLight()                         : Bool     { return light_by_thing_ || tile_permanent_light_; }

    public var          isPassable (get, never)           : Bool;
    public function get_isPassable()                      : Bool     { return TileTypeExtension.isPassable( type_ ); }

    public var          isTransparent (get, never)        : Bool;
    public function get_isTransparent()                   : Bool     { return TileTypeExtension.isTransparent( type_ ); }

    /*!
     *
     */
    public function light() : Void {
        self_light_ = true;
    }

    /*!
     *
     */
    public function lightKnown() : Void {
        self_light_ = true;
        explored_   = true;
    }
    
    /*!
     *
     */
    public function setTileType(a_tile_type : TileType) : Bool {
        if ( type_ == a_tile_type ) {

            return false;
        }

        type_ = a_tile_type;

        return true;
    }

    /*!
     *
     */
    public function setVisible(visible : Bool) : Bool {
        if ( visible_ == visible ) {

            return false;
        }

        visible_ = visible;

        return true;
    }
    
    /*!
     *
     */
    public function setExplored() : Bool {
        if ( explored_ ) {

            return false;
        }

        explored_ = true;

        return true;
    }
    
    /*!
     *
     */
    public function setTileThingLight(light : Bool) : Bool {
        if ( light_by_thing_ == light ) {

            return false;
        }

        light_by_thing_ = light;

        return true;
    }
    
    /*!
     *
     */
    public function setTilePermanentLight(light : Bool) : Bool {
        if ( tile_permanent_light_ == light ) {

            return false;
        }

        tile_permanent_light_ = light;

        return true;
    }

    private var type_                 : TileType;
    private var self_light_           : Bool;
    private var visible_              : Bool;
    private var explored_             : Bool;
    private var light_by_thing_       : Bool;
    private var tile_permanent_light_ : Bool;
}

// Local Variables:
//   coding: utf-8
// End: