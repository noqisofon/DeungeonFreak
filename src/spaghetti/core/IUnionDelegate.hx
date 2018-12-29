package spaghetti.core;


/*!
 *
 */
interface IUnionDelegate<TSender, TArgs> {
    /*!
     *
     */
    function add(handler : TSender -> TArgs -> Void) : Void;

    /*!
     *
     */
    function remove(handler : TSender -> TArgs -> Void) : Void;
}