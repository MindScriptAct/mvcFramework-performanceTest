package com.mindscriptact.robotLegs2Test.view.mainApp {
import com.mindscriptact.robotLegs2Test.events.MediatorTestEvent;
import com.mindscriptact.robotLegs2Test.events.OutputEvent;
import com.mindscriptact.robotLegs2Test.events.TestEvent;
import com.mindscriptact.robotLegs2Test.view.testSprite.TestSprite;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import robotlegs.bender.bundles.mvcs.Mediator;

public class Robot2AppMediator extends Mediator {
	
	[Inject]
	public var view:Robot2TestApp;
	
	private var testObjectCount:int = 0;
	private var outputTf:TextField;
	
	private var childHolder:Sprite = new Sprite();
	private var childStack:Vector.<TestSprite> = new Vector.<TestSprite>();
	
	override public function initialize():void {
		view.addChild(childHolder);
		
		addOutput();
		
		addContextListener(OutputEvent.APPEND_LINE, handleAppendLine);
		
		addContextListener(MediatorTestEvent.CREATE_TEST_VIEW, handleCreateTestSprite);
		addContextListener(MediatorTestEvent.REMOVE_TEST_VIEW, handleRemoveTestSprite);
		
		addContextListener(TestEvent.ACTIVATE_MEDIATOR, handleActivateMediatorTest);
	
	}
	
	private function addOutput():void {
		outputTf = new TextField();
		view.addChild(outputTf);
		
		outputTf.text = '';
		outputTf.autoSize = TextFieldAutoSize.LEFT;
		outputTf.multiline = true;
		outputTf.selectable = true;
		outputTf.border = true;
	}
	
	private function handleAppendLine(event:OutputEvent):void {
		outputTf.appendText(event.outputText + "\n");
	}
	
	private function handleCreateTestSprite(event:MediatorTestEvent):void {
		var newObject:TestSprite = new TestSprite(event.uniqueId);
		childHolder.addChild(newObject);
		childStack.push(newObject);
	}
	
	private function handleRemoveTestSprite(event:MediatorTestEvent):void {
		var oldObject:TestSprite = childStack.pop();
		if (oldObject) {
			childHolder.removeChild(oldObject);
		}
	}
	
	private function handleActivateMediatorTest(event:TestEvent):void {
		// do stuff
	}

}
}
