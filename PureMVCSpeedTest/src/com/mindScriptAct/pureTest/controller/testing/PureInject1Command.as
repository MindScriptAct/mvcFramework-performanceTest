package com.mindScriptAct.pureTest.controller.testing {
import com.mindScriptAct.pureTest.model.mock.MockProxy;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

/**
 * ...
 * @author Deril (raima156@yahoo.com)
 */
public class PureInject1Command extends SimpleCommand {
	
	override public function execute(notice:INotification):void {
		
		var mockProxy1:MockProxy = facade.retrieveProxy(MockProxy.NAME) as MockProxy;
		
		//trace( "PureEmptyCommand.execute > notice : " + notice );
	}
	
}
}