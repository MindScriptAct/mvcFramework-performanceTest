package com.mindScriptAct.robotTest {
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
public class CommandRobotTest extends RobotTest {
	private var context2:CommandRobotTestContext;
	
	override public function start():void {
		this.initTime = getTimer();
		
		context2 = new CommandRobotTestContext(this as RobotTest);
	}

}

}