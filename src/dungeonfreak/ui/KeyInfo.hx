package dungeonfreak.ui;


/*!
 * 
 */
class KeyInfo {
    /*!
     *
     */
    public function new(key : KeySymbol, control : Bool = false, shift : Bool = false, status : ButtonStatus = ButtonStatus.Down) {
        key_     = key;
        control_ = control;
        shift_   = shift;
        status_  = status;
    }
    
    public var          key     (get; never) : KeySymbol;
    public function get_key()                : KeySymbol    { return key_; }
    
    public var          control (get; never) : Bool;
    public function get_control()            : Bool         { return control_; }
    
    public var          shift   (get; never) : Bool;
    public function get_shift()              : Bool         { return shift_; }

    public var          status  (get; never) : ButtonStatus;
    public function get_status()             : ButtonStatus { return status_; }

    private var key_     : KeySymbol;
    private var control_ : Bool;
    private var shift_   : Bool;
    private var status_  : ButtonStatus;
}

// Local Variables:
//   coding: utf-8
// End: