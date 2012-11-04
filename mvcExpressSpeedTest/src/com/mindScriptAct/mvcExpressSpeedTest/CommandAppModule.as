package com.mindScriptAct.mvcExpressSpeedTest {
import com.gskinner.performance.*;
import com.mindScriptAct.mvcExpressSpeedTest.constants.*;
import com.mindScriptAct.mvcExpressSpeedTest.controller.*;
import com.mindScriptAct.mvcExpressSpeedTest.model.*;
import com.mindScriptAct.mvcExpressSpeedTest.notes.*;
import com.mindScriptAct.mvcExpressSpeedTest.view.application.*;
import com.mindScriptAct.mvcExpressSpeedTest.view.testSprite.*;
import flash.events.*;
import flash.system.*;
import flash.utils.*;
import org.mvcexpress.modules.*;
import org.mvcexpress.utils.*;

/**
 * COMMENT
 * @author rbanevicius
 */
public class CommandAppModule extends ModuleCore {
	private var performanceTest:PerformanceTest;
	private var coreInitTime:int;
	
	public function CommandAppModule() {
		super();
	}
	
	override protected function onInit():void {
	
	}
	
	public function start(mvcExpressSpeedTest:CommandMvcExpressSpeedTest):void {
		coreInitTime = getTimer() - mvcExpressSpeedTest.initTime;
		
		CONFIG::debug {
			checkClassStringConstants(Note);
		}
		
		trace("AppModule.startup");
		
		//commandMap.map(Note.TEST, Inject1Command);
		commandMap.map(Note.TEST_COMMAND_0, EmptyCommand);
		commandMap.map(Note.TEST_COMMAND_1, Inject1Command);
		commandMap.map(Note.TEST_COMMAND_2, Inject2Command);
		commandMap.map(Note.TEST_COMMAND_4, Inject4Command);
		commandMap.map(Note.TEST_COMMAND_5, Inject5Command);
		commandMap.map(Note.TEST_COMMAND_6, Inject6Command);
		commandMap.map(Note.TEST_COMMAND_8, Inject8Command);
		commandMap.map(Note.TEST_COMMAND_10, Inject10Command);
		
		commandMap.map(Note.TEST_COMMAND_POOL_0, EmptyPoolCommand);
		commandMap.map(Note.TEST_COMMAND_POOL_1, Inject1PoolCommand);
		commandMap.map(Note.TEST_COMMAND_POOL_2, Inject2PoolCommand);
		commandMap.map(Note.TEST_COMMAND_POOL_4, Inject4PoolCommand);
		commandMap.map(Note.TEST_COMMAND_POOL_8, Inject8PoolCommand);
		
		
		
		commandMap.map(Note.CALL_COMMANDS_EMPTY, EmptyCommand);
		commandMap.map(Note.CALL_COMMANDS_GET_PARAMS, GetParamCommand);
		commandMap.map(Note.CALL_COMMANDS_WITH_MODEL, WithProxyCommand);
		commandMap.map(Note.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS, WithProxyCommViewsCommand);
		
		//
		proxyMap.map(new BlankProxy());
		//
		//
		
		mediatorMap.map(TestSprite, TestSpriteMediator);
		
		
		mediatorMap.mediateWith(mvcExpressSpeedTest, MvcExpressTestMediator, MvcExpressSpeedTest);
		//
		// start
		//super.startup();
		
		//messagingTest();
		
		//commandMapTest();
		//mediatorTest();
		
		//namedProxyTesting();
		
		// init testing
		prepareTests();
	}
	
	private function namedProxyTesting():void {
		proxyMap.map(new NamedProxy("first Named Proxy"), NamedProxy, "namedProxy_1");
		proxyMap.map(new NamedProxy("Second Named Proxy"), NamedProxy, "namedProxy_2");
		proxyMap.map(new NamedProxy("Proxy maped to interface."), INamedProxy);
		
		proxyMap.map(new NamedProxy());
		
		proxyMap.map(new NamedProxy(), INamedProxy, "namedSingletonInterface");
		
		commandMap.execute(TestNamedProxysCommand);
	}
	
	private function mediatorTest():void {
		sendMessage(Note.CREATE_TEST_VIEW, 1);
		sendMessage(Note.REMOVE_TEST_VIEW, 1);
		sendMessage(Note.REMOVE_TEST_VIEW, 1);
	}
	
	private function prepareTests():void {
		performanceTest = new PerformanceTest();
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_0], TestNames.COMMAND_EMPTY, 100, 1000);
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_1], TestNames.COMMAND_INJECT_1, 100, 1000);
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_2], TestNames.COMMAND_INJECT_2, 100, 1000);
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_4], TestNames.COMMAND_INJECT_4, 100, 1000);
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_8], TestNames.COMMAND_INJECT_8, 100, 1000);
		
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_POOL_0], TestNames.COMMAND_POOL_EMPTY, 100, 1000);
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_POOL_1], TestNames.COMMAND_POOL_INJECT_1, 100, 1000);
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_POOL_2], TestNames.COMMAND_POOL_INJECT_2, 100, 1000);
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_POOL_4], TestNames.COMMAND_POOL_INJECT_4, 100, 1000);
		performanceTest.queueSimpleTest(sendMessage, [Note.TEST_COMMAND_POOL_8], TestNames.COMMAND_POOL_INJECT_8, 100, 1000);		
		
		//performanceTest.queueSimpleTest(sendMessage, [Note.CALL_COMMANDS_EMPTY], TestNames.COMMAND_EMPTY, 50, 10000);
		//performanceTest.queueSimpleTest(sendMessage, [Note.CALL_COMMANDS_GET_PARAMS, "testData"], TestNames.COMMAND_PARAMS, 50, 10000);
		//performanceTest.queueSimpleTest(sendMessage, [Note.CALL_COMMANDS_WITH_MODEL], TestNames.COMMAND_MODEL, 50, 10000);
		//performanceTest.queueSimpleTest(sendMessage, [Note.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS], TestNames.COMMAND_MODEL_AND_VIEW, 50, 10000);
		//
		//performanceTest.queueSimpleTest(sendMessage, [Note.CREATE_TEST_VIEW, 1], TestNames.MEDIATOR_CREATE_1000, 2, 500);
		//performanceTest.queueSimpleTest(sendMessage, [Note.REMOVE_TEST_VIEW, 1], TestNames.MEDIATOR_REMOVE_1000, 2, 500);
		//performanceTest.queueSimpleTest(sendMessage, [Note.CREATE_TEST_VIEW, 1], TestNames.MEDIATOR_CREATE_2000, 4, 500);
		//performanceTest.queueSimpleTest(sendMessage, [Note.REMOVE_TEST_VIEW, 1], TestNames.MEDIATOR_REMOVE_2000, 4, 500);
		//performanceTest.queueSimpleTest(sendMessage, [Note.CREATE_TEST_VIEW, 1], TestNames.MEDIATOR_CREATE_5000, 10, 500);
		//performanceTest.queueSimpleTest(sendMessage, [Note.REMOVE_TEST_VIEW, 1], TestNames.MEDIATOR_REMOVE_5000, 10, 500);
		//
		//performanceTest.queueSimpleTest(sendMessage, [Note.ACTIVATE_MEDIATOR], TestNames.MEDIATOR_COMMUNICATE_1, 100, 10000);
		//
		//performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendMessage, [Note.COMMUNICATION_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_100, 50, 1000)], "Communication test 100", null, spawn100Mediators));
		//performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendMessage, [Note.COMMUNICATION_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_200, 50, 1000)], "Communication test 200", null, spawn100Mediators));
		//performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendMessage, [Note.COMMUNICATION_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_500, 40, 1000)], "Communication test 500", null, spawn300Mediators));
		//performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendMessage, [Note.COMMUNICATION_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_1000, 30, 1000)], "Communication test 1000", null, spawn500Mediators));
		
		performanceTest.addEventListener(Event.COMPLETE, handleTestComplete);
		performanceTest.addEventListener(Event.CLOSE, handleTestClose);
		
		sendMessage(Note.APPEND_LINE, "mvcExpress testing:       [" + (Capabilities.isDebugger ? "DEBUG" : "RELEASE") + " PLAYER. " + Capabilities.version + "]");
		sendMessage(Note.APPEND_LINE, TestNames.CORE_INIT + ":" + "\t" + coreInitTime);
	}
	
	private function spawn100Mediators():void {
		for (var i:int = 0; i < 100; i++) {
			sendMessage(Note.CREATE_TEST_VIEW, 1);
		}
	}
	
	private function spawn300Mediators():void {
		for (var i:int = 0; i < 300; i++) {
			sendMessage(Note.CREATE_TEST_VIEW, 1);
		}
	}
	
	private function spawn500Mediators():void {
		for (var i:int = 0; i < 500; i++) {
			sendMessage(Note.CREATE_TEST_VIEW, 1);
		}
	}
	
	private function handleTestClose(event:Event):void {
		//trace( "RobotTestContext.handleTestClose > event : " + event );
		for (var i:int = 0; i < 1000; i++) {
			sendMessage(Note.REMOVE_TEST_VIEW, 1);
		}
		sendMessage(Note.APPEND_LINE, "ALL TESTS DONE!");
	}
	
	private function handleTestComplete(event:Event):void {
		//trace("RobotTestContext.handleTestComplete > event : " + event);
		if (performanceTest.currentTest) {
			sendMessage(Note.APPEND_LINE, performanceTest.currentTest.name + ":" + "\t" + (performanceTest.currentTest.time / performanceTest.currentTest.loops) + "\t" + performanceTest.currentTest.toString());
		}
	
	}
	
	public function commandMapTest():void {
		commandMap.map(Note.TEST, TraceCommand);
		
		sendMessage(Note.TEST, "text");
		//sendMessage(Note.TEST, new Sprite());
	}
	
	//private function messagingTest():void {
	//addCallback(Note.TEST, simpleTest1);
	//
	//sendMessage(Note.TEST);
	//
	//trace("-----");
	//addCallback(Note.TEST, simpleTest2);
	//
	//sendMessage(Note.TEST);
	//
	//trace("-----");
	//
	//addCallback(Note.TEST, simpleTest2);
	//
	//sendMessage(Note.TEST);
	//
	//trace("-----");
	//
	//removeCallback(Note.TEST, simpleTest2);
	//removeCallback(Note.TEST, simpleTest2);
	//removeCallback(Note.TEST, simpleTest1);
	//
	//sendMessage(Note.TEST);
	//
	//trace("-----");
	//
	//messenger.addCallback(Note.TEST, simpleTest1);
	//
	//messenger.addCallback(Note.TEST, simpleTest2);
	//
	//sendMessage(Note.TEST, null, "aaa");
	//sendMessage(Note.TEST, null);
	//trace("-----");
	//messenger.addCallback(Note.TEST, simpleTest2);
	//sendMessage(Note.TEST, null, "aaa");
	//trace("-----");
	//sendMessage(Note.TEST, null);
	//}
	
	//----------------------------------
	//     
	//----------------------------------
	
	private function simpleTest1(params:Object):void {
		trace("AppModule.simpleTest1");
	}
	
	public function simpleTest2(params:Object):void {
		trace("AppModule.simpleTest2");
	}

}
}