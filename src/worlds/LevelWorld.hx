package worlds;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.World;
import com.haxepunk.HXP;
import nme.geom.Rectangle;
//import com.haxepunk.tmx.TmxMap;

/**
 * ...
 * @author Yogr
 * @date 3/7/2014
 */
class LevelWorld extends World
{
	public function new() 
	{
		super();
	}
	
	override public function begin()
	{
		/* TODO : Create a way of tracking the level the user is on and loading in correct tile map for that level */
		
		/* TODO : Import and use tile map using TMX instead of this stupid temp platform image! */
		var platform:Image = Image.createRect(600, 100, 0xFFEEBB);
		platform.x = 0;
		platform.y = 380;
		addGraphic(platform);
		
		
		/* TODO : Create a custom hero class and load it here instead of just an image of the troll. */
		var hero:Image = new Image("gfx/troll.png");
		hero.x = 75;
		hero.y = 292;
		addGraphic(hero);
	}
	
	override public function update()
	{
		super.update();
	}
	
}