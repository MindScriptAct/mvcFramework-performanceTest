package com.mindScriptAct.pureTest {
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
public class CommandPureTest extends PureTest {
	
	override public function start():void {
		this.initTime = getTimer();
		
		new CommandPureTestFacade().startUp(this as PureTest);
	}
}
}