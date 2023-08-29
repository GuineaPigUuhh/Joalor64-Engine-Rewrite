package meta.state;

import flixel.FlxG;
import flixel.FlxSprite;
import meta.state.*;
import meta.*;

class BruhState extends MusicBeatState
{
	override function create() 
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('kbhgames'));
		add(bg);
	}

	override function update(elapsed:Float) 
	{
		if (FlxG.keys.justPressed.ESCAPE) 
		{
			CoolUtil.browserLoad('https://github.com/Joalor64GH/Joalor64-Engine-Rewrite/releases/latest');
		}
		else if (FlxG.keys.justPressed.ENTER) 
		{
			MusicBeatState.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}