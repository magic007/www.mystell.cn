<?php

class SkyShe {

   public function sayHello(){

      return "hello world!";

   }

   //留言版
    public function getData($name,$mail,$tel,$info){
		$file=dirname(__FILE__)."/data.cache";

		//读取文件
		$file_pointer=fopen($file,"r");
		$file_read=fread($file_pointer,filesize($file));
		fclose($file_pointer);

		$arrays =$resultArr= array();
		$arrays = eval($file_read);

		$resultArr['name'] = trim($name);
		$resultArr['mail'] = $mail;
		$resultArr['tel'] = $tel;
		$resultArr['info'] = $info;

		array_push($arrays,$resultArr);

		$content = 'return '.var_export($arrays,true).';';


		file_put_contents($file,$content);//写入缓存
		return $name;
	}

//最新资讯
   public function postList($num,$page,$random){
$num = intval($num);
$n =$num;
$page = intval($page);
$start_page  = ($page-1)*$num;
$num = $num*$page;


		$file=dirname(__FILE__)."/new.cache";
		$file_pointer=fopen($file,"r");
		$file_read=fread($file_pointer,filesize($file));
		fclose($file_pointer);
		$arrays =$newArrays = array();
		$arrays = eval($file_read);

$i=0;
		foreach($arrays as $k=>$v){

		if($i>=$start_page && $i<$num){
			$newArrays[]=$v;
		}
		++$i;
		}
		$newArrays[0]['countPage']=count($arrays)%2==0?count($arrays)/$n:count($arrays)/$n+1;



//return $start_page.'x'.$num;
		return json_encode($newArrays);
   }

   //最新资讯
   public function postListHanye($num,$page,$random){
		$num = intval($num);
		$n =$num;
		$page = intval($page);
		$start_page  = ($page-1)*$num;
		$num = $num*$page;


		$file=dirname(__FILE__)."/hangye.cache";
		$file_pointer=fopen($file,"r");
		$file_read=fread($file_pointer,filesize($file));
		fclose($file_pointer);
		$arrays =$newArrays = array();
		$arrays = eval($file_read);

$i=0;
		foreach($arrays as $k=>$v){

		if($i>=$start_page && $i<$num){
			$newArrays[]=$v;
		}
		++$i;
		}
		$newArrays[0]['countPage']=count($arrays)%2==0?count($arrays)/$n:count($arrays)/$n+1;
		return json_encode($newArrays);
   }

   //服务中心
   function switchBaoyang($num,$page,$random) {
	   $num = intval($num);
		$n =$num;
		$page = intval($page);
		$start_page  = ($page-1)*$num;
		$num = $num*$page;


		$file=dirname(__FILE__)."/service.cache";
		$file_pointer=fopen($file,"r");
		$file_read=fread($file_pointer,filesize($file));
		fclose($file_pointer);
		$arrays =$newArrays = array();
		$arrays = eval($file_read);
$i=0;
		foreach($arrays as $k=>$v){

		if($i>=$start_page && $i<$num){
			$newArrays[]=$v;
		}
		++$i;
		}
		$newArrays[0]['countPage']=count($arrays)%2==0?count($arrays)/$n:count($arrays)/$n+1;

		return json_encode($newArrays);
   }

}

?>