package tests.spaghetti.geom;

import haxe.unit.TestCase;
import spaghetti.geom.Color;
import spaghetti.geom.KnownColor;
import spaghetti.geom.PackedARGB;


class ColorTest extends TestCase {

    public function testKnownColorAsColor() {
        var packed_color : PackedARGB = KnownColor.AliceBlue;
        var a_color      : Color      = packed_color.toColor();

        assertEquals( 240, a_color.red );
        assertEquals( 248, a_color.green );
        assertEquals( 255, a_color.blue );

        assertEquals( 255, a_color.alpha );
    }

    public function testIdentity() {
        var actual   = cast( KnownColor.Khaki, PackedARGB ).toColor();
        var expected = new Color( 240, 230, 140 );

        //assertEquals( actual, expected );
        assertTrue( expected.equals( actual ) );
    }

    public function testToString() {
        var indigo = cast( KnownColor.Indigo, PackedARGB ).toColor();

        assertEquals( 'rgba( 75, 0, 130, 255 )', indigo.toString() );
    }

}