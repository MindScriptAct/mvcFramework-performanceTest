package com.mindScriptAct.robotTest.controller.injectTesting {
import com.mindScriptAct.robotTest.model.mock.MockModel;
import flash.display.DisplayObjectContainer;
import flash.events.IEventDispatcher;
import org.robotlegs.core.ICommandMap;
import org.robotlegs.core.IInjector;
import org.robotlegs.core.IMediatorMap;

/**
 * COMMENT
 * @author rbanevicius
 */
public class RobotInject6Command {
	
	[Inject]
	public var contextView:DisplayObjectContainer;
	
	[Inject]
	public var commandMap:ICommandMap;
	
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	
	[Inject]
	public var injector:IInjector;
	
	[Inject]
	public var mediatorMap:IMediatorMap;
	
	[Inject]
	public var mockModel:MockModel;
	
	public function execute():void {
		//trace( "RobotEmptyCommand.execute" );
	}

}
}