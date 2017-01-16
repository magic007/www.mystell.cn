﻿package org.silexlabs.amfphp.clientgenerator.generated.ui{	import fla.Label;	import fla.Button;	import fla.TextInput;	import fla.TextResultDisplay;		import flash.display.MovieClip;	import flash.display.Sprite;	import flash.events.MouseEvent;	import flash.net.NetConnection;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;	import flash.text.TextFieldType;		import org.silexlabs.amfphp.clientgenerator.NetConnectionSingleton;	import org.silexlabs.amfphp.clientgenerator.generated.ObjectUtil;	import org.silexlabs.amfphp.clientgenerator.generated.service.test1__Test1Client;	import org.silexlabs.amfphp.clientgenerator.ui.elements.IDataIoGui;	import org.silexlabs.amfphp.clientgenerator.ui.elements.ILabel;		public class test1__Test1ClientUi extends MovieClip	{		/**		 * layout constants		 * */		private static const PADDING:int = 20;		private static const METHOD_UI_HEIGHT:int = 40;		private static const METHOD_INPUT_WIDTH:int = 120;		private static const CALL_BUTTON_X:int = 400;				private var _service:test1__Test1Client;						//testHello inputs 		public var testHelloLabel:ILabel;		public var testHello_callButton:ILabel;				public var resultDisplay:IDataIoGui;		public function test1__Test1ClientUi()		{			super();			var xLayoutMultiplier:int = 0;			var yLayoutMultiplier:int = 0;			var maxNumMethodInputs:int = 0;						_service = new test1__Test1Client(NetConnectionSingleton.getNetConnection());			graphics.beginFill(0, 0.3);						//testHello ui			xLayoutMultiplier = 0;			if(!testHelloLabel){				testHelloLabel = new Label();				testHelloLabel.label = 'testHello method';				testHelloLabel.displayObject.x = PADDING;				testHelloLabel.displayObject.y = PADDING + METHOD_UI_HEIGHT * yLayoutMultiplier;				addChild(testHelloLabel.displayObject);							}												if(!testHello_callButton){				testHello_callButton = new Button();				testHello_callButton.label = "call";				testHello_callButton.displayObject.x = PADDING + METHOD_INPUT_WIDTH * xLayoutMultiplier;				testHello_callButton.displayObject.y = PADDING + testHelloLabel.displayObject.height  + METHOD_UI_HEIGHT * yLayoutMultiplier;				addChild(testHello_callButton.displayObject);			}			testHello_callButton.addEventListener(MouseEvent.CLICK, testHello_callButtonClickHandler);			yLayoutMultiplier++;						if(!resultDisplay){				resultDisplay = new TextResultDisplay();				resultDisplay.displayObject.y = 2 * PADDING + METHOD_UI_HEIGHT * yLayoutMultiplier;				addChild(resultDisplay.displayObject);			}					}	  								private function testHello_callButtonClickHandler(event:MouseEvent):void{			_service.testHello().setResultHandler(testHelloResultHandler).setErrorHandler(errorHandler); 		}		private function testHelloResultHandler(obj:Object):void{			resultDisplay.data = "result : \n" + obj + '\n' + ObjectUtil.deepObjectToString(obj) + "\n";		}						private function errorHandler(obj:Object):void{			resultDisplay.data = "error :  \n" +  ObjectUtil.deepObjectToString(obj) + "\n";		}	}}