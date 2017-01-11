package dungeonfreak.ui;


/*!
 *
 */
interface IFocusable extends IInputHandler {
    var instruction : String;

    function gainFocus() : Void;
    function loseFocus() : Void;
}

// Local Variables:
//   coding: utf-8
// End: