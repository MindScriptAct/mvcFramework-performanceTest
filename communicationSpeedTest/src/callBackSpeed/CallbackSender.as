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
			simpleFunction(TestConfig.SIMPLE_STRING);
		}
	}
	
	public function runComplexTest():void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			complexFunction(TestConfig.COMPlEX_STRING, TestConfig.COMPlEX_INT, TestConfig.COMPlEX_NUMBER, TestConfig.COMPlEX_ARRAY, TestConfig.COMPlEX_POINT);
		}
	}

}
}