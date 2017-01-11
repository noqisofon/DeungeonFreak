package dungeonfreak.ui;

import spaghetti.core.IEvent;
import spaghetti.geom.Rect;
import spaghetti.geom.ColorPair;


/*!
 * 
 */
class Control {
    /*!
     *
     */
    function new(title : String = "") {
        title_         = title;
        visible_       = false;
        controls_      = new ControlCollection( this );
        end_callbacks_ = new List();
        bounds_        = new Rect();
        parent_        = null;
    }

    public var          bounds (get, never)         : Rect;
    public function get_bounds()                    : Rect              { return bounds_; }

    public var          controls (get, never)       : ControlCollection;
    public function get_controls()                  : ControlCollection { return controls_; }

    public var          parent (get, never)         : Null<Control>;
    public function get_parent()                    : Null<Control> {
        if ( collection_ == null ) {
            
            return null;
        }
        return collection_.parent;
    }

    public var          screen (get, never)         : Null<Screen>;
    public function get_screen()                    : Null<Screen>   {
        if ( Std.is( this, Screen ) ) {

            return cast( this, Screen );
        }

        if ( this.parent != null ) {

            return this.parent.screen;
        }
        return null;
    }

    public var          hasFocus (get, never)       : Bool;
    public function get_hasFocus()                  : Bool {
        if ( this.screen == null ) {

            return false;
        }
        return this.screen.focusControl == this;
    }

    public var          canChangeFocus (get, never) : Bool;
    public function get_canChangeFocus              : Bool {
        if ( this.parent == null ) {

            return false;
        }

        for ( sibling in this.parent.controls ) {
            if ( (sibling != this) && Std.is( sibling, IFocusable ) ) {

                return false;
            }
        }
        return false;
    }

    public var          titleColor (get, never)     : ColorPair;
    public function get_titleColor()                : ColorPair {
        if ( this.hasFocus ) {

            return new ColorPair( Color.yellow, Color.black );
        }
        return new ColorPair( Color.gray, Color.black );
    }

    public var          textColor (get, never)     : ColorPair;
    public function get_textColor()                : ColorPair {
        if ( this.hasFocus ) {

            return new ColorPair( Color.white, Color.black );
        }
        return new ColorPair( Color.darkGray, Color.black );
    }

    public var          selectColor (get, never)   : ColorPair;
    public function get_selectColor()              : ColorPair {
        if ( this.hasFocus ) {

            return new ColorPair( Color.black, Color.yellow );
        }
        return new ColorPair( Color.white, Color.black );
    }

    public var          visible (get, set)          : Bool;
    public function get_visible()                   : Bool { return visible_; }
    public function set_visible(value : Bool)       : Void {
        if ( visible_ != value ) {
            visible_ = value;

            if ( visible_ ) {
                repaint();
            } else if ( this.screen != null && this.screen.ui != null ) {
                this.screen.ui.repaint();
            }
        }
    }

    /*!
     *
     */
    public function paint(parent_terminal : ITerminal) : Void {
        // Profiler.block( "control paint" );
        if ( this.visible && this.bounds.area > 0 ) {
            var local : ITerminal = parent_terminal[this.bounds];

            onPaint( parent_terminal );

            for ( control in controls_ ) {
                control.paint( local );
            }
        }
    }

    /*!
     *
     */
    public function repaint() : Void {
        if ( this.parent != null ) {
            paint( this.parent.terminal );
        }
    }

    /*!
     *
     */
    public function focusPrevious() : Void {
        changeFocus( -1 );
    }

    /*!
     *
     */
    public function focusNext() : Void {
        changeFocus(  1 );
    }

    /*!
     *
     */
    public function controlKeyPress(key : KeyInfo) : Bool {
        var handled = false;

        var handler : IInputHandler = this;
        if ( handler != null ) {
            if ( key.status == ButtonStatus.Down ) {
                handled = handler.keyDown( key );
            } else {
                handled = handler.keyUp( key );
            }
        }

        if ( !handled ) {
            for ( control in controls_ ) {
                handled = control.controlKeyPress( key );
            }
        }
        return handled;
    }

    /*!
     *
     */
    function listenTo<TSender, TArgs>(an_event : IEvent<TSender, TArgs>, handler : TSender -> TArgs) : Void {
        // listen to it
        an_event.add( handler );

        // and keep track of it to unregister later
        end_callbacks_.add( function () { an_event.remove( handler ); } );
    }

    /*!
     *
     */
    function repaintOn<TSender, TArgs>(an_event : IEvent<TSender, TArgs>) : Void {
        listenTo( an_event, function (sender, args) { repaint(); } );
    }

    /*!
     *
     */
    function getBounds()/* : Rect */{}

    /*!
     *
     */
    function onPaint(terminal : ITerminal) : Void {
        terminal.clear();
    }

    /*!
     *
     */
    function onAttach(parent : Control) : Void {
    }

    /*!
     *
     */
    function init() : Void {
        for ( child in controls_ ) {
            child,init();
        }
    }

    /*!
     *
     */
    function end() : Void {
        for ( callback in end_callbacks_ ) {
            callback();
        }

        for ( child in controls_ ) {
            child,end();
        }
    }

    /*!
     *
     */
    private function changeFocus(offset : Int) : Void {
        if ( this.screen != null ) {
            var count = this.parent.controls.length;
            var index = this.parent.controls.indexOf( this );

            while ( true ) {
                index = (index + count + offset) % count;

                var a_control : Control = this.parent.controls[index];
                if ( a_control == this ) {

                    break;
                }

                var focusable : IFocusable = a_control;
                if ( focusable != null ) {
                    this.screen.focus( focusable );

                    break;
                }
            }
        }
    }

    private var         title_                      : String;
    private var         visible_                    : Bool;
    private var         bounds_                     : Rect;
    private var         end_callbacks_              : List<Void -> Void>;
    private var         collections_                : Array<Control>;
    private var         controls_                   : Array<Control>;
    private var         parent_                     : Null<Control>;
}

// Local Variables:
//   coding: utf-8
// End: