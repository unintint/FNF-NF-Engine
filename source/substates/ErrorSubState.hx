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
	
	var saveMouseY:Int = 0;
	var moveData:Int = 0;
	var avgSpeed:Float = 0;

	public function new(stack:String)
	{
		super();
		error = "Oh Shit!" + "\n" + stack;
		FlxG.mouse.visible = true;
	}

	override function create()
	{
		super.create();
		
		bg = new FlxSprite().loadGraphic(Paths.image('egg'));
		bg.width = FlxG.width;
		bg.height = FlxG.height;
		bg.alpha = 0;
		add(bg);

		errorText = new FlxText(0, 0, FlxG.width, error, 50);
		errorText.font = Paths.font('Lang-ZH.ttf');
		add(errorText);

		addVirtualPad(NONE, A_B);
	}
	
	override function update(elapsed:Float)
	{
		bg.alpha += elapsed * 1.5;
		if(bg.alpha > 0.6) bg.alpha = 0.6;

		if(controls.BACK) {
			close();
			FlxG.switchState(new MainMenuState());
		}else if(controls.ACCEPT) {
			close();
			FlxG.switchState(new MainMenuState());
			//这个位置要放解决代码崩溃的代码
		};
		
		mouseMove();
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
	
	function mouseMove(){
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

}
