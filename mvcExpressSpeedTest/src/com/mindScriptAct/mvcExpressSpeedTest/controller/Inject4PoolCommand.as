package com.mindScriptAct.mvcExpressSpeedTest.controller {
import org.mvcexpress.mvc.PooledCommand;
import com.mindScriptAct.mvcExpressSpeedTest.model.BlankProxy;

/**
 * COMMENT
 * @author rbanevicius
 */
public class Inject4PoolCommand extends PooledCommand {
	
	[Inject]
	public var blankProxy1:BlankProxy;
	[Inject]
	public var blankProxy2:BlankProxy;
	[Inject]
	public var blankProxy3:BlankProxy;
	[Inject]
	public var blankProxy4:BlankProxy;
	
	public function execute(params:Object):void {
		//trace("Inject1Command.execute > notice : " + notice);
	}

}
}