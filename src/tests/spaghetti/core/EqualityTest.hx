package tests.spaghetti.core;

import haxe.unit.TestCase;
import spaghetti.core.Equality;


class Hoge {
    public var value (default, default) : Int;

    public function new(value : Int) {
        this.value = value;
    }
}


class EqualityTest extends TestCase {

    public function testEquality() {
        // var actual   = new Equality( new Hoge( 42 ) );
        var actual = new Hoge( 42 );
        // var expected = new Equality( new Hoge( 42 ) );
        var expected = new Hoge( 42 );

        // assertEquals( actual, expected );
        assertTrue( actual.value == expected.value );
    }

}

// Local Variables:
//   coding: utf-8
// End: