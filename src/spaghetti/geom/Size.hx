package spaghetti.geom;


/*!
 *
 */
class Size implements ISizable {
    /*!
     *
     */
    public function new(width : Int, height : Int) {
        this.width  = width;
        this.height = height;
    }
    
    public var width  (default, default) : Int;
    public var height (default, default) : Int;
}

// Local Variables:
//   coding: utf-8
// End: