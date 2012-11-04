package com.mindScriptAct.robotTest.controller.injectTesting {
import com.mindScriptAct.robotTest.model.mock.MockModel;
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
	public var mockModel1:MockModel;
	[Inject]
	public var mockModel2:MockModel;
	[Inject]
	public var mockModel3:MockModel;
	[Inject]
	public var mockModel4:MockModel;
	
	public function execute():void {
		//trace( "RobotEmptyCommand.execute" );
	}

}
}