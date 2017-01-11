package spaghetti.geom;


/*!
 *
 */
abstract PackedARGB(Int) from Int to Int {
    /*!
     *
     */
    public inline function new(red = 0, green = 0, blue = 0, alpha = 0) {
        this = ( alpha << 24 ) | ( red << 16 ) | ( green << 8 ) | b;
    }

    /*!
     *
     */
    public function ToColor() {
        var alpha =  this >>> 24;
        var red   = (this >>> 16) & 0xff;
        var green = (this >>>  8) & 0xff;
        var blue  =  this         & 0xff;

        return new Color( red, green, blue, alpha );
    }

    /*!
     *
     */
    public function toString() {
        var alpha =  this >>> 24;
        var red   = (this >>> 16) & 0xff;
        var green = (this >>>  8) & 0xff;
        var blue  =  this         & 0xff;

        return 'rgba( $red, $green, $blue, $alpha )';
    }
}

// Local Variables:
//   coding: utf-8
// End: