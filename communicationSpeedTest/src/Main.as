package {
import callBackSpeed.CallBackReceiver;
import callBackSpeed.CallbackSender;
import com.bit101.components.Text;
import constants.TestConfig;
import eventSendSpeed.EventReceiver;
import eventSendSpeed.EventSender;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.system.Capabilities;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.getTimer;
import flash.utils.setTimeout;
import mvcExpressSpeed.MainModule;
import pureMvcSpeed.MainFacade;
import robotLegsSpeed.MainContext;
import signalSendSpeed.SignalReceiver;
import signalSendSpeed.SignalSender;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */

public class Main extends Sprite {
	
	private var output:Text;
	
	private var mvcExpressModule:MainModule;
	private var callbackSender:CallbackSender;
	private var callbackReceiver:CallBackReceiver;
	private var eventSender:EventSender;
	private var eventReceiver:EventReceiver;
	private var signalSender:SignalSender;
	private var signalReceiver:SignalReceiver;
	private var mainFacade:MainFacade;
	private var mainContext:MainContext;
	
	public function Main():void {
		if (stage) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
	}
	
	private function init(event:Event = null):void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		// set up output
		
		output = new Text(this);
		;
		output.setSize(900, 600);
		output.textField.textColor = 0xFFFFFF;
		output.scaleX = 2;
		output.scaleY = 2;
		
		print("Welcome to mvcExpress communication speed test!!!             [Player:" + Capabilities.version + "]");
		print("Test will send " + TestConfig.MESSAGE_COUNT + " events, sygnals, and function callback to test direct communication speed. (object to object)");
		print("Test will send " + TestConfig.MESSAGE_COUNT + " mvcExpress messages, robotlegs events and PureMVC notices to test indirect communication speed. (mediator to mediator)");
		print("Simple tests send one String data field, complex tests sends 5 (String, int, Number, Array, Point)");
		
		// set up callBack test
		callbackSender = new CallbackSender();
		callbackReceiver = new CallBackReceiver(callbackSender);
		
		// set up event test
		eventSender = new EventSender();
		eventReceiver = new EventReceiver(eventSender);
		
		// set up signal test
		signalSender = new SignalSender();
		signalReceiver = new SignalReceiver(signalSender);
		
		// start mvcExpress
		mvcExpressModule = new MainModule();
		mvcExpressModule.start(this);
		
		// start PureMVC
		mainFacade = new MainFacade();
		mainFacade.startUp(this.stage);
		
		// start Robotlegs
		mainContext = new MainContext(this);
		
		// cool down.
		setTimeout(testSimpleEvent, 1000);
		print("");
		print("Simple direct communication tests:");
	}
	
	private function print(outputMsg1:String, outputMsg2:String = ""):void {
		var space:String = "";
		
		for (var i:int = outputMsg1.length; i < 36; i++) {
			space += " ";
		}
		
		output.text += (outputMsg1 + space + "\t" + outputMsg2 + "\n");
	}
	
	//----------------------------------
	//     Simple direct communication tests
	//----------------------------------
	
	private function testSimpleEvent():void {
		
		/*---------->*/
		var testTime_event:int = getTimer();
		eventSender.runTest();
		var testResult_event:int = getTimer() - testTime_event;
		/*---------->*/
		print("Simple event test:", "Total time: " + testResult_event + "\t\t\t\tavr time for 1 message:" + (testResult_event / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testSimpleSignal, 500);
	}
	
	public function testSimpleSignal():void {
		
		/*---------->*/
		var testTime_signal:int = getTimer();
		signalSender.runTest();
		var testResult_signal:int = getTimer() - testTime_signal;
		/*---------->*/
		print("Simple signal test:", "Total time: " + testResult_signal + "\t\t\t\tavr time for 1 message:" + (testResult_signal / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testSimpleCallBack, 500);
	}
	
	private function testSimpleCallBack():void {
		
		/*---------->*/
		var testTime_callBack:int = getTimer();
		callbackSender.runTest();
		var testResult_callBack:int = getTimer() - testTime_callBack;
		/*---------->*/
		print("Simple callback test:", "Total time: " + testResult_callBack + "\t\t\t\tavr time for 1 message:" + (testResult_callBack / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testSimplePureMvcMessaging, 500);
		print("");
		print("Simple indirect communication tests:");
	}
	
	//----------------------------------
	//     Simple indirect communication
	//----------------------------------
	
	private function testSimplePureMvcMessaging():void {
		
		/*---------->*/
		var testTime_pureMvc:int = getTimer();
		mainFacade.runTest();
		var testResult_pureMvc:int = getTimer() - testTime_pureMvc;
		/*---------->*/
		print("Simple PureMvc test:", "Total time: " + testResult_pureMvc + "\t\t\t\tavr time for 1 message:" + (testResult_pureMvc / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testSimpleRobotlegsMessages, 500);
	}
	
	private function testSimpleRobotlegsMessages():void {
		
		/*---------->*/
		var testTime_robotLegs:int = getTimer();
		mainContext.runTest();
		var testResult_Robotlegs:int = getTimer() - testTime_robotLegs;
		/*---------->*/
		print("Simple robotlegs test:", "Total time: " + testResult_Robotlegs + "\t\t\t\tavr time for 1 message:" + (testResult_Robotlegs / TestConfig.MESSAGE_COUNT));
		setTimeout(testSimpleMvcexpresMessages, 500);
	}
	
	public function testSimpleMvcexpresMessages():void {
		
		/*---------->*/
		var testTime_message:int = getTimer();
		mvcExpressModule.runTest();
		var testResult_message:int = getTimer() - testTime_message;
		/*---------->*/
		print("Simple mvcExpress test:", "Total time: " + testResult_message + " \t\t\t\tavr time for 1 message:" + (testResult_message / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexEvent, 200);
		print("");
		print("Complex direct communication tests:");
	}
	
	//----------------------------------
	//     Complex direct communication
	//----------------------------------
	
	private function testComplexEvent():void {
		
		/*---------->*/
		var testTime_event:int = getTimer();
		eventSender.runComplexTest();
		var testResult_event:int = getTimer() - testTime_event;
		/*---------->*/
		print("Complex event test:", "Total time: " + testResult_event + "\t\t\t\tavr time for 1 message:" + (testResult_event / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexSignal, 500);
	
	}
	
	public function testComplexSignal():void {
		
		/*---------->*/
		var testTime_signal:int = getTimer();
		signalSender.runComplexTest();
		var testResult_signal:int = getTimer() - testTime_signal;
		/*---------->*/
		print("Complex signal test:", "Total time: " + testResult_signal + "\t\t\t\tavr time for 1 message:" + (testResult_signal / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexCallBack, 500);
	}
	
	private function testComplexCallBack():void {
		
		/*---------->*/
		var testTime_callBack:int = getTimer();
		callbackSender.runComplexTest();
		var testResult_callBack:int = getTimer() - testTime_callBack;
		/*---------->*/
		print("Complex callback test:", "Total time: " + testResult_callBack + "\t\t\t\tavr time for 1 message:" + (testResult_callBack / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexPureMvcMessaging, 500);
		
		print("");
		print("Complex indirect communication tests:");
	}
	
	//----------------------------------
	//     Complex indirect communication
	//----------------------------------
	
	private function testComplexPureMvcMessaging():void {
		
		/*---------->*/
		var testTime_pureMvc:int = getTimer();
		mainFacade.runCamplexTest();
		var testResult_pureMvc:int = getTimer() - testTime_pureMvc;
		/*---------->*/
		print("Complex PureMVC test:", "Total time: " + testResult_pureMvc + "\t\t\t\tavr time for 1 message:" + (testResult_pureMvc / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexRobotlegsMessaging, 500);
	}
	
	private function testComplexRobotlegsMessaging():void {
		
		/*---------->*/
		var testTime_robotLegs:int = getTimer();
		mainContext.runComplexTest();
		var testResult_Robotlegs:int = getTimer() - testTime_robotLegs;
		/*---------->*/
		print("Complex robotlegs test:", "Total time: " + testResult_Robotlegs + "\t\t\t\tavr time for 1 message:" + (testResult_Robotlegs / TestConfig.MESSAGE_COUNT));
		
		setTimeout(testComplexMvcexpressMessages, 500);
	}
	
	public function testComplexMvcexpressMessages():void {
		
		/*---------->*/
		var testTime_message:int = getTimer();
		mvcExpressModule.runComplexTest();
		var testResult_message:int = getTimer() - testTime_message;
		/*---------->*/
		print("Complex mvcExpress test:", "Total time: " + testResult_message + "\t\t\t\tavr time for 1 message:" + (testResult_message / TestConfig.MESSAGE_COUNT));
		
		print("");
		print("Done.");
	}
}
}