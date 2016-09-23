package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import sprites.Enemy;

/**
 * ...
 * @author ...
 */
class Disparo extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, ?Dir:String="ABAJO") 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(1, 3, 0xFFB3CDE0);
		
		if (Dir == "ABAJO")
		{
			velocity.y =Reg.velDisparo;
		}
		else
		{
			velocity.y =-Reg.velDisparo*0.75;
		}
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (y < 0)
		{
			destroy();
			Reg.dispFlag = 0;
		}
		
		if (y > FlxG.height)
		{
			destroy();
			Reg.dispEnemy = 0;
		}
		
	}
	
}