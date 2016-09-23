package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.group.FlxSpriteGroup;
import sprites.Nave;
import sprites.Enemy;
import sprites.Ovni;
import sprites.Shield;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	private var nave:Nave;
	private var enemies:FlxTypedSpriteGroup<Enemy>;
	private var shields:FlxTypedSpriteGroup<Shield>;
	var dir:String = "DERECHA";
	var movCount:UInt = 0;
	var movFlag:UInt = 0;
	var countLim:UInt = 30;
	var ovniCount:UInt = 1;
	private var ovni:Ovni;
	var score:Int = 0;
	var scoreText:FlxText;
	var livesText:FlxText;
	var rowEnemies:Int = 9;
	var rows:Int = 5;
	var aliveEnemies:Int;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = false;
		Reg.cantVidas = 3;
		
		nave = new sprites.Nave();
		add(nave);
		
		var posx:Int = 0;
		var posy:Int = 0;
		
		aliveEnemies = Reg.cantEnemys;
		
		enemies = new FlxTypedSpriteGroup<Enemy>(8, 10);

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
		
		livesText = new FlxText(0, 0, 0, "LIVES="+ Reg.cantVidas);
		livesText.size = 8;
		livesText.color =  0xFFB3CDE0;
		add(livesText);
		
		
		scoreText = new FlxText(0, 0, 0, "SCORE=" + score);
		scoreText.size = 8;
		scoreText.color =  0xFFB3CDE0;
		scoreText.setPosition(FlxG.width - scoreText.width);
		add(scoreText);
		
		
		Reg.dispFlag = 0;
		Reg.dispEnemy = 0;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		for(i in 0...enemies.length)
		{ 
			if (FlxG.overlap(enemies.members[i], nave.getShot()))
			{
				enemies.members[i].kill();
				if (i < rowEnemies)
				{
					score+= Reg.puntosEnemigos0;
				}
				else if (i < rowEnemies * 3)
				{
					score+= Reg.puntosEnemigos1;
				}
				else
				{
					score+= Reg.puntosEnemigos2;
				}
				scoreText.text = "SCORE=" + score;
				scoreText.setPosition(FlxG.width - scoreText.width);
				nave.getShot().destroy();
				aliveEnemies--;
				Reg.dispFlag = 0;
				if (aliveEnemies == 0)
				{
					FlxG.switchState(new EndState());
				}
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
				Reg.dispEnemy = 0;
				if (Reg.cantVidas > 1)
				{
					nave.removeLive();
					livesText.text = "LIVES=" + Reg.cantVidas;
				}
				else
				{
					checkHighscore();
					FlxG.switchState(new EndState());
				}
			}
				
			if (FlxG.overlap(enemies.members[i], nave))
			{
				if (Reg.cantVidas > 1)
				{
					nave.removeLive();
					livesText.text = "LIVES=" + Reg.cantVidas;
				}
				else
				{
					FlxG.switchState(new EndState());
				}
			}
			
			for (j in 0...shields.length)
			{
				if (FlxG.overlap(enemies.members[i].getShot(), shields.members[j]))
				{
					enemies.members[i].getShot().destroy();
					shields.members[j].removeLive();
					updateShield(j);
					Reg.dispEnemy = 0;
				}
				
				
				/*if (FlxG.overlap(enemies.members[i], shields.members[j]))
				{
					enemies.members[i].kill();
					shields.members[j].destroy();
				}*/
			}
		}
		
		for (j in 0...shields.length)
		{
			if (FlxG.overlap(nave.getShot(), shields.members[j]))
			{
				shields.members[j].removeLive();
				updateShield(j);
				nave.getShot().destroy();
				Reg.dispFlag = 0;
			}
		}
		
		if (FlxG.overlap(nave.getShot() , ovni))
		{
			ovni.destroy();
			nave.getShot().destroy();
			score+= Reg.puntosOvni;
			scoreText.text = "SCORE=" + score;
			scoreText.setPosition(FlxG.width - scoreText.width);
			Reg.dispFlag = 0;
		}
		
		
		if (Reg.dispEnemy == 0)
		{
			enemies.getRandom().shot();
		}
		
		movement();
		
		if (ovniCount == 0)
		{
			ovni = new Ovni();
			add(ovni);
		}
		
		ovniCount++;
		ovniCount %= 1200;
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
	
	public function updateShield(num:Int):Void
	{
		var aux=num %4;
		if ( shields.members[num].getLives() == 2)
		{
			if (aux == 0)
				shields.members[num].loadGraphic("assets/images/Shield1b.png");
			if (aux == 1)
				shields.members[num].loadGraphic("assets/images/Shield2b.png");
			if (aux == 2)
				shields.members[num].loadGraphic("assets/images/Shield3c.png");
			if (aux == 3)
				shields.members[num].loadGraphic("assets/images/Shield4b.png");
		}
		if ( shields.members[num].getLives() == 1)
		{
			if (aux == 0)
				shields.members[num].loadGraphic("assets/images/Shield1c.png");
			if (aux == 1)
				shields.members[num].loadGraphic("assets/images/Shield2c.png");
			if (aux == 2)
				shields.members[num].loadGraphic("assets/images/Shield3b.png");
			if (aux == 3)
				shields.members[num].loadGraphic("assets/images/Shield4c.png");
		}
		if ( shields.members[num].getLives() == 0)
			shields.members[num].destroy();
	}
	
	public function checkHighscore():Void
	{
		if (score > Reg.topHighscore1)
		{
			Reg.topHighscore3 = Reg.topHighscore2;
			Reg.topHighscore2 = Reg.topHighscore1;
			Reg.topHighscore1 = score;
		}
		else if (score > Reg.topHighscore2)
		{
			Reg.topHighscore3 = Reg.topHighscore2;
			Reg.topHighscore2 = score;
		}
		else if (score > Reg.topHighscore3)
		{
			Reg.topHighscore3 = score;
		}
		
	}
}
