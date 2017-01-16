package org.silexlabs.amfphp.clientgenerator.generated.service {
    import flash.net.NetConnection;
    import flash.net.Responder;
    import org.silexlabs.amfphp.clientgenerator.AMFPHPServiceClient;
    import org.silexlabs.amfphp.clientgenerator.IResponderSignal;

    /**
    * generated with AmfphpCodeGen. Don't edit directly.
    **/
    public class SkySheClient extends AMFPHPServiceClient {
        /**
        * constructor.
        * @param NetConnection nc. instantiate the nc, call the connect() method on it with the amfPHP server url, .
        * maybe add some event listeners for error events, then pass it here. 
        **/
        public function SkySheClient(nc:NetConnection){
			super(nc, "SkyShe");
        }
		
		
        public function sayHello(	):IResponderSignal{ 
			return callService("sayHello" );
        }
		
                
        
    }
}
