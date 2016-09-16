package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite
{
/*	private var LeftF:Int = 0;
	private var RightF:Int = 0;
	
	
*/
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(12, 8,0xFFFFFFFF);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	/*	
		var mov:Int = 2;
		
		x += mov;
		
		if ( x < 0 && LeftF == 0)
		{
			mov = -mov;
			y += 2	;
			LeftF = 1;
			RightF = 0;
		}
		
		
		if ( (x > FlxG.width - width) && RightF == 0)
		{
			mov = -mov;
			y += 2	;
			LeftF = 0;
			RightF = 1;
		}*/
	}
}