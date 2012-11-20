package eventSendSpeed {
import flash.events.Event;
import flash.geom.Point;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class ComplexEvent extends Event {
	static public const COMPLEX_EVENT_TEST:String = "complexEventTest";
	public var testData:String;
	public var testInt:int;
	public var testNr:Number;
	public var testArray:Array;
	public var testPoint:Point;
	
	public function ComplexEvent(type:String, testData:String, testInt:int, testNr:Number, testArray:Array, testPoint:Point) {
		super(type);
		this.testData = testData;
		this.testInt = testInt;
		this.testNr = testNr;
		this.testArray = testArray;
		this.testPoint = testPoint;
	}

	
	//override public function clone():Event {
		//return new ComplexEvent(type, testData, testInt, testNr, testArray, testPoint);
	//}
}
}