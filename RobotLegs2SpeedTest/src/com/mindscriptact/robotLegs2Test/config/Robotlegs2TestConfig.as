package com.mindscriptact.robotLegs2Test.config {
import com.gskinner.performance.MethodTest;
import com.gskinner.performance.PerformanceTest;
import com.gskinner.performance.TestSuite;
import com.mindscriptact.robotLegs2Test.constants.TestNames;
import com.mindscriptact.robotLegs2Test.controller.testing.RobotEmptyCommand;
import com.mindscriptact.robotLegs2Test.controller.testing.RobotGetParamsCommand;
import com.mindscriptact.robotLegs2Test.controller.testing.RobotWithModelCommand;
import com.mindscriptact.robotLegs2Test.controller.testing.RobotWithModelCommViewsCommand;
import com.mindscriptact.robotLegs2Test.events.MediatorTestEvent;
import com.mindscriptact.robotLegs2Test.events.OutputEvent;
import com.mindscriptact.robotLegs2Test.events.TestEvent;
import com.mindscriptact.robotLegs2Test.model.MockModel;
import com.mindscriptact.robotLegs2Test.view.mainApp.Robot2AppMediator;
import com.mindscriptact.robotLegs2Test.view.mainApp.Robot2TestApp;
import com.mindscriptact.robotLegs2Test.view.testSprite.RobotTestSpriteMediator;
import com.mindscriptact.robotLegs2Test.view.testSprite.TestSprite;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.system.Capabilities;
import flash.utils.getTimer;
import org.swiftsuspenders.Injector;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.LogLevel;

public class Robotlegs2TestConfig implements IConfig {
	private var coreInitTime:int;
	private var performanceTest:PerformanceTest;
	private var mainView:Robot2TestApp;
	
	[Inject]
	public var context:IContext;
	
	[Inject]
	public var eventCommandMap:IEventCommandMap;
	
	[Inject]
	public var mediatorMap:IMediatorMap;
	
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	
	[Inject]
	public var contextView:ContextView;
	
	[Inject]
	public var injector:Injector;
	
	public function configure():void {
		
		mainView = contextView.view as Robot2TestApp;
		
		coreInitTime = getTimer() - mainView.initTime;
		
		// set up commands
		
		eventCommandMap.map(TestEvent.CALL_COMMANDS_EMPTY).toCommand(RobotEmptyCommand);
		eventCommandMap.map(TestEvent.CALL_COMMANDS_GET_PARAMS).toCommand(RobotGetParamsCommand);
		eventCommandMap.map(TestEvent.CALL_COMMANDS_WITH_MODEL).toCommand(RobotWithModelCommand);
		eventCommandMap.map(TestEvent.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS).toCommand(RobotWithModelCommViewsCommand);
		
		// model
		
		injector.map(MockModel).asSingleton();
		
		// view
		
		mediatorMap.map(TestSprite).toMediator(RobotTestSpriteMediator);
		mediatorMap.map(Robot2TestApp).toMediator(Robot2AppMediator);
		
		mediatorMap.mediate(contextView.view as Robot2TestApp);
		
		//
		context.lifecycle.afterInitializing(init);
	}
	
	private function init():void {
		
		// init testing
		prepareTests();
		
		eventDispatcher.dispatchEvent(new OutputEvent(OutputEvent.APPEND_LINE, "RobotLegs 2 testing:       [" + (Capabilities.isDebugger ? "DEBUG" : "RELEASE") + " PLAYER. " + Capabilities.version + "]"));
		eventDispatcher.dispatchEvent(new OutputEvent(OutputEvent.APPEND_LINE, TestNames.CORE_INIT + ":" + "\t" + coreInitTime));
	
	}
	
	private function prepareTests():void {
		
		performanceTest = new PerformanceTest();
		
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_EMPTY)], TestNames.COMMAND_EMPTY, 50, 3000);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_GET_PARAMS, "testData")], TestNames.COMMAND_PARAMS, 50, 3000);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_WITH_MODEL)], TestNames.COMMAND_MODEL, 50, 3000);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS)], TestNames.COMMAND_MODEL_AND_VIEW, 50, 3000);
		
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1)], TestNames.MEDIATOR_CREATE_1000, 2, 500);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.REMOVE_TEST_VIEW, 1)], TestNames.MEDIATOR_REMOVE_1000, 2, 500);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1)], TestNames.MEDIATOR_CREATE_2000, 4, 500);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.REMOVE_TEST_VIEW, 1)], TestNames.MEDIATOR_REMOVE_2000, 4, 500);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1)], TestNames.MEDIATOR_CREATE_5000, 10, 500);
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.REMOVE_TEST_VIEW, 1)], TestNames.MEDIATOR_REMOVE_5000, 10, 500);
		
		performanceTest.queueSimpleTest(eventDispatcher.dispatchEvent, [new TestEvent(TestEvent.ACTIVATE_MEDIATOR)], TestNames.MEDIATOR_COMMUNICATE_1, 100, 10000);
		//
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.COMMUNICATION_TEST, 1)], TestNames.MEDIATOR_COMMUNICATE_100, 50, 1000)], "Communication test 100", null, spawn100Mediators));
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.COMMUNICATION_TEST, 1)], TestNames.MEDIATOR_COMMUNICATE_200, 50, 1000)], "Communication test 200", null, spawn100Mediators));
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.COMMUNICATION_TEST, 1)], TestNames.MEDIATOR_COMMUNICATE_500, 40, 1000)], "Communication test 500", null, spawn300Mediators));
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(eventDispatcher.dispatchEvent, [new MediatorTestEvent(MediatorTestEvent.COMMUNICATION_TEST, 1)], TestNames.MEDIATOR_COMMUNICATE_1000, 30, 1000)], "Communication test 1000", null, spawn500Mediators));
		
		performanceTest.addEventListener(Event.COMPLETE, handleTestComplete);
		performanceTest.addEventListener(Event.CLOSE, handleTestClose);
	}
	
	private function spawn100Mediators():void {
		for (var i:int = 0; i < 100; i++) {
			eventDispatcher.dispatchEvent(new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1));
		}
	}
	
	private function spawn300Mediators():void {
		for (var i:int = 0; i < 300; i++) {
			eventDispatcher.dispatchEvent(new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1));
		}
	}
	
	private function spawn500Mediators():void {
		for (var i:int = 0; i < 500; i++) {
			eventDispatcher.dispatchEvent(new MediatorTestEvent(MediatorTestEvent.CREATE_TEST_VIEW, 1));
		}
	}
	
	private function handleTestClose(event:Event):void {
		//trace( "RobotTestContext.handleTestClose > event : " + event );
		for (var i:int = 0; i < 1000; i++) {
			eventDispatcher.dispatchEvent(new MediatorTestEvent(MediatorTestEvent.REMOVE_TEST_VIEW, 1));
		}
		eventDispatcher.dispatchEvent(new OutputEvent(OutputEvent.APPEND_LINE, "ALL TESTS DONE! (in " + ((getTimer() - mainView.initTime) / 1000).toFixed(2) + "s)"));
	}
	
	private function handleTestComplete(event:Event):void {
		//trace("RobotTestContext.handleTestComplete > event : " + event);
		if (performanceTest.currentTest) {
			eventDispatcher.dispatchEvent(new OutputEvent(OutputEvent.APPEND_LINE, performanceTest.currentTest.name + ":" + "\t" + (performanceTest.currentTest.time / performanceTest.currentTest.loops) + "\t" + performanceTest.currentTest.toString()));
		}
	}

}
}
