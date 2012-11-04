package com.mindScriptAct.mvcExpressSpeedTest {
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.utils.getTimer;
import flash.utils.setTimeout;

/**
 * ...
 * @author Deril (raima156@yahoo.com)
 */
public class CommandMvcExpressSpeedTest extends MvcExpressSpeedTest {
	private var context2:CommandAppModule;
	
	
	override public function start():void {
		this.initTime = getTimer();
		
		context2 = new CommandAppModule();
		context2.start(this);
	}

}

}