package com.mindScriptAct.robotTest.controller.injectTesting {
import com.mindScriptAct.robotTest.model.mock.MockModel;
import flash.display.DisplayObjectContainer;
import org.robotlegs.core.ICommandMap;

/**
 * COMMENT
 * @author rbanevicius
 */
public class RobotInject2Command {
	
	[Inject]
	public var mockModel1:MockModel;
	[Inject]
	public var mockModel2:MockModel;
	
	public function execute():void {
		//trace( "RobotEmptyCommand.execute" );
	}

}
}