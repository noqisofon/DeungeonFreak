package dungeonfreak.ui;


/*!
 *
 */
interface IInputHandler {
    var keyInstructions (get, never) : Array<KeyInstruction>;

    function keyDown(key : KeyInfo) : Bool;
    function keyUp(key : KeyInfo) : Bool;
}

// Local Variables:
//   coding: utf-8
// End: