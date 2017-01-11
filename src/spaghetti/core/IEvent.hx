package spaghetti.core;


/*!
 *
 */
interface IEvent<TSender, TArgs> {
    /*!
     *
     */
    function add(handler : TSender -> TArgs) : Void;

    /*!
     *
     */
    function remove(handler : TSender -> TArgs) : Void;
}