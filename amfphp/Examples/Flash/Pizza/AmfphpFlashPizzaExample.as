﻿package  {
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.net.NetConnection;
	import flash.events.MouseEvent;
	import flash.net.Responder;
	
	public class AmfphpFlashPizzaExample extends MovieClip {
		
		public var getPizzaBtn:SimpleButton;
		public var resultTxt:TextField;
		public var warningTxt:TextField;
		
		private var _netConnection:NetConnection;
		
		public function AmfphpFlashPizzaExample() {
			getPizzaBtn.addEventListener(MouseEvent.CLICK, getPizzaBtnClickHandler);
			_netConnection = new NetConnection();
		}
		
		private function getPizzaBtnClickHandler(event:MouseEvent):void{
			if(loaderInfo.url.indexOf("file://") == 0){
				warningTxt.text = "Please access this example through a server, and not through the file system, as the gateway is set as a relative url. Alternatively you can change the url in the class.";
			}else{
				_netConnection.connect("../../Php/");
				_netConnection.call("PizzaService/getPizza", new Responder(handleResult, handleError));
			}
		}
		
		
		private function handleResult(result:Object):void{
			resultTxt.text = result.toString();
		}		

	}
	
}
