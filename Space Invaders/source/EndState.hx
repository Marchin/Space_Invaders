package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class EndState extends FlxState
{
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		var textGO:FlxText = new FlxText(0,0, 0, "GAME OVER");
		textGO.setPosition(FlxG.width / 2 - textGO.width/2, FlxG.height / 2 -textGO.height/2);
		textGO.size = 8;
		textGO.color = 0xFFB3CDE0;
		add(textGO);
	}
	
		
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.mouse.pressed || FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new MenuState());
		}
	}
}