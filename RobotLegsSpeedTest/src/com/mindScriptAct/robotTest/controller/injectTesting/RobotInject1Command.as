package com.mindScriptAct.robotTest.controller.injectTesting {
	import flash.display.DisplayObjectContainer;

/**
 * COMMENT
 * @author rbanevicius
 */
public class RobotInject1Command {
	
	[Inject]
	public var contextView:DisplayObjectContainer;
	
	public function execute():void {
		//trace( "RobotEmptyCommand.execute" );
	}

}
}