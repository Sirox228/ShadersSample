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
        var shaderBuffer1:HexMarchShaderBuffer1;
        var shaderBuffer2:HexMarchShaderBuffer2;
        var shaderBuffer3:HexMarchShaderBuffer3;
	override public function create() {
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var cam:FlxCamera = new FlxCamera();
		FlxG.cameras.add(cam);
		cam.bgColor.alpha = 0;
		bg.cameras = [cam];
		shaderBuffer1 = new HexMarchShaderBuffer1();
		shaderBuffer2 = new HexMarchShaderBuffer2();
                shaderBuffer2.setChannel(bg.pixels); // BitmapData of the sprite
		shaderBuffer3 = new HexMarchShaderBuffer3();
		var filters:Array<BitmapFilter> = [new ShaderFilter(shaderBuffer1), new ShaderFilter(shaderBuffer2), new ShaderFilter(shaderBuffer3)];
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
