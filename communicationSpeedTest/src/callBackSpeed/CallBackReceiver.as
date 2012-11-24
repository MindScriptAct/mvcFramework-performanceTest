package callBackSpeed {
import flash.geom.Point;

/**
 * COMMENT
 * @author rBanevicius
 */
public class CallBackReceiver {
	
	public function CallBackReceiver(callbackSender:CallbackSender) {
		callbackSender.simpleFunction = simpleFunction;
		callbackSender.complexFunction = complexFunction;
	}
	
	private function simpleFunction(stringData:String):void {
		var tempData:String = stringData;
	}
	
	private function complexFunction(stringData:String, intData:int, numberData:Number, arrayData:Array, pointData:Point):void {
		var tempData:String = stringData;
	}

}
}