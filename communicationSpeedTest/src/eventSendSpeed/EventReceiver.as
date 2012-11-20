package eventSendSpeed {
import flash.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class EventReceiver extends Sprite {
	private var eventSender:EventSender;
	
	public function EventReceiver(eventSender:EventSender) {
		this.eventSender = eventSender;
		
		eventSender.addEventListener(SimpleEvent.EVENT_TEST, handleEvent);
		eventSender.addEventListener(ComplexEvent.COMPLEX_EVENT_TEST, handleComplexEvent);
	}
	
	private function handleEvent(event:SimpleEvent):void {
		var tempData:String = event.testData;
	}
	
	private function handleComplexEvent(event:ComplexEvent):void {
		var tempData:String = event.testData;
	}	
	

}
}