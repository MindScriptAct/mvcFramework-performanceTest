package robotLegsSpeed.events {
import flash.events.Event;

/**
 * COMMENT
 * @author rBanevicius
 */
public class TestEvent extends Event {
	
	static public const RUN_TEST:String = "runTest";
	static public const RUN_COMPLEX_TEST:String = "runComplexTest";
	
	public function TestEvent(type:String) {
		super(type);
	}
	
	public override function clone():Event {
		return new TestEvent(type);
	}

}
}