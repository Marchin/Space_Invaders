package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import sprites.Nave;
import sprites.Enemy;

class PlayState extends FlxState
{
	private var nave:FlxSprite;
	private var _grpEnemies:FlxTypedGroup;

	override public function create():Void
	{
		super.create();
		
		nave = new sprites.Nave(80, 112);
		add(nave);
		
		_grpEnemies = new FlxTypedGroup<Enemy>(55);
		add(_grpEnemies);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
