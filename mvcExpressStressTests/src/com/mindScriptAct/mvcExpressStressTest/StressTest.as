package com.mindScriptAct.mvcExpressStressTest {
import com.mindScriptAct.mvcExpressStressTest.controller.StressEmptyCommand;
import com.mindScriptAct.mvcExpressStressTest.messages.Message;
import flash.utils.setTimeout;
import org.mvcexpress.modules.ModuleSprite;

/**
 * Stress tests on mvcExpress frameworke designed to be analized wit AbobeScout
 * Does nothing interesting on its own...
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class StressTest extends ModuleSprite {
	private var testCount:int;
	
	static public const NAME:String = "StressTest";
	
	public function StressTest() {
		trace("StressTest.StressTest");
		super(StressTest.NAME);
	}
	
	override protected function onInit():void {
		trace("StressTest.onInit");
		
		commandMap.map(Message.TRIGER_EMPTY_COMMAND, StressEmptyCommand);
		
		testCount = 10;
		
		setTimeout(runTest1, 500);
	}
	
	// command trigering with message 
	private function runTest1():void {
		trace("StressTest.runTest1");
		for (var i:int = 0; i < 100000; i++) {
			sendMessage(Message.TRIGER_EMPTY_COMMAND);
		}
		// repeat test
		testCount--;
		if (testCount > 0) {
			setTimeout(runTest1, 1);
		} else {
			testCount = 10;
			setTimeout(runTest2, 500);
		}
	
	}
	
	// command executing directly 
	private function runTest2():void {
		trace("StressTest.runTest2");
		for (var i:int = 0; i < 100000; i++) {
			commandMap.execute(StressEmptyCommand);
		}
		// repeat test
		testCount--;
		if (testCount > 0) {
			setTimeout(runTest2, 1);
		} else {
			testCount = 10;
				//setTimeout(runTest2, 500);
		}
	}

}
}