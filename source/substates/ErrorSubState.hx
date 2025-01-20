package substates;

import flixel.addons.transition.FlxTransitionableState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import states.MainMenuState;

using StringTools;

class ErrorSubState extends MusicBeatSubstate
{
	var errorText:FlxText;
	var error:String = "Oh Shit!";
	var title:FlxText;
	var bg:FlxSprite;
	
	var saveMouseY:Int = 0;
	var moveData:Int = 0;
	var avgSpeed:Float = 0;

	var mousePress:Int = 3;
	var camError:FlxCamera;

	public function new(stack:String)
	{
		super();
		error = "Oh Shit!" + "\n" + stack + "\nError message saved";
		FlxG.mouse.visible = true;
	}

	override function create()
	{
		super.create();
		camError = new FlxCamera();
		FlxG.cameras.add(camError, false);
		
		bg = new FlxSprite().loadGraphic(Paths.image('egg'));
		bg.width = FlxG.width;
		bg.height = FlxG.height;
		bg.alpha = 0;
		bg.camera = camError;
		add(bg);

		errorText = new FlxText(0, 0, FlxG.width, error, 50);
		errorText.font = Paths.font('Lang-ZH.ttf');
		errorText.camera = camError;
		add(errorText);

		title = new FlxText(0, 0, FlxG.width, "", 50);
		title.camera = camError;
		title.font = Paths.font('Lang-ZH.ttf');
		add(title);
	}
	
	override function update(elapsed:Float)
	{
		bg.alpha += elapsed * 1.5;
		if(bg.alpha > 0.6) bg.alpha = 0.6;

		title.x = FlxG.width - errorText.height;

		title.text = "Click " + Std.string(mousePress) +" times to exit"
		if(FlxG.mouse.justPressed){
			mousePress = mousePress - 1;
		}
		if(mousePress == 0) {
			FlxG.switchState(new MainMenuState());
			close();
		}
		 if(errorText.height > FlxG.height * 0.8)
    		{
        		if (FlxG.mouse.justPressed) saveMouseY = FlxG.mouse.y;
        		moveData = FlxG.mouse.y - saveMouseY;
        		saveMouseY = FlxG.mouse.y;
        		avgSpeed = avgSpeed * 0.75 + moveData * 0.25;
        
        		errorText.y += avgSpeed;
        		errorText.y = Math.max(-10, Math.min(10 - errorText.height, errorText.y));
    		}
		
		FlxG.state.persistentUpdate = false;
		super.update(elapsed);
	}
	override function destroy(){
		bg = FlxDestroyUtil.destroy(bg);
		errorText = FlxDestroyUtil.destroy(errorText);
		FlxG.mouse.visible = false;
		super.destroy();
	}
}
