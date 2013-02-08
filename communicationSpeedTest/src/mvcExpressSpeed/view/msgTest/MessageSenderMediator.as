package mvcExpressSpeed.view.msgTest {
import constants.TestConfig;
import flash.geom.Point;
import genericViewObjects.ComplexParamsVO;
import genericViewObjects.MessageSender;
import mvcExpressSpeed.messages.Msg;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class MessageSenderMediator extends Mediator {
	
	[Inject]
	public var view:MessageSender;
	
	override public function onRegister():void {
		addHandler(Msg.RUN_TEST, handleRunTest);
		addHandler(Msg.RUN_COMPLEX_TEST, handleRunComplexTest);
	}
	
	public function handleRunTest(blank:Object):void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			sendMessage(Msg.MSG_TEST, TestConfig.SIMPLE_STRING);
		}
	}
	
	public function handleRunComplexTest(blank:Object):void {
		for (var i:int = 0; i < TestConfig.MESSAGE_COUNT; i++) {
			sendMessage(Msg.COMPLEX_MSG_TEST, new ComplexParamsVO(TestConfig.COMPlEX_STRING, TestConfig.COMPlEX_INT, TestConfig.COMPlEX_NUMBER, TestConfig.COMPlEX_ARRAY, TestConfig.COMPlEX_POINT));
		}
	}
	
	override public function onRemove():void {
	
	}

}
}