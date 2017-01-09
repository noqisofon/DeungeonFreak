package spaghetti.core;


/*!
 *
 */
abstract Array2DAccess<T>(Array2D) {
    /*!
     *
     */
    public function new(base : Array2D<T>) {
        this = base;
    }
}

// Local Variables:
//   coding: utf-8
// End: