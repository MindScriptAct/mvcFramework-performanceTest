package com.mindScriptAct.robotTest.controller.injectTesting {
import com.mindScriptAct.robotTest.model.mock.MockModel;
import flash.display.DisplayObjectContainer;

/**
 * COMMENT
 * @author rbanevicius
 */
public class RobotInject1Command {
	
	[Inject]
	public var mockModel1:MockModel;
	
	public function execute():void {
		//trace( "RobotEmptyCommand.execute" );
	}

}
}