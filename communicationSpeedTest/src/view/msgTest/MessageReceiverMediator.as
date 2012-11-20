package view.msgTest {
import notes.Msg;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class MessageReceiverMediator extends Mediator {
	
	[Inject]
	public var view:MessageReceiver;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		addHandler(Msg.MSG_TEST, handleTest);
		addHandler(Msg.COMPLEX_MSG_TEST, handleComplexTest);
	}
	
	private function handleTest(testData:String):void {
		//trace( "MessageReceiverMediator.handleTest > testData : " + testData );
		var tempData:String = testData;
	}
	
	private function handleComplexTest(complexParams:ComplexParamsVO):void {
		var tempData:String = complexParams.testData;
	}
	
	override public function onRemove():void {
	
	}

}
}