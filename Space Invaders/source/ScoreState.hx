package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;

/**
 * ...
 * @author 
 */
class ScoreState extends FlxState
{
	var buttonBack:FlxButton;

	override public function create():Void
	{
		
		var highscore:FlxText = new FlxText(0,0, 0, "HIGHSCORES");
		highscore.setPosition(FlxG.width / 2 - highscore.width/2, 8);
		highscore.size = 8;
		highscore.color = 0xFFB3CDE0;
		add(highscore);
		
		
		var score1:FlxText = new FlxText(0,0, 0, "1_"+Reg.topHighscore1);
		score1.setPosition(FlxG.width / 2 - score1.width/2,32);
		score1.size = 8;
		score1.color = 0xFFB3CDE0;
		add(score1);
		
		var score2:FlxText = new FlxText(0,0, 0, "2_"+Reg.topHighscore2);
		score2.setPosition(FlxG.width / 2 - score2.width/2,48);
		score2.size = 8;
		score2.color = 0xFFB3CDE0;
		add(score2);
		
		
		var score3:FlxText = new FlxText(0,0, 0, "3_"+Reg.topHighscore3);
		score3.setPosition(FlxG.width / 2 - score3.width/2,64);
		score3.size = 8;
		score3.color = 0xFFB3CDE0;
		add(score3);
		
		
		var buttonBack:FlxText = new FlxText(0,0, 0, "BACK");
		buttonBack.setPosition(FlxG.width / 2 - buttonBack.width/2,88);
		buttonBack.size = 8;
		buttonBack.color = 0xFF03396c;
		add(buttonBack);
		
		/*buttonBack = new FlxButton(0, 0, "BACK");
		buttonBack.setPosition(FlxG.width / 2 - buttonBack.width / 2, 88);
		add(buttonBack);*/
		
	}
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new MenuState());
		}
	}
}