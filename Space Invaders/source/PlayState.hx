package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import sprites.Nave;
import sprites.Enemy;
import sprites.Shield;

class PlayState extends FlxState
{
	private var nave:Nave;
	private var enemies:FlxTypedSpriteGroup<Enemy>;
	private var shields:FlxTypedSpriteGroup<Shield>;
	var dir:String = "DERECHA";
	var movCount:UInt = 0;
	var movFlag:UInt = 0;
	var countLim:UInt = 30;
	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = false;
		
		nave = new sprites.Nave();
		add(nave);
		
		var posx:Int = 0;
		var posy:Int = 0;
		
		var rows = 5;
			
		var totalEnemies = 45;
		var rowEnemies=9;
		enemies = new FlxTypedSpriteGroup<Enemy>(8, 8);

		for (i in 0...rows)
		{
			for (j in 0...rowEnemies)
			{
				var enemy:Enemy;
				if (i == 0)
				{
					enemy = new Enemy(posx, posy, "assets/images/Enemy0.png");
					enemies.add(enemy);
				}
				if ((0 < i) && (i <= 2))
				{
					enemy = new Enemy(posx, posy, "assets/images/Enemy1.png");
					enemies.add(enemy);
				}
				if (i > 2)
				{
					enemy = new Enemy(posx, posy, "assets/images/Enemy2.png");
					enemies.add(enemy);
				}
				posx += 16;
			}
			posx = 0;
			posy += 10;
		}		
			
		add(enemies);
		
		shields = new FlxTypedSpriteGroup<Shield>(24, FlxG.height-nave.height-20);
		
		for (i in 0...4)
		{
			var shield:Shield;
			
			shield = new Shield( 32 * i, 0, "assets/images/Shield1.png");
			shields.add(shield);
			shield = new Shield( 8 + 32 * i, 0,"assets/images/Shield2.png");
			shields.add(shield);
			shield = new Shield( 32 * i,  8, "assets/images/Shield3.png");
			shields.add(shield);
			shield = new Shield( 8 + 32 * i, 8,"assets/images/Shield4.png");
			shields.add(shield);
			
			
		}
		add(shields);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		for(i in 0...enemies.length)
		{ 
			if (FlxG.overlap(enemies.members[i], nave.getShot()))
			{
				enemies.members[i].kill();
				nave.getShot().destroy();
				Reg.dispFlag = 0;
			}
			
			if (FlxG.overlap(enemies.members[i].getShot(), nave.getShot()))
			{
				enemies.members[i].getShot().destroy();
				nave.getShot().destroy();
				Reg.dispFlag = 0;
				Reg.dispEnemy = 0;
			}
			
			if (FlxG.overlap(enemies.members[i].getShot(), nave))
			{
				enemies.members[i].getShot().destroy();
				nave.destroy();
				Reg.dispEnemy = 0;
			}
				
			if (FlxG.overlap(enemies.members[i], nave))
			{
				nave.destroy();
			}
			
			for (j in 0...shields.length)
			{
				if (FlxG.overlap(enemies.members[i].getShot(), shields.members[j]))
				{
					enemies.members[i].getShot().destroy();
					shields.members[j].removeLive();
					Reg.dispEnemy = 0;
				}
			}
		}
		
		
		
		if (Reg.dispEnemy == 0)
		{
			enemies.getRandom().shot();
		}
		movement();
	}
	
	public function movement():Void
	{
		if (movCount == 0)
		{
			if (movFlag == 1)
			{
				if (dir == "IZQUIERDA")
				{
					enemies.x -= 2;
				}
				
				if (dir == "DERECHA")
				{
					enemies.x += 2;
				}
				movFlag = 0;
			}
			else
			{
				if (enemies.x < 2)
				{
					dir = "DERECHA";
					enemies.y += 2;
					movFlag = 1;
				}
				else if (enemies.x > FlxG.width-enemies.width-2)
				{
					dir = "IZQUIERDA";
					enemies.y += 2;
					movFlag = 1;
				}
				else if (dir == "IZQUIERDA")
				{
					enemies.x -= 2;
				}
				else if (dir == "DERECHA")
				{
					enemies.x += 2;
				}
			}
		}
		movCount++;
		movCount %= countLim;
	}
}
