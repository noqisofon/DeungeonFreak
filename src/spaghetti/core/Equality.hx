package spaghetti.core;


// /*!
//  * 
//  */
// abstract Equality<T>(T) to T {

//     /*!
//      *
//      */
//     public inline function new(value : T) {
//         this = value;
//     }

//     /*!
//      *
//      */
//     @:op(A == B)
//     public static function equals(left : Equality, right : Equality) : Bool {
//         return  left.equals( right );
//     }

//     /*!
//      *
//      */
//     @:op(A != B)
//     public static function nequals(left : Equality, right : Equality) : Bool {
//         return !left.equals( right );
//     }

// }