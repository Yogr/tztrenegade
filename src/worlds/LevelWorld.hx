package worlds;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import com.haxepunk.World;
import com.haxepunk.HXP;
import entities.Player;
import nme.geom.Rectangle;
import manager.InputManager;
import com.haxepunk.tmx.TmxMap;

/**
 * ...
 * @author Yogr
 * @date 3/7/2014
 */
class LevelWorld extends Scene
{
    //-----------------------------------------------------------------------------------
    /// Constructor
	public function new() 
	{
		super();
	}
	
    //-----------------------------------------------------------------------------------
    /// initializer
	override public function begin()
	{
		/* TODO : Create a way of tracking the level the user is on and loading in correct tile map for that level */
		
		/* TODO : Import and use tile map using TMX instead of this stupid temp platform image! */
		var platform:Image = Image.createRect(600, 100, 0xFFEEBB);
		platform.x = 0;
		platform.y = 380;
		addGraphic(platform);
		
		var hero:Player = new Player("gfx/troll.png", 75, 292);
		add(hero);
	}
	
    //-----------------------------------------------------------------------------------
    /// Called every frame when it is the active scene
	override public function update()
	{
        InputManager.GetInstance().update();
		super.update();
	}
	
}