package meta.state;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;

import meta.*;
import meta.state.*;
import meta.data.*;
import meta.data.alphabet.*;

using StringTools;

// simple test state
class TestState extends MusicBeatState
{
    override public function create()
    {
        super.create();

        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
        bg.scale.set(10, 10);
	bg.screenCenter();
        add(bg);
        
        var musplayer:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('radio/musplayer'));
        musplayer.screenCenter();
        musplayer.antialiasing = ClientPrefs.globalAntialiasing;
        add(musplayer);
        var disc:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('radio/disc'));
        disc.setPosition(musplayer.x + 268, musplayer.y + 13);
        disc.antialiasing = ClientPrefs.globalAntialiasing;
        disc.angularVelocity = 30;
        add(disc);
        var playerneedle:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('radio/playerneedle'));
        playerneedle.screenCenter();
        playerneedle.antialiasing = ClientPrefs.globalAntialiasing;
        add(playerneedle);

        var testTxt:Alphabet = new Alphabet(0, 0, 'This is a test.', true);
        testTxt.setPosition(50, musplayer.y - 120);
        add(testTxt);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (controls.BACK)
        {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            if (ClientPrefs.simpleMain)
		MusicBeatState.switchState(new SimpleMainMenuState());
	    else
		MusicBeatState.switchState(new MainMenuState());
        }
    }

    override function beatHit()
    {
        super.beatHit();            
    }
}