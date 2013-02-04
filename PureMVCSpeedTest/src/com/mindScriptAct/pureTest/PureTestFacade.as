package com.mindScriptAct.pureTest {
import com.gskinner.performance.MethodTest;
import com.gskinner.performance.PerformanceTest;
import com.gskinner.performance.TestSuite;
import com.mindScriptAct.pureTest.constants.TestNames;
import com.mindScriptAct.pureTest.controller.testing.PureEmptyCommand;
import com.mindScriptAct.pureTest.controller.testing.PureGetParamsCommand;
import com.mindScriptAct.pureTest.controller.testing.PureWithModelCallViewCommand;
import com.mindScriptAct.pureTest.controller.testing.PureWithModelCommand;
import com.mindScriptAct.pureTest.model.mock.MockProxy;
import com.mindScriptAct.pureTest.notes.Note;
import com.mindScriptAct.pureTest.view.application.PureTestMediator;
import flash.events.Event;
import flash.system.Capabilities;
import flash.utils.getTimer;
import org.puremvc.as3.interfaces.IFacade;
import org.puremvc.as3.patterns.facade.Facade;

/**
 * ...
 * @author Deril (raima156@yahoo.com)
 */
public class PureTestFacade extends Facade implements IFacade {
	private static const STARTUP:String = "startup";
	
	private var performanceTest:PerformanceTest;
	private var mainObj:PureTest;
	
	static private const LOOP_COMMANDS:int = 10000;
	static private const LOOP_MEDIATING:int = 500;
	static private const LOOP_COMMUNICATE:int = 10000;
	static private const ITERATE_COMMANDS:int = 50;
	static private const ITERATE_MEDIATING_1:int = 2;
	static private const ITERATE_MEDIATING_2:int = 4;
	static private const ITERATE_MEDIATING_3:int = 10;
	static private const ITERATE_COMMUNICATE_0:int = 100;
	static private const ITERATE_COMMUNICATE_1:int = 50;
	static private const ITERATE_COMMUNICATE_2:int = 40;
	static private const ITERATE_COMMUNICATE_3:int = 30;
	
	public static function getInstance():PureTestFacade {
		if (instance == null)
			instance = new PureTestFacade();
		return instance as PureTestFacade;
	}
	
	public function startUp(mainObj:PureTest):void {
		this.mainObj = mainObj;
		
		var coreInitTime:int = getTimer() - mainObj.initTime;
		
		// controller
		registerCommand(Note.CALL_COMMANDS_EMPTY, PureEmptyCommand);
		registerCommand(Note.CALL_COMMANDS_GET_PARAMS, PureGetParamsCommand);
		registerCommand(Note.CALL_COMMANDS_WITH_MODEL, PureWithModelCommand);
		registerCommand(Note.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS, PureWithModelCallViewCommand);
		
		// model
		registerProxy(new MockProxy());
		
		// view
		registerMediator(new PureTestMediator(mainObj));
		
		// start
		sendNotification(STARTUP, mainObj);
		removeCommand(STARTUP);
		
		sendNotification(Note.OUTPUT_APPEND_LINE, "PureMVC testing:       [" + (Capabilities.isDebugger ? "DEBUG" : "RELEASE") + " PLAYER. " + Capabilities.version + "]");
		sendNotification(Note.OUTPUT_APPEND_LINE, TestNames.CORE_INIT + ":" + "\t" + coreInitTime);
		
		// init testing
		prepareTests();
	
	}
	
	private function prepareTests():void {
		
		performanceTest = new PerformanceTest();
		
		performanceTest.queueSimpleTest(sendNotification, [Note.CALL_COMMANDS_EMPTY], TestNames.COMMAND_EMPTY, ITERATE_COMMANDS, LOOP_COMMANDS);
		performanceTest.queueSimpleTest(sendNotification, [Note.CALL_COMMANDS_GET_PARAMS, "testData"], TestNames.COMMAND_PARAMS, ITERATE_COMMANDS, LOOP_COMMANDS);
		performanceTest.queueSimpleTest(sendNotification, [Note.CALL_COMMANDS_WITH_MODEL], TestNames.COMMAND_MODEL, ITERATE_COMMANDS, LOOP_COMMANDS);
		performanceTest.queueSimpleTest(sendNotification, [Note.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS], TestNames.COMMAND_MODEL_AND_VIEW, ITERATE_COMMANDS, LOOP_COMMANDS);
		//
		performanceTest.queueSimpleTest(sendNotification, [Note.CREATE_TEST_VIEW, 1], TestNames.MEDIATOR_CREATE_1000, ITERATE_MEDIATING_1, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendNotification, [Note.REMOVE_TEST_VIEW, 1], TestNames.MEDIATOR_REMOVE_1000, ITERATE_MEDIATING_1, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendNotification, [Note.CREATE_TEST_VIEW, 1], TestNames.MEDIATOR_CREATE_2000, ITERATE_MEDIATING_2, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendNotification, [Note.REMOVE_TEST_VIEW, 1], TestNames.MEDIATOR_REMOVE_2000, ITERATE_MEDIATING_2, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendNotification, [Note.CREATE_TEST_VIEW, 1], TestNames.MEDIATOR_CREATE_5000, ITERATE_MEDIATING_3, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendNotification, [Note.REMOVE_TEST_VIEW, 1], TestNames.MEDIATOR_REMOVE_5000, ITERATE_MEDIATING_3, LOOP_MEDIATING);
		
		performanceTest.queueSimpleTest(sendNotification, [Note.MEDIATOR_COMM_TEST], TestNames.MEDIATOR_COMMUNICATE_1, ITERATE_COMMUNICATE_0, LOOP_COMMANDS);
		
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendNotification, [Note.MEDIATOR_COMM_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_10, ITERATE_COMMUNICATE_1, LOOP_COMMUNICATE)], TestNames.MEDIATOR_COMMUNICATE_10, null, spawn10Mediators));
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendNotification, [Note.MEDIATOR_COMM_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_20, ITERATE_COMMUNICATE_1, LOOP_COMMUNICATE)], TestNames.MEDIATOR_COMMUNICATE_20, null, spawn10Mediators));
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendNotification, [Note.MEDIATOR_COMM_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_50, ITERATE_COMMUNICATE_2, LOOP_COMMUNICATE)], TestNames.MEDIATOR_COMMUNICATE_50, null, spawn30Mediators));
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendNotification, [Note.MEDIATOR_COMM_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_100, ITERATE_COMMUNICATE_3, LOOP_COMMUNICATE)], TestNames.MEDIATOR_COMMUNICATE_100, null, spawn50Mediators));
		
		performanceTest.addEventListener(Event.COMPLETE, handleTestComplete);
		performanceTest.addEventListener(Event.CLOSE, handleTestClose);
	}
	
	private function spawn10Mediators():void {
		for (var i:int = 0; i < 10; i++) {
			sendNotification(Note.CREATE_TEST_VIEW, 1);
		}
	}
	
	private function spawn30Mediators():void {
		for (var i:int = 0; i < 30; i++) {
			sendNotification(Note.CREATE_TEST_VIEW, 1);
		}
	}
	
	private function spawn50Mediators():void {
		for (var i:int = 0; i < 50; i++) {
			sendNotification(Note.CREATE_TEST_VIEW, 1);
		}
	}
	
	private function handleTestClose(event:Event):void {
		//trace( "RobotTestContext.handleTestClose > event : " + event );
		for (var i:int = 0; i < 1000; i++) {
			sendNotification(Note.REMOVE_TEST_VIEW, 1);
		}
		sendNotification(Note.OUTPUT_APPEND_LINE, "ALL TESTS DONE! (in " + ((getTimer() - mainObj.initTime) / 1000).toFixed(2) + "s)");
	}
	
	private function handleTestComplete(event:Event):void {
		//trace("RobotTestContext.handleTestComplete > event : " + event);
		if (performanceTest.currentTest) {
			sendNotification(Note.OUTPUT_APPEND_LINE, performanceTest.currentTest.name + ":" + "\t" + (performanceTest.currentTest.time / performanceTest.currentTest.loops) + "\t" + performanceTest.currentTest.toString());
		}
	}

}
}