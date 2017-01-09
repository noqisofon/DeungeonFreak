package dungeonfreak.engine.dungeon;

import spaghetti.core.Array2D;
import spaghetti.geom.Point;
import spaghetti.geom.Rect;
import spaghetti.geom.Vector2D;


typedef Cell = {
  var isOpen         : Bool;
  var isLeftWallOpen : Bool;
  var isTopWallOpen  : Bool;
};

/*!
 *
 */
class MazeMaker {
    /*!
     *
     */
    public function new(width : Int, height : Int) {
        cells_ = new Array2D<Cell>( width + 1, height + 1 );
        cells_.fillMap( function (pos : Vector2D) { return new Cell(); } );
    }

    public var          bounds (get, never) : Rect;
    public function get_bounds()            : Rect  { return new Rect( 0, 0, cells_.width - 1. cells_.height - 1 ); }

    /*!
     *
     */
    public function growTree() : Void {
        var cells = new List<Point>();

        var a_point : Point = RNG.nextPoint( this.bounds );

        function abs(n : Int) { return if ( n < 0 ) -n else n; }

        open( a_point );
        cels.push( a_point );

        while ( cells.length > 0 ) {
            var index : Int  = abs( RNG.triangleInt( 0, cells.length - 1 ) );
            var cell  : Point = cells[index];

            var unmade_cells = new List<Direction>();
            if ( canCarve( cell, Direction.North ) ) { unmade_cells.push( Direction.North ); }
            if ( canCarve( cell, Direction.East ) )  { unmade_cells.push( Direction.East ); }
            if ( canCarve( cell, Direction.South ) ) { unmade_cells.push( Direction.South ); }
            if ( canCarve( cell, Direction.West ) )  { unmade_cells.push( Direction.West ); }

            if ( unmade_cells.length > 0 ) {
                var a_direction = RNG.choose( unmade_cells );

                carve( cell, a_direction );

                cells.push( cell.plusDirection( a_direction ) );
            } else {
                var removee = cells[index];
                
                cells.remove( removee );
            }
        }
    }

    /*!
     *
     */
    public function addLoops(chance : Int) : Void {
        if ( chance > 0 ) {
            var a_rect = new Rect( 0, 0, this.bounds.width - 1, this.bounds.height - 1 );
            for ( y in 0...a_rect.height ) {
                for ( x in 0...a_rect.width ) {
                    var a_cell = new Vector2D( x, y );

                    if ( RNG.oneIn( chance ) ) {
                        if ( isOpen( cell ) && isOpen( cell.pushDirection( Direction.East ) ) ) {
                            carve( cell, Direction.East );
                        }
                    }

                    if ( RNG.oneIn( chance ) ) {
                        if ( isOpen( cell ) && isOpen( cell.pushDirection( Direction.South ) ) ) {
                            carve( cell, Direction.South );
                        }
                    }
                }
            }
        }
    }

    /*!
     *
     */
    public function sparsify(sparse_step : Int): Void {
        for ( i in 0...(sparse_step - 1) ) {
            
            for ( y in 0...this.bounds.height ) {
                for ( x in 0...this.bounds.width ) {
                    var a_cell = new Vector2D( x, y );

                    if ( getNumExists( cell ) == 1 ) {
                        fill( cell );
                    }
                }
            }
            
        }
    }

    /*!
     *
     */
    public function draw(tiles : Array2D<Tile>) : Void {
        drawMap( function (pos : Vector2D) { tiles.[pos].type = TileType.Floor; } );
    }

    /*!
     *
     */
    public void drawMap(carve_opening : Vector2D -> Void) : Void {
        for ( y in 0...this.bounds.height ) {
            for ( x in 0...this.bounds.width ) {
                var position = new Vector2D( x, y );

                if ( this.bounds.contains( position ) && cells_[position],isOpen ) {
                    var tile : Vector2D = ( position * 2 ) + 1;

                    carve_opening( tile );
                }

                if ( ( position.y < this.bounds.height ) && cells_[position].isLeftWallOpen ) {
                    var tile : Vector2D = ( position * 2 ) + new Vector2D( 0, 1 );

                    carve_opening( tile );
                }

                if ( ( position.x < this.bounds.width ) && cells_[position].isTopWallOpen ) {
                    var tile : Vector2D = ( position * 2 ) + new Vector2D( 1, 0 );

                    carve_opening( tile );
                }
            }
        }
    }

    /*!
     *
     */
    private function isOpen(position : Vector2D) : Bool {
        if ( !this.bounds.contains( position ) ) {
            throw { name: "ArgumentOutOfRangeException", message: "position" };
        }
        return cells_[position].isOpen;
    }

    /*!
     *
     */
    private function canCarve(position : Vector2D, a_direction : Direction) : Bool {
        if ( !this.bounds.contains( position ) ) {

            return false;
        }

        if ( !this.bounds.contains( position.plusDirection( a_direction ) ) ) {

            return false;
        }

        if ( cells_[position.plusDirection( a_direction )].isOpen ) {

            return false;
        }
        return true;
    }

    /*!
     *
     */
    private function getNumExists(position : Vector2D) : Int {
        if ( !this.bounds.contains( position ) ) {
            throw { name: "ArgumentOutOfRangeException", message: "position" };
        }

        var exists = 0;
        if ( cells_[position].isLeftWallOpen ) { ++ exists; }
        if ( cells_[position].isTopWallOpen ) { ++ exists; }
        if ( cells_[position.offsetX( 1 )].isLeftWallOpen ) { ++ exists; }
        if ( cells_[position.offsetY( 1 )].isTopWallOpen ) { ++ exists; }

        return exists;
    }

    /*!
     *
     */
    private function open(position : Vector2D) : Void {
        if ( !this.bounds.contains( position ) ) {
            throw { name: "ArgumentOutOfRangeException", message: "position" };
        }

        cells_[position].isOpen = true;
    }

    /*!
     *
     */
    private function fill(position : Vector2D) : Void {
        if ( !this.bounds.contains( position ) ) {
            throw { name: "ArgumentOutOfRangeException", message: "position" };
        }

        cells_[position].isLeftWallOpen              = false;
        cells_[position].isTopWallOpen               = false;
        cells_[position.offsetX( 1 )].isLeftWallOpen = false;
        cells_[position.offsetY( 1 )].isTopWallOpen  = false;
    }

    /*!
     *
     */
    private function carve(position : Vector2D, a_direction : Direction): Void {
        if ( !this.bounds.contains( position ) ) {
            throw { name: "ArgumentOutOfRangeException", message: "position" };
        }

        if ( this.bounds.contains( position.plusDirection( a_direction ) ) ) {
            cells_[position.plusDirection( a_direction )].isOpen = true;
        }

        switch ( a_direction ) {
            case Direction.North:
                cells_[position].isTopWallOpen                                 = true;

            case Direction.South:
                cells_[position.plusDirection( a_direction )].isTopWallOpen    = true;

            case Direction.West:
                cells_[position].isLeftWallOpen                                = true;

            case Direction.West:
                cells_[position.plusDirection( a_direction )].isLeftWallOpen   = true;

            default:
                throw { name: 'ArgumentException', message: 'The direction must be one of North, South, East or West' };
        }
    }

    private var cells_ : Array2D<Cell>;
}

// Local Variables:
//   coding: utf-8
// End: