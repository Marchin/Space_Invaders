package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxGraphicAsset;
import sprites.Disparo;

/**
 * ...
 * @author ...
 */
class Nave extends FlxSprite
{
	public var disp:Disparo;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic("assets/images/Nave2.png");
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.LEFT && !(x<0))
			x -= 2;
		if (FlxG.keys.pressed.RIGHT && !( x> FlxG.width - width))
			x += 2;
		if (FlxG.keys.justPressed.SPACE && Reg.dispFlag==0)
		{
			disp = new Disparo(x+width/2,y);
			FlxG.state.add(disp);
			Reg.dispFlag = 1;
		}
	}
}