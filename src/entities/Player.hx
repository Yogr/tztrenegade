package entities;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import interfaces.InputHandler;
import manager.InputManager;
import enums.GameDefs;

/**
 * ...
 * @author Yogr
 */

class Player extends Entity, implements InputHandler
{
    //-----------------------------------------------------------------------------------
    /// Constructor
    public function new(imagePath:String, startX:Int, startY:Int) 
    {
        var hero:Image = new Image(imagePath);
        hero.x = 75;
		hero.y = 292;
        
        this.graphic = hero;
        
        super();
        
        begin();
    }
    
    //-----------------------------------------------------------------------------------
    /// Initializer
    public function begin():Void
    {
        InputManager.GetInstance().Register(this, 100);
    }
    
    //-----------------------------------------------------------------------------------
    /// Our required HandleInput function as this is an InputHandler
    public function HandleInput(value:InputCode):Bool
    {
        var handled:Bool = false;
        
        switch(value)
        {
            case InputCode.LEFT:
                {
                    trace("moving Left");
                    handled = true;
                }
            case InputCode.RIGHT:
                {
                    trace("moving Right");
                    handled = true;
                }
            case InputCode.UP:
                {
                    trace("Jumpy?");
                    handled = true;
                }
            case InputCode.DOWN:
                {
                    trace("GET DOWN!!");
                    handled = true;
                }
            default:
        }
        
        return handled;
    }
    
}