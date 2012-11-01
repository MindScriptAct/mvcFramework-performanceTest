package com.mindScriptAct.robotTest.controller.testing {
import flash.events.Event;

/**
 * ...
 * @author Deril (raima156@yahoo.com)
 */
public class TestEvent extends Event {
	
	static public const CALL_COMMANDS_INJECT_0:String = "callCommandsInject0";
	static public const CALL_COMMANDS_INJECT_1:String = "callCommandsInject1";
	static public const CALL_COMMANDS_INJECT_2:String = "callCommandsInject2";
	static public const CALL_COMMANDS_INJECT_3:String = "callCommandsInject3";
	static public const CALL_COMMANDS_INJECT_4:String = "callCommandsInject4";
	static public const CALL_COMMANDS_INJECT_5:String = "callCommandsInject5";
	static public const CALL_COMMANDS_INJECT_6:String = "callCommandsInject6";
	static public const CALL_COMMANDS_INJECT_7:String = "callCommandsInject7";
	static public const CALL_COMMANDS_INJECT_8:String = "callCommandsInject8";
	static public const CALL_COMMANDS_INJECT_9:String = "callCommandsInject9";
	static public const CALL_COMMANDS_INJECT_10:String = "callCommandsInject10";
	
	static public const CALL_COMMANDS_EMPTY:String = "callCommandsEmpty";
	static public const CALL_COMMANDS_WITH_MODEL:String = "callCommandsWithModel";
	static public const CALL_COMMANDS_GET_PARAMS:String = "callCommandsGetParams";
	static public const CALL_COMMANDS_WITH_MODEL_COMM_VIEWS:String = "callCommandsWithModelCommViews";
	static public const ACTIVATE_MEDIATOR:String = "activateMediator";
	
	
	public var data:String;
	
	public function TestEvent(type:String, data:String = ""){
		super(type);
		this.data = data;
	}
	
	public override function clone():Event {
		return new TestEvent(type, data);
	}

}
}