package com.mindScriptAct.robotTest.controller.injectTesting {
import flash.display.DisplayObjectContainer;
import org.robotlegs.core.ICommandMap;

/**
 * COMMENT
 * @author rbanevicius
 */
public class RobotInject2Command {
	
	[Inject]
	public var contextView:DisplayObjectContainer;
	
	[Inject]
	public var commandMap:ICommandMap;
	
	public function execute():void {
		//trace( "RobotEmptyCommand.execute" );
	}

}
}