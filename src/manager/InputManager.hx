package manager;

import interfaces.InputHandler;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import enums.GameDefs;

/**
 * ...
 * @author Yogr
 */

class InputManager 
{
    private static var sInstance:InputManager;
    
    private var mInputHandlers:Array<InputHandler>;
    private var mInputPriority:Array<Int>;
    
    //-----------------------------------------------------------------------------------
    /// Constructor
    public function new() 
    {
        mInputHandlers = [];
        mInputPriority = [];
        DefineInputs();
    }
    
    //-----------------------------------------------------------------------------------
    /// To retrieve the Singleton instance
    public static function GetInstance():InputManager
    {
        if (null == sInstance)
        {
            sInstance = new InputManager();
        }
        return sInstance;
    }
    
    //-----------------------------------------------------------------------------------
    /// called every frame if called in another update() flow
    public function update():Void
    {
        if(Input.check(GameDefs.INPUT_LEFT)) { FireInput(InputCode.LEFT); }
        if(Input.check(GameDefs.INPUT_RIGHT)) { FireInput(InputCode.RIGHT); }
        if(Input.check(GameDefs.INPUT_UP)) { FireInput(InputCode.UP); }
        if(Input.check(GameDefs.INPUT_DOWN)) { FireInput(InputCode.DOWN); }
    }
    
    //-----------------------------------------------------------------------------------
    /// Register your class to handle input
    public function Register(obj:InputHandler, priority:Int):Void
    {
        var insertAt:Int = 0;
        
        for (i in mInputPriority)
        {
            if (priority > mInputPriority[i])
            {
                break;
            }
            insertAt++;
        }
        
        mInputPriority.insert(insertAt, priority);
        mInputHandlers.insert(insertAt, obj);
    }
    
    //-----------------------------------------------------------------------------------
    /// Define all the inputs
    private function DefineInputs():Void
    {
        Input.define(GameDefs.INPUT_LEFT, [Key.LEFT, Key.A]);
        Input.define(GameDefs.INPUT_RIGHT, [Key.RIGHT, Key.D]);
        Input.define(GameDefs.INPUT_UP, [Key.UP, Key.W]);
        Input.define(GameDefs.INPUT_DOWN, [Key.DOWN, Key.S]);
    }
    
    //-----------------------------------------------------------------------------------
    /// Fire input out to all ye who listen
    private function FireInput(value:InputCode):Void
    {
        var trapInput:Bool = false;
        
        for (handler in mInputHandlers)
        {
            trapInput = handler.HandleInput(value);
            
            if (true == trapInput)
            {
                break;
            }
        }
    }
    
}