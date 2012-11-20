package eventSendSpeed {
import constants.TestConfig;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class EventSender extends Sprite {
	//static private var _savedEvent:SimpleEvent = new SimpleEvent(SimpleEvent.EVENT_TEST, "someData");
	//static private var _savedEvent2:ComplexEvent = new ComplexEvent(ComplexEvent.COMPLEX_EVENT_TEST, "someMoreData", 11, 12.5, [1, 2, 3], new Point(10, 20));
	
	public function EventSender() {
	
	}
	
	public function runTest():void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			dispatchEvent(new SimpleEvent(SimpleEvent.EVENT_TEST, "someData"));
		}
	}
	
	public function runComplexTest():void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			dispatchEvent(new ComplexEvent(ComplexEvent.COMPLEX_EVENT_TEST, "someMoreData", 11, 12.5, [1, 2, 3], new Point(10, 20)));
		}
	}
	
	//public function runSavedTest():void {
		//for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			//dispatchEvent(EventSender._savedEvent);
		//}
	//}
	//
	//public function runSavedComplexTest():void {
		//for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			//dispatchEvent(_savedEvent2);
		//}
	//}
}
}