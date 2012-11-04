package com.mindScriptAct.mvcExpressSpeedTest.controller {
import org.mvcexpress.mvc.PooledCommand;

/**
 * COMMENT
 * @author rbanevicius
 */
public class EmptyPoolCommand extends PooledCommand {
	
	public function execute(params:Object):void {
		//trace("TestCommand.execute");
	}

}
}