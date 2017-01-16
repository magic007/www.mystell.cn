package 
{
	import com.adobe.serialization.json.JSON;
	import flash.display.*;
	import flash.events.*;
	import flash.system.System;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.net.*;
	import fl.transitions.easing.None;
	import flash.text.*;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.net.NetConnection;
	import flash.events.MouseEvent;
	import flash.net.Responder;
	import gs.TweenLite;
	import fl.motion.easing.Back;



	public class news extends MovieClip
	{
		private var listxml:XML;
		private var loader:URLLoader;
		private var list_box:Sprite;
		private var new_lists,show_boxs,page_mc,clip_mc:MovieClip;
		private var list_id:int = 0;
		private var page:int = 1;
		private var pages:int = 0;//当前页面0为列表页面，1为内容页面
		private var num:int = 4;
		private var count:int = 0;
		private var persons:Array;
		private var urls,funs:String;


		private var mail_check:Boolean = true;
		public var _netConnection:NetConnection;

		public function news()
		{

			
			this.urls = "./amfphp/Amfphp/";
			this.funs = "SkyShe/postList";
			_netConnection = new NetConnection();
			getDataList(this.num,this.page);

			//导航绑定事件;
			mc_memu.bt_hangye.addEventListener(MouseEvent.CLICK,openHangye);
			mc_memu.bt_news.addEventListener(MouseEvent.CLICK,openNews);

		}



		private function getDataList(num:int,page:int)
		{

			_netConnection.connect(this.urls);
			_netConnection.call(this.funs, new Responder(handleResult, handleError),num,page,Math.random()* 10);

		}

		private function handleResult(result:Object):void
		{
			persons = JSON.decode(result.toString());
			assign(persons);
		}
		
		private function handleError(error:Object):void
		{
			//submit_ok.text  = error.toString();
			mc_news.mc_this_text.text = "错误";
			trace(error.toString());
		}

		public function assign(persons:Array)
		{

			show_boxs = new MovieClip();
			mc_news.mc_newsbg.addChild(show_boxs);
			show_boxs.x = -120;
			show_boxs.y = 20;
			for (var i:int=0; i<persons.length; i++)
			{
				new_lists = new news_list();
				show_boxs.addChild(new_lists);
				new_lists.alpha = 0;
				TweenLite.to(new_lists.text_bg,0.1,{alpha:0 , ease:None.easeOut});
				TweenLite.to(new_lists, 0.5*(i/2), {alpha:1, x:160, volume:0});
				new_lists.mc_img.source = persons[i]['img'];
				new_lists.mc_img.buttonMode = true;

				new_lists.mc_t.htmlText = "<a href='#'>" + persons[i]['title'] + "</a>";
				new_lists.mc_c.htmlText = persons[i]['info'];
				new_lists.mc_time.text = persons[i]['datetime'];

				//new_lists.mc_t.htmlText="<a href='#'>xxxxxxxxxxx</a>";;
				//new_lists.text_bg.buttonMode = true;
				//new_lists.text_bg.mouseChildren=false;
				new_lists.y = i * 110;
				new_lists.addEventListener(MouseEvent.MOUSE_OVER,list_over);
				new_lists.addEventListener(MouseEvent.MOUSE_OUT,list_out);
				new_lists.mc_id.text = i;
				new_lists.mc_t.addEventListener(MouseEvent.CLICK,openContent);
				new_lists.mc_img.addEventListener(MouseEvent.CLICK,openContent);
				new_lists.mc_b.addEventListener(MouseEvent.CLICK,openContent);
			}


			//绑定页面事件
			this.count = persons[0]['countPage'];
			trace(this.page);
			/*mc_news.mc_page.mc_1.addEventListener(MouseEvent.CLICK, onePage);
			mc_news.mc_page.mc_2.addEventListener(MouseEvent.CLICK, pviePage);
			mc_news.mc_page.mc_3.addEventListener(MouseEvent.CLICK, nextPage);
			mc_news.mc_page.mc_4.addEventListener(MouseEvent.CLICK, countPage);*/
			bingUnbingAction(mc_news,0);

		}

		//切换导航
		private function openHangye(event:Event)
		{
			if(this.funs == "SkyShe/postListHanye"){
			return;
			}
			mc_news.mc_this_text.text = "行业资讯";
			//切换方法
			this.funs = "SkyShe/postListHanye";
			if(this.pages==0){
				mc_news.mc_newsbg.removeChild(show_boxs);			
			}else{
				closeContents();
				}
			getDataList(this.num,this.page);
		}
		private function openNews(event:Event)
		{
			if(this.funs == "SkyShe/postList"){
			return;
			}
			mc_news.mc_this_text.text = "最新动态";
			this.funs = "SkyShe/postList";
			if(this.pages==0){
			mc_news.mc_newsbg.removeChild(show_boxs);
			
			}else{
				closeContents();
			}
			
			getDataList(this.num,this.page);
		}

		private function bingUnbingAction(obj,x:int)
		{
			if (x==0)
			{
				obj.mc_page.mc_1.addEventListener(MouseEvent.CLICK, onePage);
				obj.mc_page.mc_2.addEventListener(MouseEvent.CLICK, pviePage);
				obj.mc_page.mc_3.addEventListener(MouseEvent.CLICK, nextPage);
				obj.mc_page.mc_4.addEventListener(MouseEvent.CLICK, countPage);
			}
			else
			{
				obj.mc_page.mc_1.removeEventListener(MouseEvent.CLICK, onePage);
				obj.mc_page.mc_2.removeEventListener(MouseEvent.CLICK, pviePage);
				obj.mc_page.mc_3.removeEventListener(MouseEvent.CLICK, nextPage);
				obj.mc_page.mc_4.removeEventListener(MouseEvent.CLICK, countPage);
			}
		}

		private function openContent(event:Event)
		{
			this.pages=1;//设置当前为内容页面
			bingUnbingAction(mc_news,1);
			var id:int = event.currentTarget.parent.mc_id.text;
			mc_news.mc_newsbg.removeChild(show_boxs);
			clip_mc = new mc_content();

			mc_news.mc_newsbg.addChild(clip_mc);
			TweenLite.to(clip_mc,0.3, {alpha:1, x:80,y:50,volume:0});

			clip_mc.mc_c_img.source = persons[id]['img'];
			clip_mc.mc_c_t.text = persons[id]['title'];
			clip_mc.mc_c_c.htmlText = persons[id]['content'];
			clip_mc.mc_c_time.text = persons[id]['datetime'];

			clip_mc.mc_c_colse.addEventListener(MouseEvent.CLICK, closeContent);
		}
		//mc_c_colse;


		private function closeContent(event:Event)
		{
			this.pages=0;
			TweenLite.to(clip_mc,0.5, {alpha:0, x:0,volume:0});
			getDataList(this.num,this.page);
		}
		private function closeContents()
		{			
			this.pages=0;
			TweenLite.to(clip_mc,0.5, {alpha:0,x:0,volume:0,onComplete:removerCon});	
			function removerCon(){
			mc_news.mc_newsbg.removeChild(clip_mc);
			}
		}

		public function nextPage(event:Event):void
		{
			if (this.page == this.count)
			{
				return;
			}
			mc_news.mc_newsbg.removeChild(show_boxs);
			this.page++;
			getDataList(this.num,this.page);

		}

		public function pviePage(event:Event):void
		{
			if (this.page == 1)
			{
				return;
			}
			mc_news.mc_newsbg.removeChild(show_boxs);
			this.page--;
			getDataList(this.num,this.page);

		}
		public function onePage(event:Event):void
		{

			mc_news.mc_newsbg.removeChild(show_boxs);
			this.page = 1;
			getDataList(this.num,this.page);

		}

		public function countPage(event:Event):void
		{
			mc_news.mc_newsbg.removeChild(show_boxs);
			this.page = this.count;
			getDataList(this.num,this.page);

		}



		

		private function list_over(e:MouseEvent)
		{
			TweenLite.to(e.currentTarget.text_bg,0.2,{alpha:0.5,ease:None.easeOut});
		}
		private function list_out(e:MouseEvent)
		{
			TweenLite.to(e.currentTarget.text_bg,0.2,{alpha:0,ease:None.easeOut});
		}


	}
}