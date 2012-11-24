package com.mindscriptact.robotLegs2Test.view.testSprite {
import com.mindscriptact.robotLegs2Test.events.MediatorTestEvent;
import robotlegs.bender.bundles.mvcs.Mediator;

/**
 * ...
 * @author Deril (raima156@yahoo.com)
 */
public class RobotTestSpriteMediator extends Mediator {
	
	[Inject]
	public var view:TestSprite;
	
	public function RobotTestSpriteMediator() {
		super();
	}
	
	override public function initialize():void {
		view.x = Math.random() * 700;
		view.y = Math.random() * 300 + 300;
		
		addContextListener(MediatorTestEvent.COMMUNICATION_TEST, handleOjectSearch);
	}
	
	private function handleOjectSearch(event:MediatorTestEvent):void {
		if (view.uniqueId == event.uniqueId) {
			//trace("object found: " + view.uniqueId + " " + view);
		}
	}

}
}