package org.silexlabs.amfphp.clientgenerator.generated.service {
    import flash.net.NetConnection;
    import flash.net.Responder;
    import org.silexlabs.amfphp.clientgenerator.AMFPHPServiceClient;
    import org.silexlabs.amfphp.clientgenerator.IResponderSignal;

    /**
    * generated with AmfphpCodeGen. Don't edit directly.
    **/
    public class ExampleServiceClient extends AMFPHPServiceClient {
        /**
        * constructor.
        * @param NetConnection nc. instantiate the nc, call the connect() method on it with the amfPHP server url, .
        * maybe add some event listeners for error events, then pass it here. 
        **/
        public function ExampleServiceClient(nc:NetConnection){
			super(nc, "ExampleService");
        }
		
		
        public function returnOneParam(param:Object	):IResponderSignal{ 
			return callService("returnOneParam" , param);
        }
		
                
        
    }
}
