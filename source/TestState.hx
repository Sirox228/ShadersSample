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
	override public function create() {
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var cam:FlxCamera = new FlxCamera();
		FlxG.cameras.add(cam);
		cam.bgColor.alpha = 0;
		bg.cameras = [cam];
		var shaderBuffer1:HexMarchShaderBuffer1 = new HexMarchShaderBuffer1();
		var shaderBuffer2:HexMarchShaderBuffer2 = new HexMarchShaderBuffer2(bg);
		var shaderBuffer3:HexMarchShaderBuffer3 = new HexMarchShaderBuffer3();
		var filters<BitmapFilter> = [new ShaderFilter(shaderBuffer1), new ShaderFilter(shaderBuffer2), new ShaderFilter(shaderBuffer3)];
		cam.setFilters(filters);
		cam.filtersEnabled = true;
		super.create();
	}
	
	override public function update(elapsed:Float) {
		shaderBuffer1.iTime.value[0] += elapsed;
		shaderBuffer2.iTime.value[0] += elapsed;
		shaderBuffer3.iTime.value[0] += elapsed;
		super.update(elapsed);
	}
}
