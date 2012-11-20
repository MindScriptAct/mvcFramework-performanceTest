package callBackSpeed {
import constants.TestConfig;
import flash.geom.Point;

/**
 * COMMENT
 * @author rBanevicius
 */
public class CallbackSender {
	
	public var simpleFunction:Function;
	public var complexFunction:Function;
	
	public function runTest():void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			simpleFunction("someData");
		}
	}
	
	public function runComplexTest():void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			complexFunction("someMoreData", 11, 12.5, [1, 2, 3], new Point(10, 20));
		}
	}

}
}