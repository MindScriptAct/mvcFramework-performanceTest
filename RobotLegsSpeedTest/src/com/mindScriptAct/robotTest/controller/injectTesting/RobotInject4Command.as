package com.mindScriptAct.robotTest.controller.injectTesting {
import flash.display.DisplayObjectContainer;
import flash.events.IEventDispatcher;
import org.robotlegs.core.ICommandMap;
import org.robotlegs.core.IInjector;

/**
 * COMMENT
 * @author rbanevicius
 */
public class RobotInject4Command {
	
	[Inject]
	public var contextView:DisplayObjectContainer;
	
	[Inject]
	public var commandMap:ICommandMap;
	
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	
	[Inject]
	public var injector:IInjector;
	
	public function execute():void {
		//trace( "RobotEmptyCommand.execute" );
	}

}
}