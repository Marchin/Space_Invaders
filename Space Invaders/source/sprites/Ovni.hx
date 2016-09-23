package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Ovni extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic("assets/images/Ovni.png");
		
		x = FlxG.width + width;
		y = 4;
		
		velocity.x =-45;
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	
		
		if (x < -width)
		{
			destroy();
		}
		
	}
}