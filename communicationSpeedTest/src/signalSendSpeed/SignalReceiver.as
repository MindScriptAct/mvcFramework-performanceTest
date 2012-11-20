package signalSendSpeed {
import flash.display.Sprite;
import flash.geom.Point;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class SignalReceiver extends Sprite {
	private var signalSender:SignalSender;
	
	public function SignalReceiver(signalSender:SignalSender) {
		this.signalSender = signalSender;
		
		this.signalSender.simpleSignal.add(handleSimpleSignal);
		this.signalSender.complexSignal.add(handleComplexSignal);
	}
	
	private function handleSimpleSignal(testData:String):void {
		//trace("SignalReceiver.handleTestSignal", testData);
		var tempData:String = testData;
	}
	
	private function handleComplexSignal(testSignal:SignalVO):void {
		var tempData:String = testSignal.testData;
	}
}
}