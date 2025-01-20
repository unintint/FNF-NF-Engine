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
	var subcameras:FlxCamera;
	
	var saveMouseY:Int = 0;
	var moveData:Int = 0;
	var avgSpeed:Float = 0;

	var pressas:Int = 0;

	public function new(stack:String)
	{
		super();
		error = stack + "\n\nError message saved";
		FlxG.mouse.visible = true;
	}

	override function create()
	{
		super.create();
		subcameras = new FlxCamera();
		
		bg = new FlxSprite().loadGraphic(Paths.image('egg'));
		bg.width = FlxG.width;
		bg.height = FlxG.height;
		bg.alpha = 0;
		add(bg);

		errorText = new FlxText(0, 0, FlxG.width, error, 50);
		errorText.font = Paths.font('Lang-ZH.ttf');

		add(errorText);

		title = new FlxText(0, 0, FlxG.width, "", 50);

		add(title);
		//addVirtualPad(NONE, A_B);

		errorText.cameras = [subcameras];
		bg.cameras = [subcameras];
		//title.cameras = [subcameras];

		FlxG.cameras.add(subcameras, false);
		subcameras.bgColor.alpha = 0;
	}
	
	override function update(elapsed:Float)
	{
		bg.alpha += elapsed * 1.5;
		if(bg.alpha > 0.6) bg.alpha = 0.6;
        if(FlxG.mouse.justPressed){
			pressas++;
		}

		if(pressas >= 4) {
			FlxG.switchState(new MainMenuState());
			close();
			//FlxG.switchState(new MainMenuState());
		}else if(controls.ACCEPT) {
		};

		if(FlxG.mouse.pressed){
			if (errorText.height > FlxG.height * 0.8)
			{
				if (FlxG.mouse.justPressed) saveMouseY = FlxG.mouse.y;
				moveData = FlxG.mouse.y - saveMouseY;
				saveMouseY = FlxG.mouse.y;
				avgSpeed = avgSpeed * 0.75 + moveData * 0.25;

				errorText.y += avgSpeed;
				errorText.y = Math.max(-10, Math.min(10 - errorText.height, errorText.y));
			}
			errorText.y = errorText.height - 10;
			//限制错误信息可以滑动的范围
		}
		FlxG.state.persistentUpdate = false;
		super.update(elapsed);
	}
	override function destroy(){
		bg = FlxDestroyUtil.destroy(bg);
		errorText = FlxDestroyUtil.destroy(errorText);
		#if mobile
			FlxG.mouse.visible = false;
		#end
		super.destroy();
	}
}
