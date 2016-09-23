package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;


/**
 * ...
 * @author 
 */
class SplashState extends FlxState
{
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		
		var textGrupo:FlxText = new FlxText(0,0, 0, "GRUPO CRUBICK");
		textGrupo.setPosition(FlxG.width / 2 - textGrupo.width/2-16, FlxG.height/3);
		textGrupo.size = 12;
		textGrupo.color = 0xFFB3CDE0;
		add(textGrupo);
		
		
		var textIntegrantes:FlxText = new FlxText(0,0, 0, "      INTEGRANTES: \nMONTERROSA, MARTIN");
		textIntegrantes.setPosition(FlxG.width / 2 - textIntegrantes.width/2, FlxG.height*2 /3);
		textIntegrantes.size = 8;
		textIntegrantes.color = 0xFFB3CDE0;
		add(textIntegrantes);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.mouse.pressed || FlxG.keys.justPressed.SPACE )
		{
			FlxG.switchState(new MenuState());
		}
	}
	
}