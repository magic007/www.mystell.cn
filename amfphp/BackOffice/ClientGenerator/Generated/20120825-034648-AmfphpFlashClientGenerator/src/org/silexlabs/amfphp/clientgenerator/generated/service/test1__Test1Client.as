package org.silexlabs.amfphp.clientgenerator.generated.service {
    import flash.net.NetConnection;
    import flash.net.Responder;
    import org.silexlabs.amfphp.clientgenerator.AMFPHPServiceClient;
    import org.silexlabs.amfphp.clientgenerator.IResponderSignal;

    /**
    * generated with AmfphpCodeGen. Don't edit directly.
    **/
    public class test1__Test1Client extends AMFPHPServiceClient {
        /**
        * constructor.
        * @param NetConnection nc. instantiate the nc, call the connect() method on it with the amfPHP server url, .
        * maybe add some event listeners for error events, then pass it here. 
        **/
        public function test1__Test1Client(nc:NetConnection){
			super(nc, "test1__Test1");
        }
		
		
        public function testHello(	):IResponderSignal{ 
			return callService("testHello" );
        }
		
                
        
    }
}
