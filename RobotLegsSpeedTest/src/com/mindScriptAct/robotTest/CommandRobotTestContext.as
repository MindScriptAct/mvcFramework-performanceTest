package com.mindScriptAct.robotTest {
import com.gskinner.performance.MethodTest;
import com.gskinner.performance.PerformanceTest;
import com.gskinner.performance.TestSuite;
import com.mindScriptAct.robotTest.constants.TestNames;
import com.mindScriptAct.robotTest.controller.injectTesting.RobotInject0Command;
import com.mindScriptAct.robotTest.controller.injectTesting.RobotInject1Command;
import com.mindScriptAct.robotTest.controller.injectTesting.RobotInject2Command;
import com.mindScriptAct.robotTest.controller.injectTesting.RobotInject3Command;
import com.mindScriptAct.robotTest.controller.injectTesting.RobotInject4Command;
import com.mindScriptAct.robotTest.controller.injectTesting.RobotInject5Command;
import com.mindScriptAct.robotTest.controller.injectTesting.RobotInject6Command;
import com.mindScriptAct.robotTest.controller.injectTesting.RobotInject8Command;
import com.mindScriptAct.robotTest.controller.testing.RobotEmptyCommand;
import com.mindScriptAct.robotTest.controller.testing.RobotGetParamsCommand;
import com.mindScriptAct.robotTest.controller.testing.RobotWithModelCommand;
import com.mindScriptAct.robotTest.controller.testing.RobotWithModelCommViewsCommand;
import com.mindScriptAct.robotTest.controller.testing.TestEvent;
import com.mindScriptAct.robotTest.model.mock.MockModel;
import com.mindScriptAct.robotTest.view.application.MediatorTestEvent;
import com.mindScriptAct.robotTest.view.application.OutputEvent;
import com.mindScriptAct.robotTest.view.application.RobotTestMediator;
import com.mindScriptAct.robotTest.view.testSprite.RobotTestSpriteMediator;
import com.mindScriptAct.robotTest.view.testSprite.TestSprite;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.system.Capabilities;
import flash.utils.getTimer;
import org.robotlegs.mvcs.Context;

/**
 * ...
 * @author Deril (raima156@yahoo.com)
 */
public class CommandRobotTestContext extends Context {
	private var performanceTest:PerformanceTest;
	
	public function CommandRobotTestContext(contextView:DisplayObjectContainer){
		super(contextView);
	}
	
	override public function startup():void {
		//trace("CoreTestContext.startup");
		
		var coreInitTime:int = getTimer() - (contextView as RobotTest).initTime;
		
		// controller
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_INJECT_0, RobotInject0Command);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_INJECT_1, RobotInject1Command);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_INJECT_2, RobotInject2Command);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_INJECT_3, RobotInject3Command);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_INJECT_4, RobotInject4Command);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_INJECT_5, RobotInject5Command);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_INJECT_6, RobotInject6Command);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_INJECT_8, RobotInject8Command);
		
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_EMPTY, RobotEmptyCommand);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_GET_PARAMS, RobotGetParamsCommand);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_WITH_MODEL, RobotWithModelCommand);
		commandMap.mapEvent(TestEvent.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS, RobotWithModelCommViewsCommand);
		
		// model
		injector.mapSingleton(MockModel);
		
		// view
		mediatorMap.mapView(CommandRobotTest, RobotTestMediator, RobotTest);
		mediatorMap.mapView(TestSprite, RobotTestSpriteMediator);
		
		// start
		super.startup();
		
		dispatchEvent(new OutputEvent(OutputEvent.APPEND_LINE, "RobotLegs testing:       [" + (Capabilities.isDebugger ? "DEBUG" : "RELEASE") + " PLAYER. " + Capabilities.version + "]"));
		dispatchEvent(new OutputEvent(OutputEvent.APPEND_LINE, TestNames.CORE_INIT + ":" + "\t" + coreInitTime));
		
		// init testing
		prepareTests();
	} 
	
	private function prepareTests():void {
		
		performanceTest = new PerformanceTest();
		
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_INJECT_0)], TestNames.COMMAND_INJECT_0, 100, 1000);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_INJECT_1)], TestNames.COMMAND_INJECT_1, 100, 1000);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_INJECT_2)], TestNames.COMMAND_INJECT_2, 100, 1000);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_INJECT_4)], TestNames.COMMAND_INJECT_4, 100, 1000);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_INJECT_8)], TestNames.COMMAND_INJECT_8, 100, 1000);		
		
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_EMPTY)], TestNames.COMMAND_EMPTY, 50, 3000);
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_GET_PARAMS, "testData")], TestNames.COMMAND_PARAMS, 50, 3000);
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_WITH_MODEL)], TestNames.COMMAND_MODEL, 50, 3000);
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS)], TestNames.COMMAND_MODEL_AND_VIEW, 50, 3000);
		//
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1)], TestNames.MEDIATOR_CREATE_1000, 2, 500);
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.REMOVE_TEST_VIEW, 1)], TestNames.MEDIATOR_REMOVE_1000, 2, 500);
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1)], TestNames.MEDIATOR_CREATE_2000, 4, 500);
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.REMOVE_TEST_VIEW, 1)], TestNames.MEDIATOR_REMOVE_2000, 4, 500);
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1)], TestNames.MEDIATOR_CREATE_5000, 10, 500);
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.REMOVE_TEST_VIEW, 1)], TestNames.MEDIATOR_REMOVE_5000, 10, 500);
		//
		//performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.ACTIVATE_MEDIATOR)], TestNames.MEDIATOR_COMMUNICATE_1, 100, 10000);
		//
		//performanceTest.queueTestSuite(new TestSuite([new MethodTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.COMMUNICATION_TEST, 1)], TestNames.MEDIATOR_COMMUNICATE_100, 50, 1000)], "Communication test 100", null, spawn100Mediators));
		//performanceTest.queueTestSuite(new TestSuite([new MethodTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.COMMUNICATION_TEST, 1)], TestNames.MEDIATOR_COMMUNICATE_200, 50, 1000)], "Communication test 200", null, spawn100Mediators));
		//performanceTest.queueTestSuite(new TestSuite([new MethodTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.COMMUNICATION_TEST, 1)], TestNames.MEDIATOR_COMMUNICATE_500, 40, 1000)], "Communication test 500", null, spawn300Mediators));
		//performanceTest.queueTestSuite(new TestSuite([new MethodTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.COMMUNICATION_TEST, 1)], TestNames.MEDIATOR_COMMUNICATE_1000, 30, 1000)], "Communication test 1000", null, spawn500Mediators));
		
		performanceTest.addEventListener(Event.COMPLETE, handleTestComplete);
		performanceTest.addEventListener(Event.CLOSE, handleTestClose);
	}
	
	private function spawn100Mediators():void {
		for (var i:int = 0; i < 100; i++){
			eventDispatcher.dispatchEvent(new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1));
		}
	}
	
	private function spawn300Mediators():void {
		for (var i:int = 0; i < 300; i++){
			eventDispatcher.dispatchEvent(new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1));
		}
	}
	
	private function spawn500Mediators():void {
		for (var i:int = 0; i < 500; i++){
			eventDispatcher.dispatchEvent(new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1));
		}
	}
	
	private function handleTestClose(event:Event):void {
		//trace( "RobotTestContext.handleTestClose > event : " + event );
		for (var i:int = 0; i < 1000; i++){
			eventDispatcher.dispatchEvent(new MediatorTestEvent(MediatorTestEvent.REMOVE_TEST_VIEW, 1));
		}
		dispatchEvent(new OutputEvent(OutputEvent.APPEND_LINE, "ALL TESTS DONE! (in " + ((getTimer() - (contextView as RobotTest).initTime) / 1000).toFixed(2) + "s)"));
	}
	
	private function handleTestComplete(event:Event):void {
		//trace("RobotTestContext.handleTestComplete > event : " + event);
		if (performanceTest.currentTest){
			dispatchEvent(new OutputEvent(OutputEvent.APPEND_LINE, performanceTest.currentTest.name + ":" + "\t" + (performanceTest.currentTest.time / performanceTest.currentTest.loops) + "\t" + performanceTest.currentTest.toString()));
		}
	}
}

}