package robotLegsSpeed.view {
import eventSendSpeed.ComplexEvent;
import eventSendSpeed.SimpleEvent;
import genericViewObjects.MessageReceiver;
import org.robotlegs.mvcs.Mediator;

public class RobotReceiverMediator extends Mediator {
	
	[Inject]
	public var view:MessageReceiver;
	
	override public function onRegister():void {
		addContextListener(SimpleEvent.EVENT_TEST, handleSimpleTest);
		addContextListener(ComplexEvent.COMPLEX_EVENT_TEST, handleComplexTest);
	}
	
	private function handleSimpleTest(event:SimpleEvent):void {
		var tempData:String = event.testData;
	}
	
	private function handleComplexTest(event:ComplexEvent):void {
		var tempData:String = event.testData;
	}
}
}