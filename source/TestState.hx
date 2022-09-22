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
		var shaderBuffer1:ShaderFilter = new ShaderFilter(new HexMarchShaderBuffer1());
		var shaderBuffer2:ShaderFilter = new ShaderFilter(new HexMarchShaderBuffer2(bg));
		var shaderBuffer3:ShaderFilter = new ShaderFilter(new HexMarchShaderBuffer3());
		var filters:Array<BitmapFilter> = [shaderBuffer1, shaderBuffer2, shaderBuffer3];
		cam.setFilters(filters);
		cam.filtersEnabled = true;
		super.create();
	}
	
	override public function update(elapsed:Float) {
		shaderBuffer1.data.iTime.value[0] += elapsed;
		shaderBuffer2.data.iTime.value[0] += elapsed;
		shaderBuffer3.data.iTime.value[0] += elapsed;
		super.update(elapsed);
	}
}
