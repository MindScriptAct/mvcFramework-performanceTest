package com.mindscriptact.robotLegs2Test.model {
import com.mindscriptact.robotLegs2Test.events.TestEvent;
import flash.events.IEventDispatcher;

/**
 * ...
 * @author Deril (raima156@yahoo.com)
 */
public class MockModel {
	
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	
	
	public function MockModel() {
	}
	
	public function invokeMediator():void {
		eventDispatcher.dispatchEvent(new TestEvent(TestEvent.ACTIVATE_MEDIATOR));
	}

}
}