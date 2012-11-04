package com.mindScriptAct.mvcExpressSpeedTest.controller {
import org.mvcexpress.mvc.Command;
import com.mindScriptAct.mvcExpressSpeedTest.model.BlankProxy;

/**
 * COMMENT
 * @author rbanevicius
 */
public class Inject2Command extends Command {
	
	[Inject]
	public var blankProxy1:BlankProxy;
	[Inject]
	public var blankProxy2:BlankProxy;	
	
	public function execute(params:Object):void {
		//trace("Inject2Command.execute > notice : " + notice);
	}

}
}