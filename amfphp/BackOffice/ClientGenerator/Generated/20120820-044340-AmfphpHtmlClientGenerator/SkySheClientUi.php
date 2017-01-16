<?php 
/**
 *  This file is part of amfPHP
 *
 * LICENSE
 *
 * This source file is subject to the license that is bundled
 * with this package in the file license.txt.
 * @package Amfphp_Backoffice_Generators
 * 
 */

/**
 * include
 */
 require_once 'top.php';
?>
<ul id='menu'>
<h1>SkyShe Service UI</h1>
<script type="text/javascript">
<!--

function sayHelloResultHandler(returned){
	$('#resultOutput').dump(returned);
}

function sayHelloServiceCall(){
	amfphp.services.SkyShe.sayHello(sayHelloResultHandler, onError);	
}

function onError(){
	alert("error");
}
//-->
</script>

 <li><b>sayHello

		<input type="submit" value="call sayHello" onclick="sayHelloServiceCall()"/>
</b></li>		

</ul>
<br/>
<div id="content">
	<div id="resultOutput">
	</div>
</div>
    </body>	
</html>
