package robotLegsSpeed.view {
import constants.TestConfig;
import eventSendSpeed.ComplexEvent;
import eventSendSpeed.SimpleEvent;
import flash.geom.Point;
import genericViewObjects.MessageSender;
import org.robotlegs.mvcs.Mediator;
import robotLegsSpeed.events.TestEvent;

public class RobotSenderMediator extends Mediator {
	[Inject]
	public var view:MessageSender;
	
	override public function onRegister():void {
		
		addContextListener(TestEvent.RUN_TEST, handleTestEvent);
		addContextListener(TestEvent.RUN_COMPLEX_TEST, handleComplexTestEvent);
	}
	
	private function handleTestEvent(event:TestEvent):void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			dispatch(new SimpleEvent(SimpleEvent.EVENT_TEST, TestConfig.SIMPLE_STRING));
		}
	}
	
	private function handleComplexTestEvent(event:TestEvent):void {
		for (var j:int = 0; j < TestConfig.MESSAGE_COUNT; j++) {
			dispatch(new ComplexEvent(ComplexEvent.COMPLEX_EVENT_TEST, TestConfig.COMPlEX_STRING, TestConfig.COMPlEX_INT, TestConfig.COMPlEX_NUMBER, TestConfig.COMPlEX_ARRAY, TestConfig.COMPlEX_POINT));
		}
	}
}
}