package com.mindScriptAct.mvcExpressStressTest {
import com.mindScriptAct.mvcExpressStressTest.engine.TestProcess;
import com.mindScriptAct.mvcExpressStressTest.messages.Message;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.globalization.StringTools;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import org.mvcexpress.modules.ModuleSprite;

/**
 * Stress tests on mvcExpress frameworke designed to be analized wit AbobeScout
 * Does nothing interesting on its own...
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class MvcExpressLiveTests extends ModuleSprite {
	private var testCount:int;
	static private var myTextField:TextField;
	
	public static const TASK_COUNT:int = 100000;
	
	static public const NAME:String = "mvcExpressLiveTests";
	
	public function MvcExpressLiveTests() {
		super(MvcExpressLiveTests.NAME);
		
		
		
		
		myTextField = new TextField();
		this.addChild(myTextField);
		myTextField.text = 'TextLabel...';
		myTextField.autoSize = TextFieldAutoSize.LEFT;
	
		
		
		processMap.mapTimerProcess(TestProcess);
		processMap.startProcess(TestProcess);
		
		this.stage.addEventListener(MouseEvent.CLICK, handleMouseCleck);
		
		this.stage.addEventListener(MouseEvent.DOUBLE_CLICK, handleRightClick);
		
		this.stage.doubleClickEnabled = true;
		
		
	}
	
	private function handleRightClick(event:Event):void {
		trace( "MvcExpressLiveTests.handleRightClick > event : " + event );
		sendMessage(Message.ADD_MORE);
	}
	
	private function handleMouseCleck(event:MouseEvent):void {
		sendMessage(Message.DISTURB);
	}
	
	override protected function onInit():void {
		//trace("mvcExpressLiveTests.onInit");
	
	}
	
	static public function traceSpeed(msg:String):void {
		myTextField.appendText("\n"+msg);
	}

}
}