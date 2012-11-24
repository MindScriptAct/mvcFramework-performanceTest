package com.mindscriptact.robotLegs2Test.view.mainApp {
import com.mindscriptact.robotLegs2Test.config.Robotlegs2TestConfig;
import flash.display.Sprite;
import flash.utils.getTimer;
import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;

public class Robot2TestApp extends Sprite {
	
	public var initTime:int;
	
	private var context:IContext;
	
	public function Robot2TestApp() {
		
		this.initTime = getTimer();
		
		context = new Context() //
			.install(MVCSBundle) //
			.configure(Robotlegs2TestConfig) //
			.configure(new ContextView(this));
	}
}
}
