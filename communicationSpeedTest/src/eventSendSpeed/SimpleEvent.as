package eventSendSpeed {
import flash.events.Event;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class SimpleEvent extends Event {
	static public const EVENT_TEST:String = "eventTest";
	
	public var testData:String;
	
	public function SimpleEvent(type:String, testData:String) {
		super(type);
		this.testData = testData;
	}

	//override public function clone():Event {
	//return new SimpleEvent(type, testData);
	//}
}
}