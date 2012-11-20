package {
import callBackSpeed.CallBackReceiver;
import callBackSpeed.CallbackSender;
import constants.TestConfig;
import eventSendSpeed.EventReceiver;
import eventSendSpeed.EventSender;
import flash.system.Capabilities;
import flash.utils.getTimer;
import flash.utils.setTimeout;
import notes.Msg;
import org.mvcexpress.modules.ModuleCore;
import signalSendSpeed.SignalReceiver;
import signalSendSpeed.SignalSender;
import view.main.MainMediator;
import view.msgTest.MessageReceiver;
import view.msgTest.MessageReceiverMediator;
import view.msgTest.MessageSender;
import view.msgTest.MessageSenderMediator;

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
		
		mediatorMap.map(Main, MainMediator);
	
	}
	
	public function start(main:Main):void {
		mediatorMap.mediate(main);
		
		sendMessage(Msg.PRINT_TO_OUTPUT, "Welcome to mvcExpress communication speed test!!!             [Player:" + Capabilities.version + "]");
		sendMessage(Msg.PRINT_TO_OUTPUT, "Test will send " + TestConfig.MESSAGE_COUNT + " events, sygnals, mvcExpress messages, function callback, and compares execution time.");
		sendMessage(Msg.PRINT_TO_OUTPUT, "Simple tests send one data field(String), complex tests send 5 (String, int, Number, Array, Point)");
		sendMessage(Msg.PRINT_TO_OUTPUT, "Simple tests:");
		
		// set up callBack test
		callbackSender = new CallbackSender();
		callbackReceiver = new CallBackReceiver(callbackSender);
		
		// set up event test
		eventSender = new EventSender();
		eventReceiver = new EventReceiver(eventSender);
		
		// set up signal test
		signalSender = new SignalSender();
		signalReceiver = new SignalReceiver(signalSender);
		
		// set up message test
		messageReceiver = new MessageReceiver();
		messageSender = new MessageSender();
		
		mediatorMap.mediate(messageReceiver);
		mediatorMap.mediate(messageSender);
		
		// cool down.
		setTimeout(testSimpleEvent, 200);
	}
	
	//----------------------------------
	//     simple tests
	//----------------------------------
	
	private function testSimpleEvent():void {
		
		/*---------->*/
		var testTime_event:int = getTimer();
		eventSender.runTest();
		var testResult_event:int = getTimer() - testTime_event;
		/*---------->*/
		sendMessage(Msg.PRINT_TO_OUTPUT, "Simple event test:      \tTotal time: " + testResult_event + "\t\t\t\tavr time for 1 message:" + (testResult_event / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testSimpleSignal, 500);
		//setTimeout(testSimpleEventCashed, 500);
	}
	
	//private function testSimpleEventCashed():void {
		//
		///*---------->*/
		//var testTime_event:int = getTimer();
		//eventSender.runSavedTest();
		//var testResult_event:int = getTimer() - testTime_event;
		///*---------->*/
		//sendMessage(Msg.PRINT_TO_OUTPUT, "Saved event test:      \tTotal time: " + testResult_event + "\t\t\t\tavr time for 1 message:" + (testResult_event / TestConfig.MESSAGE_COUNT));
		//
		//setTimeout(testSimpleSignal, 500);
	//}
	
	public function testSimpleSignal():void {
		
		/*---------->*/
		var testTime_signal:int = getTimer();
		signalSender.runTest();
		var testResult_signal:int = getTimer() - testTime_signal;
		/*---------->*/
		sendMessage(Msg.PRINT_TO_OUTPUT, "Simple signal test:      \tTotal time: " + testResult_signal + "\t\t\t\tavr time for 1 message:" + (testResult_signal / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testSimpleMessage, 500);
	}
	
	public function testSimpleMessage():void {
		
		/*---------->*/
		var testTime_message:int = getTimer();
		sendMessage(Msg.RUN_TEST);
		var testResult_message:int = getTimer() - testTime_message;
		/*---------->*/
		sendMessage(Msg.PRINT_TO_OUTPUT, "Simple message test:     \tTotal time: " + testResult_message + " \t\t\t\tavr time for 1 message:" + (testResult_message / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testSimpleCallBack, 200);
	}
	
	private function testSimpleCallBack():void {
		
		/*---------->*/
		var testTime_callBack:int = getTimer();
		callbackSender.runTest();
		var testResult_callBack:int = getTimer() - testTime_callBack;
		/*---------->*/
		sendMessage(Msg.PRINT_TO_OUTPUT, "Simple callback test:      \tTotal time: " + testResult_callBack + "\t\t\t\tavr time for 1 message:" + (testResult_callBack / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexEvent, 500);
		sendMessage(Msg.PRINT_TO_OUTPUT, "Complex tests:");
	}
	
	//----------------------------------
	//     compleb tests
	//----------------------------------
	
	private function testComplexEvent():void {
		
		/*---------->*/
		var testTime_event:int = getTimer();
		eventSender.runComplexTest();
		var testResult_event:int = getTimer() - testTime_event;
		/*---------->*/
		sendMessage(Msg.PRINT_TO_OUTPUT, "Complex event test:   \tTotal time: " + testResult_event + "\t\t\t\tavr time for 1 message:" + (testResult_event / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexSignal, 500);
		//setTimeout(testComplexEventCashed, 500);
		
	}
	
	//private function testComplexEventCashed():void {
		//
		///*---------->*/
		//var testTime_event:int = getTimer();
		//eventSender.runSavedComplexTest();
		//var testResult_event:int = getTimer() - testTime_event;
		///*---------->*/
		//sendMessage(Msg.PRINT_TO_OUTPUT, "Complex event test:   \tTotal time: " + testResult_event + "\t\t\t\tavr time for 1 message:" + (testResult_event / TestConfig.MESSAGE_COUNT));
		//
		//setTimeout(testComplexSignal, 500);
	//}	
	
	public function testComplexSignal():void {
		
		/*---------->*/
		var testTime_signal:int = getTimer();
		signalSender.runComplexTest();
		var testResult_signal:int = getTimer() - testTime_signal;
		/*---------->*/
		sendMessage(Msg.PRINT_TO_OUTPUT, "Complex signal test:      \tTotal time: " + testResult_signal + "\t\t\t\tavr time for 1 message:" + (testResult_signal / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexMessage, 500);
	}
	
	public function testComplexMessage():void {
		
		/*---------->*/
		var testTime_message:int = getTimer();
		sendMessage(Msg.RUN_COMPLEX_TEST);
		var testResult_message:int = getTimer() - testTime_message;
		/*---------->*/
		sendMessage(Msg.PRINT_TO_OUTPUT, "Complex message test:  \tTotal time: " + testResult_message + "\t\t\t\tavr time for 1 message:" + (testResult_message / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexCallBack, 500);
	}
	
	private function testComplexCallBack():void {
		
		/*---------->*/
		var testTime_callBack:int = getTimer();
		callbackSender.runComplexTest();
		var testResult_callBack:int = getTimer() - testTime_callBack;
		/*---------->*/
		sendMessage(Msg.PRINT_TO_OUTPUT, "Complex callback test:\tTotal time: " + testResult_callBack + "\t\t\t\tavr time for 1 message:" + (testResult_callBack / TestConfig.MESSAGE_COUNT));
		
		sendMessage(Msg.PRINT_TO_OUTPUT, "");
		sendMessage(Msg.PRINT_TO_OUTPUT, "Done.");
	}

}
}