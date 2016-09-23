package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
	var buttonPlay:FlxText;
	var buttonScore:FlxText;
	var textSI:FlxText;
	var option:String = "PLAY";
	
	override public function create():Void
	{
		super.create();
		
		/*buttonPlay = new FlxButton(0, 0, "PLAY");
		buttonPlay.setPosition(FlxG.width / 2 - buttonPlay.width / 2, FlxG.height / 3);
		add(buttonPlay);
		
		
		buttonScore = new FlxButton(0, 0, "HIGHSCORES");
		buttonScore.setPosition(FlxG.width / 2 - buttonScore.width / 2, FlxG.height*2 / 3);
		add(buttonScore);*/	
		
		textSI= new FlxText(0,0, 0, "SPACE INVADERS");
		textSI.setPosition(FlxG.width / 2 - textSI.width+4, 4);
		textSI.size = 16;
		textSI.color = 0xFFB3CDE0;
		add(textSI);
		
		buttonPlay = new FlxText(0,0, 0, "PLAY");
		buttonPlay.setPosition(FlxG.width / 2 - buttonPlay.width/2,FlxG.height / 3);
		buttonPlay.size = 8;
		buttonPlay.color = 0xFF03396c;
		add(buttonPlay);
		
		buttonScore= new FlxText(0,0, 0, "SCORE");
		buttonScore.setPosition(FlxG.width / 2 - buttonScore.width/2, FlxG.height*2 / 3);
		buttonScore.size = 8;
		buttonScore.color = 0xFFB3CDE0;
		add(buttonScore);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.SPACE)
		{
			if (option == "PLAY")
			{
				FlxG.switchState(new PlayState());
			}
			if (option == "SCORE")
			{
				FlxG.switchState(new ScoreState());
			}
		}
		if (FlxG.keys.justPressed.DOWN)
		{
			option = "SCORE";
			buttonPlay.color = 0xFFB3CDE0;
			buttonScore.color = 0xFF03396c;
		}
		if (FlxG.keys.justPressed.UP)
		{
			option = "PLAY";
			buttonPlay.color = 0xFF03396c;
			buttonScore.color = 0xFFB3CDE0;
		}
		/*if (buttonPlay.pressed)
		{
			FlxG.switchState(new PlayState());
		}
		if (buttonScore.pressed)
		{
			FlxG.switchState(new ScoreState());
		}*/
	}
}
