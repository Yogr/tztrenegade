package ;

import com.haxepunk.Engine;
import com.haxepunk.HXP;
import haxe.Log;
import manager.InputManager;

import worlds.StartScreen;

/**
 * ...
 * @author Yogr
 * @date 3/7/2014
 */
class Main extends Engine
{
	public static inline var kScreenWidth:Int  = 600;
	public static inline var kScreenHeight:Int = 480;
	public static inline var kFrameRate:Int    = 30;
	public static inline var kClearColor:Int   = 0x333333;

	public function new()
	{
		super(kScreenWidth, kScreenHeight, kFrameRate, false);
	}

	override public function init()
	{
#if debug
	#if flash
		if (flash.system.Capabilities.isDebugger)
	#end
		{
			HXP.console.enable();
		}
#end
        var test:InputManager = InputManager.GetInstance();
		HXP.screen.color = kClearColor;
		HXP.screen.scale = 1;
		HXP.scene = new StartScreen();
	}

	public static function main()
	{
		new Main();
	}

}