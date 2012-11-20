package signalSendSpeed {
import constants.TestConfig;
import flash.display.Sprite;
import flash.geom.Point;
import org.osflash.signals.Signal;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class SignalSender extends Sprite {
	
	public var simpleSignal:Signal = new Signal(String);
	
	public var complexSignal:Signal = new Signal(SignalVO);
	
	public function SignalSender() {
	
	}
	
	public function runTest():void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			simpleSignal.dispatch("someData");
		}
	}
	
	public function runComplexTest():void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			complexSignal.dispatch(new SignalVO("someMoreData", 11, 12.5, [1, 2, 3], new Point(10, 20)));
		}
	}

}
}