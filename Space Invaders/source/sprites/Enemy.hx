package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import sprites.Disparo;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite
{
/*	private var LeftF:Int = 0;
	private var RightF:Int = 0;
	
	
*/
	public var disp:Disparo;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		//makeGraphic(12, 8, 0xFFFFFFFF);
		disp = new Disparo();
		disp.kill();
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
	
	
	public function getShot():Disparo	
	{
		return disp;
	}
	
	public function shot():Void
	{	
		if (this.alive)
		{
			disp = new Disparo(x+width/2, y,null, "ABAJO");
			FlxG.state.add(disp);
			Reg.dispEnemy = 1;
		}
	}
}