package com.mindScriptAct.mvcExpressSpeedTest.controller {
import org.mvcexpress.mvc.Command;
import com.mindScriptAct.mvcExpressSpeedTest.model.BlankProxy;

/**
 * COMMENT
 * @author rbanevicius
 */
public class Inject8Command extends Command {
	
	[Inject]
	public var blankProxy1:BlankProxy;
	[Inject]
	public var blankProxy2:BlankProxy;
	[Inject]
	public var blankProxy3:BlankProxy;
	[Inject]
	public var blankProxy4:BlankProxy;
	[Inject]
	public var blankProxy5:BlankProxy;
	[Inject]
	public var blankProxy6:BlankProxy;
	[Inject]
	public var blankProxy7:BlankProxy;
	[Inject]
	public var blankProxy8:BlankProxy;
	
	public function execute(params:Object):void {
		//trace("Inject8Command.execute > notice : " + notice);
	
	}

}
}