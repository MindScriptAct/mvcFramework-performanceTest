package view.main {
import flash.text.TextField;
import notes.Msg;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class MainMediator extends Mediator {
	private var outputTf:TextField;
	
	[Inject]
	public var view:Main;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		outputTf = new TextField();
		view.addChild(outputTf);
		outputTf.width = 700;
		outputTf.height = 300;
		
		addHandler(Msg.PRINT_TO_OUTPUT, handlePrintToOutput);
		
	}
	
	private function handlePrintToOutput(outputMsg:String):void {
		outputTf.appendText(outputMsg+"\n");
	}
	
	override public function onRemove():void {
	
	}

}
}