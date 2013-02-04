package com.mindScriptAct.mvcExpressSpeedTest {
import com.gskinner.performance.MethodTest;
import com.gskinner.performance.PerformanceTest;
import com.gskinner.performance.TestSuite;
import com.mindScriptAct.mvcExpressSpeedTest.constants.TestNames;
import com.mindScriptAct.mvcExpressSpeedTest.controller.EmptyCommand;
import com.mindScriptAct.mvcExpressSpeedTest.controller.GetParamCommand;
import com.mindScriptAct.mvcExpressSpeedTest.controller.Inject10Command;
import com.mindScriptAct.mvcExpressSpeedTest.controller.Inject5Command;
import com.mindScriptAct.mvcExpressSpeedTest.controller.Inject6Command;
import com.mindScriptAct.mvcExpressSpeedTest.controller.TestNamedProxysCommand;
import com.mindScriptAct.mvcExpressSpeedTest.controller.TraceCommand;
import com.mindScriptAct.mvcExpressSpeedTest.controller.WithProxyCommand;
import com.mindScriptAct.mvcExpressSpeedTest.controller.WithProxyCommViewsCommand;
import com.mindScriptAct.mvcExpressSpeedTest.model.BlankProxy;
import com.mindScriptAct.mvcExpressSpeedTest.model.INamedProxy;
import com.mindScriptAct.mvcExpressSpeedTest.model.NamedProxy;
import com.mindScriptAct.mvcExpressSpeedTest.notes.Note;
import com.mindScriptAct.mvcExpressSpeedTest.view.application.MvcExpressTestMediator;
import com.mindScriptAct.mvcExpressSpeedTest.view.testSprite.TestSprite;
import com.mindScriptAct.mvcExpressSpeedTest.view.testSprite.TestSpriteMediator;
import flash.events.Event;
import flash.system.Capabilities;
import flash.utils.getTimer;
import org.mvcexpress.modules.ModuleCore;
import org.mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author rbanevicius
 */
public class AppModule extends ModuleCore {
	private var performanceTest:PerformanceTest;
	private var coreInitTime:int;
	private var mvcExpressSpeedTest:MvcExpressSpeedTest;
	
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
	
	public function AppModule() {
		super();
	}
	
	override protected function onInit():void {
	
	}
	
	public function start(mvcExpressSpeedTest:MvcExpressSpeedTest):void {
		this.mvcExpressSpeedTest = mvcExpressSpeedTest;
		coreInitTime = getTimer() - mvcExpressSpeedTest.initTime;
		
		CONFIG::debug {
			checkClassStringConstants(Note);
		}
		
		trace("AppModule.startup");
		
		//commandMap.map(Note.TEST, Inject1Command);
		commandMap.map(Note.TEST_COMMAND_0, EmptyCommand);
		commandMap.map(Note.TEST_COMMAND_6, Inject6Command);
		commandMap.map(Note.TEST_COMMAND_5, Inject5Command);
		commandMap.map(Note.TEST_COMMAND_10, Inject10Command);
		
		commandMap.map(Note.CALL_COMMANDS_EMPTY, EmptyCommand);
		commandMap.map(Note.CALL_COMMANDS_GET_PARAMS, GetParamCommand);
		commandMap.map(Note.CALL_COMMANDS_WITH_MODEL, WithProxyCommand);
		commandMap.map(Note.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS, WithProxyCommViewsCommand);
		
		//
		proxyMap.map(new BlankProxy());
		//
		//
		mediatorMap.map(MvcExpressSpeedTest, MvcExpressTestMediator);
		mediatorMap.map(TestSprite, TestSpriteMediator);
		
		mediatorMap.mediate(mvcExpressSpeedTest);
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
	
		performanceTest.queueSimpleTest(sendMessage, [Note.CALL_COMMANDS_EMPTY], TestNames.COMMAND_EMPTY, ITERATE_COMMANDS, LOOP_COMMANDS);
		performanceTest.queueSimpleTest(sendMessage, [Note.CALL_COMMANDS_GET_PARAMS, "testData"], TestNames.COMMAND_PARAMS, ITERATE_COMMANDS, LOOP_COMMANDS);
		performanceTest.queueSimpleTest(sendMessage, [Note.CALL_COMMANDS_WITH_MODEL], TestNames.COMMAND_MODEL, ITERATE_COMMANDS, LOOP_COMMANDS);
		performanceTest.queueSimpleTest(sendMessage, [Note.CALL_COMMANDS_WITH_MODEL_COMM_VIEWS], TestNames.COMMAND_MODEL_AND_VIEW, ITERATE_COMMANDS, LOOP_COMMANDS);
		
		performanceTest.queueSimpleTest(sendMessage, [Note.CREATE_TEST_VIEW, 1], TestNames.MEDIATOR_CREATE_1000, ITERATE_MEDIATING_1, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendMessage, [Note.REMOVE_TEST_VIEW, 1], TestNames.MEDIATOR_REMOVE_1000, ITERATE_MEDIATING_1, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendMessage, [Note.CREATE_TEST_VIEW, 1], TestNames.MEDIATOR_CREATE_2000, ITERATE_MEDIATING_2, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendMessage, [Note.REMOVE_TEST_VIEW, 1], TestNames.MEDIATOR_REMOVE_2000, ITERATE_MEDIATING_2, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendMessage, [Note.CREATE_TEST_VIEW, 1], TestNames.MEDIATOR_CREATE_5000, ITERATE_MEDIATING_3, LOOP_MEDIATING);
		performanceTest.queueSimpleTest(sendMessage, [Note.REMOVE_TEST_VIEW, 1], TestNames.MEDIATOR_REMOVE_5000, ITERATE_MEDIATING_3, LOOP_MEDIATING);
		
		performanceTest.queueSimpleTest(sendMessage, [Note.ACTIVATE_MEDIATOR], TestNames.MEDIATOR_COMMUNICATE_1, ITERATE_COMMUNICATE_0, LOOP_COMMANDS);
		
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendMessage, [Note.COMMUNICATION_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_10, ITERATE_COMMUNICATE_1, LOOP_COMMUNICATE)], TestNames.MEDIATOR_COMMUNICATE_10, null, spawn10Mediators));
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendMessage, [Note.COMMUNICATION_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_20, ITERATE_COMMUNICATE_1, LOOP_COMMUNICATE)], TestNames.MEDIATOR_COMMUNICATE_20, null, spawn10Mediators));
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendMessage, [Note.COMMUNICATION_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_50, ITERATE_COMMUNICATE_2, LOOP_COMMUNICATE)], TestNames.MEDIATOR_COMMUNICATE_50, null, spawn30Mediators));
		performanceTest.queueTestSuite(new TestSuite([new MethodTest(sendMessage, [Note.COMMUNICATION_TEST, 1], TestNames.MEDIATOR_COMMUNICATE_100, ITERATE_COMMUNICATE_3, LOOP_COMMUNICATE)], TestNames.MEDIATOR_COMMUNICATE_100, null, spawn50Mediators));
		
		performanceTest.addEventListener(Event.COMPLETE, handleTestComplete);
		performanceTest.addEventListener(Event.CLOSE, handleTestClose);
		
		sendMessage(Note.APPEND_LINE, "mvcExpress testing:       [" + (Capabilities.isDebugger ? "DEBUG" : "RELEASE") + " PLAYER. " + Capabilities.version + "]");
		sendMessage(Note.APPEND_LINE, TestNames.CORE_INIT + ":" + "\t" + coreInitTime);
	}
	
	private function spawn10Mediators():void {
		for (var i:int = 0; i < 10; i++) {
			sendMessage(Note.CREATE_TEST_VIEW, 1);
		}
	}
	
	private function spawn30Mediators():void {
		for (var i:int = 0; i < 30; i++) {
			sendMessage(Note.CREATE_TEST_VIEW, 1);
		}
	}
	
	private function spawn50Mediators():void {
		for (var i:int = 0; i < 50; i++) {
			sendMessage(Note.CREATE_TEST_VIEW, 1);
		}
	}
	
	private function handleTestClose(event:Event):void {
		//trace( "RobotTestContext.handleTestClose > event : " + event );
		for (var i:int = 0; i < 1000; i++) {
			sendMessage(Note.REMOVE_TEST_VIEW, 1);
		}
		sendMessage(Note.APPEND_LINE, "ALL TESTS DONE! (in " + ((getTimer() - mvcExpressSpeedTest.initTime) / 1000).toFixed(2) + "s)");
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