package spaghetti.geom;


/*!
 *
 */
class Point implements IPointable {
    /*!
     *
     */
    public function new(x : Int, y : Int) {
        this.x = x;
        this.y = y;
    }

    public var x       (default, default) : Int;
    public var y       (default, default) : Int;
}

// Local Variables:
//   coding: utf-8
// End: