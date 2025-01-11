package substates;

import flixel.addons.transition.FlxTransitionableState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import mobile.backend.ManualError;

using StringTools;

class ErrorSubState extends MusicBeatSubstate
{
	var bg:FlxSprite;
	var error:String;
	var errorText:FlxText;
	public function new(e:Dynamic)
	{
		#if !mobile
		FlxG.mouse.visible = true;
		#end
		
		error = Std.string(e);
		saveErrorToFile(error);
		
		errorText = new FlxText(100, 100, 200, error);
		errorText.screenCenter(Y);
		
		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		
		bg.alpha = 0;
		bg.scrollFactor.set();
		
		add(bg);
		add(errorText);
		super();
	}
	
	override function update(elapsed:Float)
	{
		bg.alpha += elapsed * 1.5;
		if(bg.alpha > 0.6) bg.alpha = 0.6;

		if(controls.BACK) {
			close();
		}else if(controls.ACCEPT) {
			close();
		};
		addVirtualPad(NONE, A_B);
		addVirtualPadCamera(false);
		
		mouseMove();
		
		super.update(elapsed);
	}
	override function destroy(){
		bg = FlxDestroyUtil.destroy(bg);
		super.destroy();
	}
	
	var saveMouseY:Int = 0;
	var moveData:Int = 0;
	var avgSpeed:Float = 0;
	function mouseMove()
	{
		if (FlxG.mouse.justPressed) saveMouseY = FlxG.mouse.y;
		moveData = FlxG.mouse.y - saveMouseY;
		saveMouseY = FlxG.mouse.y;
		avgSpeed = avgSpeed * 0.75 + moveData * 0.25;
		
		text.y += avgSpeed;
                text.y = Math.max(50, Math.min(FlxG.height - text.height - 50, text.y));
	}
}
