package mvcExpressSpeed {
import callBackSpeed.CallBackReceiver;
import callBackSpeed.CallbackSender;
import constants.TestConfig;
import eventSendSpeed.EventReceiver;
import eventSendSpeed.EventSender;
import flash.system.Capabilities;
import flash.utils.getTimer;
import flash.utils.setTimeout;
import genericViewObjects.MessageReceiver;
import genericViewObjects.MessageSender;
import mvcExpressSpeed.messages.Msg;
import mvcExpressSpeed.view.msgTest.MessageReceiverMediator;
import mvcExpressSpeed.view.msgTest.MessageSenderMediator;
import org.mvcexpress.modules.ModuleCore;
import signalSendSpeed.SignalReceiver;
import signalSendSpeed.SignalSender;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class MainModule extends ModuleCore {
	private var callbackSender:CallbackSender;
	private var callbackReceiver:CallBackReceiver;
	private var eventSender:EventSender;
	private var eventReceiver:EventReceiver;
	private var signalSender:SignalSender;
	private var signalReceiver:SignalReceiver;
	private var messageReceiver:MessageReceiver;
	private var messageSender:MessageSender;
	
	override protected function onInit():void {
		// map commands
		// map proxies (and services)
		// map modiators
		
		mediatorMap.map(MessageReceiver, MessageReceiverMediator);
		mediatorMap.map(MessageSender, MessageSenderMediator);
	
	}
	
	public function start(main:Main):void {
		
		// set up message test
		messageReceiver = new MessageReceiver();
		messageSender = new MessageSender();
		
		mediatorMap.mediate(messageReceiver);
		mediatorMap.mediate(messageSender);
	}
	
	public function runTest():void {
		sendMessage(Msg.RUN_TEST);
	}
	
	public function runComplexTest():void {
		sendMessage(Msg.RUN_COMPLEX_TEST);
	}

}
}