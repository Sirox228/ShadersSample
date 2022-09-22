package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.util.FlxColor;
import flixel.FlxG;
import openfl.filters.ShaderFilter;
import openfl.filters.BitmapFilter;
import HexMarchShader;

class TestState extends FlxState
{
        var shaderBuffer1:ShaderFilter;
        var shaderBuffer2:ShaderFilter;
        var shaderBuffer3:ShaderFilter;
	override public function create() {
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var cam:FlxCamera = new FlxCamera();
		FlxG.cameras.add(cam);
		cam.bgColor.alpha = 0;
		bg.cameras = [cam];
		shaderBuffer1 = new ShaderFilter(new HexMarchShaderBuffer1());
		shaderBuffer2 = new ShaderFilter(new HexMarchShaderBuffer2());
                shaderBuffer2.data.spriteChannel.input = bg.pixels; // BitmapData of the sprite
		shaderBuffer3 = new ShaderFilter(new HexMarchShaderBuffer3());
		var filters:Array<BitmapFilter> = [shaderBuffer1, shaderBuffer2, shaderBuffer3];
		cam.setFilters(filters);
		cam.filtersEnabled = true;
		super.create();
	}
	
	override public function update(elapsed:Float) {
		shaderBuffer1.update(elapsed);
		shaderBuffer2.update(elapsed);
		shaderBuffer3.update(elapsed);
		super.update(elapsed);
	}
}
