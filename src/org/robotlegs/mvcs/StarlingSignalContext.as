package org.robotlegs.mvcs
{
	
	import org.robotlegs.base.SignalCommandMap;
	import org.robotlegs.core.ISignalCommandMap;
	import org.robotlegs.core.ISignalContext;
	
	import starling.display.DisplayObjectContainer;

    public class StarlingSignalContext extends StarlingContext implements ISignalContext
    {
        protected var _signalCommandMap:ISignalCommandMap;

		public function StarlingSignalContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
        public function get signalCommandMap():ISignalCommandMap
        {
            return _signalCommandMap || (_signalCommandMap = new SignalCommandMap(injector.createChild(injector.applicationDomain)));
        }

        public function set signalCommandMap(value:ISignalCommandMap):void
        {
            _signalCommandMap = value;
        }

        override protected function mapInjections():void
        {
            super.mapInjections();
            injector.mapValue(ISignalCommandMap, signalCommandMap);
        }
    }
}
