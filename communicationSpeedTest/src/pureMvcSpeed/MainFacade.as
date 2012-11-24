package pureMvcSpeed {
import flash.display.Stage;
import genericViewObjects.MessageReceiver;
import genericViewObjects.MessageSender;
import org.puremvc.as3.interfaces.IFacade;
import org.puremvc.as3.patterns.facade.Facade;
import pureMvcSpeed.notice.Notice;
import pureMvcSpeed.view.PureReceiverMediator;
import pureMvcSpeed.view.PureSenderMediator;

/**
 * TODO:CLASS COMMENTS
 * @author rBanevicius
 */
public class MainFacade extends Facade implements IFacade {
	private var messageReceiver:MessageReceiver;
	private var messageSender:MessageSender;
	
	public static function getInstance():MainFacade {
		if (instance == null)
			instance = new MainFacade();
		return instance as MainFacade;
	}
	
	// Register commands with the controller
	override protected function initializeController():void {
		super.initializeController();
	
	}
	
	public function startUp(stage:Stage):void {
		
		messageReceiver = new MessageReceiver();
		messageSender = new MessageSender();
		
		registerMediator(new PureReceiverMediator(messageReceiver));
		registerMediator(new PureSenderMediator(messageSender));
	}
	
	public function runTest():void {
		sendNotification(Notice.RUN_TEST);
	}
	
	public function runCamplexTest():void {
		sendNotification(Notice.RUN_COMPLEX_TEST);
	}

}
}