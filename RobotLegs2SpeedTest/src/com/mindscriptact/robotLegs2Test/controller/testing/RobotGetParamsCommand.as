package com.mindscriptact.robotLegs2Test.controller.testing {
import com.mindscriptact.robotLegs2Test.events.TestEvent;

/**
 * ...
 * @author Deril (raima156@yahoo.com)
 */
public class RobotGetParamsCommand {
	
	[Inject]
	public var event:TestEvent;
	
	public function execute():void {
		//trace( "RobotGetParamsCommand.execute" );
		var data:String = event.data;
	}

}

}