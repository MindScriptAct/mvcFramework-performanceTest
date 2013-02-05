package com.mindScriptAct.mvcExpressStressTest.engine {
import com.mindScriptAct.mvcExpressStressTest.messages.Message;
import com.mindScriptAct.mvcExpressStressTest.MvcExpressLiveTests;
import org.mvcexpress.live.Process;

/**
 * TODO:CLASS COMMENT
 * @author rBanevicius
 */
public class TestProcess extends Process {
	private var taskCount:int;
	
	static public const NAME:String = "TestProcess";
	
	override protected function onRegister():void {
		trace("TestProcess.init");
		
		taskCount = MvcExpressLiveTests.TASK_COUNT;
		
		for (var i:int = 0; i < MvcExpressLiveTests.TASK_COUNT; i++) {
			addTask(TestTask, String(i));
		}
		
		addHandler(Message.DISTURB, handleDisturb);
		addHandler(Message.ADD_MORE, handleAddMore);
		
		MvcExpressLiveTests.traceSpeed("Total tasks:" + taskCount);
	}
	
	private function handleAddMore(blank:Object):void {
		
		for (var i:int = taskCount; i < taskCount + MvcExpressLiveTests.TASK_COUNT; i++) {
			addTask(TestTask, String(i));
		}
		
		taskCount += MvcExpressLiveTests.TASK_COUNT;
		
		MvcExpressLiveTests.traceSpeed("Total tasks:" + taskCount);
	}
	
	private function handleDisturb(blank:Object):void {
		enableTask(TestTask, "0");
	
	}
	
	override protected function onRemove():void {
	}

}
}