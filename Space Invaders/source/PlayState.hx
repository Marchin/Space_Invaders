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
	public var enemies:FlxSprite;
	private var LeftF:Int = 0;
	private var RightF:Int = 0;

	override public function create():Void
	{
		super.create();
		
		nave = new sprites.Nave(80, 112);
		add(nave);
		
		var posx:Int = 8;
		var posy:Int = 8;
		
		var rows = 5;
			
		var totalEnemies = 55;
		var rowEnemies=11;
		var enemies = new FlxTypedGroup<Enemy>(totalEnemies);

		for (i in 0...rows)
		{
			for (i in 0...rowEnemies)
			{
				var enemy = new Enemy(posx,posy);
				enemies.add(enemy);
				posx += 16;
			}
			posx = 8;
			posy += 10;
		}		
			
		add(enemies);
		/*while (( posy < FlxG.height - 8 - nave.height) && rows<5)
		{
			while (posx < FlxG.width - 8 - nave.width)
			{
				enemies = new Enemy(posx, posy);
				add(enemies);
				posx += 18;
			}
			posx = 8;
			posy += 10;
			rows++;
		}*/
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		var mov:Int = 2;
		
		enemies.x += mov;
		
		if ( enemies.x < 0 && LeftF == 0)
		{
			mov = -mov;
			enemies.y += 2	;
			LeftF = 1;
			RightF = 0;
		}
		
		
		if ( (enemies.x > (FlxG.width - enemies.width)) && RightF == 0)
		{
			mov = -mov;
			enemies.y += 2	;
			LeftF = 0;
			RightF = 1;
		}
	}
}
