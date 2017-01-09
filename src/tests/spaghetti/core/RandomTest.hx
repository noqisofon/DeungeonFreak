package tests.spaghetti.core;

import haxe.Int64;
import haxe.unit.TestCase;
import spaghetti.core.Random;


class RandomTest extends TestCase {

    public function testNextFloat() {
        print( "\n" );
        print( "testNextFloat() :\n" );
        var random = Random.getDefault();

        for ( unused in 0...56 ) {
            var n = random.nextFloat();

            print( '    $n\n' );
        
            assertTrue( 0.0 <= n && n <= 1.0 );
        }
    }

    public function testNext() {
        print( "\n" );
        print( "testNext() :\n" );
        var random = Random.getDefault();

        for ( unused in 0...56 ) {
            var n = random.next();

            print( '    $n\n' );
        
            assertTrue( n < 2147483647 );
        }
    }
}

// Local Variables:
//   coding: utf-8
// End: