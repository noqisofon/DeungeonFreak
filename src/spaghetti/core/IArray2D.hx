package spaghetti.core;


interface IArray2D<T> {
    function at(x : Int, y : Int) : Null<T>;
    function put(x : Int, y : Int, value : T) : Void;
}

// Local Variables:
//   coding: utf-8
// End: