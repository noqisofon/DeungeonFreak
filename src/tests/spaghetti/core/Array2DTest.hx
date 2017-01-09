package tests.spaghetti.core;

import haxe.unit.TestCase;
import spaghetti.core.Array2D;


class Array2DTest extends TestCase {
    public function testCreateArray2DInstance() {
        var ary = new Array2D( 26, 27 );

        assertEquals( 26, ary.width );
        assertEquals( 27, ary.height );

        var a_size = ary.size;
        {
            assertEquals( 26, a_size.width );
            assertEquals( 27, a_size.height );
        }

        var a_rect = ary.bounds;
        {
            assertEquals( 26, a_rect.width );
            assertEquals( 27, a_rect.height );
        }
    }

    public function testFillAndArrayAccess() {
        var ary = new Array2D( 50, 50 );

        ary.fillMap( function (pos) { return ( pos.y * ary.width ) + pos.x; } );

        // assertEquals( 0, ary[0, 0] );
        var that : Int = ary.at( 5, 5 );
        // if ( that != null ) {
        assertEquals( ( 5 * ary.width ) + 5, that );
        // }
    }

    public function testFillAndArrayAccess2() {
        var ary = new Array2D( 50, 50 );

        ary.fill( 42 );
        assertEquals( 42, ary.at( 24, 24 ) );

        ary.put( 24, 24, 132 );
        assertEquals( 132, ary.at( 24, 24 ) );
    }
}