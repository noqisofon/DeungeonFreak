package dungeonfreak.engine.dungeon;

import spaghetti.core.Array2D;
import spaghetti.geom.Point;
import spaghetti.geom.Rect;
import spaghetti.geom.Vector2D;


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
            
        }
    }
}

// Local Variables:
//   coding: utf-8
// End: