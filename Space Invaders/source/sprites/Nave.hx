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
	var flag:UInt = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic("assets/images/Nave2.png");
		disp = new Disparo();
		disp.kill();
		x = FlxG.width / 2 - width / 2;
		y = FlxG.height - height;
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
			disp = new Disparo(x+width/2,y,null,"ARRIBA");
			FlxG.state.add(disp);
			Reg.dispFlag = 1;
		}
		
	}

	public function getShot():Disparo	
	{
		return disp;
	}
	
	public function removeLive()
	{
		Reg.cantVidas--;
	}
}