package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		FlxG.switchState(new PlayState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}