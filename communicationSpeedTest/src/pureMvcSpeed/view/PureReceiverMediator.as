package pureMvcSpeed.view {
import genericViewObjects.ComplexParamsVO;
import genericViewObjects.MessageReceiver;
import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;
import pureMvcSpeed.notice.Notice;

/**
 * TODO:CLASS COMMENTS
 * @author rBanevicius
 */
public class PureReceiverMediator extends Mediator implements IMediator {
	public static const NAME:String = "PureReceiverMediator";
	
	/** viewComponent local reference */
	private var myViewComponent:MessageReceiver;
	
	public function PureReceiverMediator(initViewComponent:MessageReceiver) {
		super(NAME);
		this.myViewComponent = initViewComponent;
	
	}
	
	override public function onRegister():void {
	}
	
	override public function onRemove():void {
	}
	
	override public function listNotificationInterests():Array {
		return [ //
			Notice.MSG_TEST, //
			Notice.COMPLEX_MSG_TEST //
			];
	}
	
	override public function handleNotification(notice:INotification):void {
		var testData:String;
		switch (notice.getName()) {
			case Notice.MSG_TEST: 
				testData = notice.getBody() as String;
				break;
			case Notice.COMPLEX_MSG_TEST: 
				var testObj:ComplexParamsVO = notice.getBody() as ComplexParamsVO;
				testData = testObj.testData;
				break;
			default: 
				trace(" WARNING : PureReceiverMediator does not handle notificotion:", notice.getName());
				break;
		}
	}

}
}