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
	
	public function EventSender() {
	
	}
	
	public function runTest():void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			dispatchEvent(new SimpleEvent(SimpleEvent.EVENT_TEST, TestConfig.SIMPLE_STRING));
		}
	}
	
	public function runComplexTest():void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			dispatchEvent(new ComplexEvent(ComplexEvent.COMPLEX_EVENT_TEST, TestConfig.COMPlEX_STRING, TestConfig.COMPlEX_INT, TestConfig.COMPlEX_NUMBER, TestConfig.COMPlEX_ARRAY, TestConfig.COMPlEX_POINT));
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