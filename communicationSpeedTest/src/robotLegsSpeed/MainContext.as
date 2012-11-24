package robotLegsSpeed {
import flash.display.DisplayObjectContainer;
import genericViewObjects.MessageReceiver;
import genericViewObjects.MessageSender;
import org.robotlegs.base.ContextEvent;
import org.robotlegs.mvcs.Context;
import robotLegsSpeed.events.TestEvent;
import robotLegsSpeed.view.RobotReceiverMediator;
import robotLegsSpeed.view.RobotSenderMediator;

public class MainContext extends Context {
	private var messageReceiver:MessageReceiver;
	private var messageSender:MessageSender;
	
	public function MainContext(contextView:DisplayObjectContainer) {
		super(contextView);
	}
	
	override public function startup():void {
		
		messageReceiver = new MessageReceiver();
		messageSender = new MessageSender();
		
		mediatorMap.mapView(MessageSender, RobotSenderMediator);
		mediatorMap.mapView(MessageReceiver, RobotReceiverMediator);
		
		mediatorMap.createMediator(messageReceiver);
		mediatorMap.createMediator(messageSender);
		
		super.startup();
	}
	
	public function runTest():void {
		dispatchEvent(new TestEvent(TestEvent.RUN_TEST));
	}
	
	public function runComplexTest():void {
		dispatchEvent(new TestEvent(TestEvent.RUN_COMPLEX_TEST));
	}

}

}