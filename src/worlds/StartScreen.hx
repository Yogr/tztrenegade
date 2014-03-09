package worlds;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.World;
import com.haxepunk.HXP;
import com.haxepunk.utils.Key;
import com.haxepunk.utils.Input;

/**
 * ...
 * @author Yogr
 * @date 3/7/2014
 */
class StartScreen extends World
{

	public function new () 
	{
		super();		
	}

	public override function begin()
	{
		
		Input.define("start", [Key.ANY]);

		addGraphic( Image.createRect(HXP.width, HXP.height, 0x000000) );
		
		var troll:Image = new Image("gfx/troll.png");
		troll.scale = 2;
		troll.x = (HXP.width - troll.width) / 2 - 45;
		troll.y = 145;
		addGraphic(troll);
		
		var title:Text = new Text("TZT: Renegade", 0, 100, 0, 0, {color:0xFF0000, size:50});
		title.x = (HXP.width - title.width) / 2;
		addGraphic(title);

		var enter:Text = new Text("PRESS START", 0, 320, 0, 0, {color:0xFFFFFF, size:40});
		enter.x = (HXP.width - enter.width) / 2;
		addGraphic(enter);
		
		var by:Text = new Text("A game by TZT Dev Crew",0, 370, 0, 0, {color:0xFFFFFF, size:24});
		by.x = (HXP.width - by.width) / 2;
		addGraphic(by);

		var site:Text = new Text("tallonzektimes.org/bb", 0, 400, 0, 0, {color:0xFFFFFF, size:20});
		site.x = (HXP.width - site.width) / 2;
		addGraphic(site);

		
		
	}

	public override function update()
	{
		if(Input.released("start")) 
			HXP.world = new LevelWorld();
		super.update();
	}

}