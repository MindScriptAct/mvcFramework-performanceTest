package com.mindScriptAct.robotTest.controller.injectTesting {
import flash.display.DisplayObjectContainer;
import flash.events.IEventDispatcher;
import org.robotlegs.core.ICommandMap;

/**
 * COMMENT
 * @author rbanevicius
 */
public class RobotInject3Command {
	
	[Inject]
	public var contextView:DisplayObjectContainer;
	
	[Inject]
	public var commandMap:ICommandMap;
	
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	
	public function execute():void {
		//trace( "RobotEmptyCommand.execute" );
	}

}
}