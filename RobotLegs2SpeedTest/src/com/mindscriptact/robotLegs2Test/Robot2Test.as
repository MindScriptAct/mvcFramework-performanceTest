package com.mindscriptact.robotLegs2Test {
import com.mindscriptact.robotLegs2Test.view.mainApp.Robot2TestApp;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.utils.setTimeout;

/**
 * ...
 * @author Deril (raima156@yahoo.com)
 */
public class Robot2Test extends Sprite {
	
	private var robot2TestApp:Robot2TestApp;
	
	public function Robot2Test() {
		if (stage) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
	
	private function init(event:Event = null):void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		//
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		//
		// vm warm up:
		setTimeout(start, 2000);
	}
	
	public function start():void {
		robot2TestApp = new Robot2TestApp();
		addChild(robot2TestApp);
	}
}
}

