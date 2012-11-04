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
public class RobotInject8Command {
	
	[Inject]
	public var mockModel1:MockModel;
	[Inject]
	public var mockModel2:MockModel;
	[Inject]
	public var mockModel3:MockModel;
	[Inject]
	public var mockModel4:MockModel;
	[Inject]
	public var mockModel5:MockModel;
	[Inject]
	public var mockModel6:MockModel;
	[Inject]
	public var mockModel7:MockModel;
	[Inject]
	public var mockModel8:MockModel;
	
	public function execute():void {
		//trace( "RobotEmptyCommand.execute" );
	}

}
}