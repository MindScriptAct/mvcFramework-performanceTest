package com.mindScriptAct.mvcExpressSpeedTest.controller {
import org.mvcexpress.mvc.PooledCommand;
import com.mindScriptAct.mvcExpressSpeedTest.model.BlankProxy;

/**
 * COMMENT
 * @author rbanevicius
 */
public class Inject1PoolCommand extends PooledCommand {
	
	[Inject]
	public var blankProxy:BlankProxy;
	
	public function execute(params:Object):void {
		//trace("Inject1Command.execute > notice : " + notice);
	}

}
}