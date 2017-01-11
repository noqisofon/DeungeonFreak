package tests.spaghetti.core;

import haxe.Int64;
import haxe.unit.TestCase;
import spaghetti.core.Random;


class RandomTest extends TestCase {

    public function testNextFloat() {
        var N = 57;
        print( "\n" );
        print( "testNextFloat() :\n" );
        var random = Random.getDefault();

        for ( unused in 0...N ) {
            var n = random.nextFloat();

            print( '    $n\n' );
        
            assertTrue( 0.0 <= n && n <= 1.0 );
        }
    }

    public function testNext() {
        var N = 57;
        print( "\n" );
        print( "testNext() :\n" );
        var random = Random.getDefault();

        for ( unused in 0...N ) {
            var n = random.next();

            print( '    $n\n' );
        
            assertTrue( 0 <= n );
            assertTrue( n <  2147483647 );
        }
    }

    public function testCycle() {
        var N = 1000;
        print( "\n" );
        print( "testCycle() :\n" );
        var random = Random.getDefault();

        var map : Map<Int, Int> = new Map();

        for ( unused in 0...N ) {
            var n = random.next();

            var hoge = map[n];
            if ( hoge == null ) {
                hoge = 1;
            } else {
                // 同じ数が来ると、1 増やします。
                ++ hoge;
            }
            map[n]   = hoge;
        }

        var all_one = 0;
        for ( key in map.keys() ) {
            // print( '    $key => ${map[key]}\n' );
            if ( map[key] == 1 ) {
                ++ all_one;
            }
        }

        assertEquals( N, all_one );
    }
}

// Local Variables:
//   coding: utf-8
// End: