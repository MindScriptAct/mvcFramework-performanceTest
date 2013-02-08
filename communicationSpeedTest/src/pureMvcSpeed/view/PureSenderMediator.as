package pureMvcSpeed.view {
import constants.TestConfig;
import flash.geom.Point;
import genericViewObjects.ComplexParamsVO;
import genericViewObjects.MessageSender;
import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;
import pureMvcSpeed.notice.Notice;

/**
 * TODO:CLASS COMMENTS
 * @author rBanevicius
 */
public class PureSenderMediator extends Mediator implements IMediator {
	public static const NAME:String = "PureSenderMediator";
	
	/** viewComponent local reference */
	private var myViewComponent:MessageSender;
	
	public function PureSenderMediator(initViewComponent:MessageSender) {
		super(NAME);
		this.myViewComponent = initViewComponent;
	
	}
	
	override public function onRegister():void {
	}
	
	override public function onRemove():void {
	}
	
	override public function listNotificationInterests():Array {
		return [ //
			Notice.RUN_TEST, //
			Notice.RUN_COMPLEX_TEST //
			];
	}
	
	override public function handleNotification(notice:INotification):void {
		switch (notice.getName()) {
			case Notice.RUN_TEST: 
				for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
					sendNotification(Notice.MSG_TEST, TestConfig.SIMPLE_STRING);
				}
				break;
			case Notice.RUN_COMPLEX_TEST: 
				for (var j:int = 0; j < TestConfig.MESSAGE_COUNT; j++) {
					sendNotification(Notice.COMPLEX_MSG_TEST, new ComplexParamsVO(TestConfig.COMPlEX_STRING, TestConfig.COMPlEX_INT, TestConfig.COMPlEX_NUMBER, TestConfig.COMPlEX_ARRAY, TestConfig.COMPlEX_POINT));
				}
				break;
			default: 
				trace(" WARNING : PureSenderMediator does not handle notificotion:", notice.getName());
				break;
		}
	}

}
}