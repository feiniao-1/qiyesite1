﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jx.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.apache.commons.dbutils.QueryRunner"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
HashMap<String,String> param= G.getParamMap(request);
//获取url
String  url  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +  request.getContextPath()+request.getServletPath().substring(0,request.getServletPath().lastIndexOf("/")+1);
String url1 = request.getRequestURI(); 
/*char[] jiequhou;
int q=0;
for(int n=0;n<jiequ.length;n++){
	System.out.println(jiequ[n]);
	if(jiequ[n]=='f'){
		for(int m=n;m<jiequ.length;m++){
			jiequhou[q]=jiequ[m];
		q++;
		}
	}
}*/

System.out.println("url1"+url1);
if(url1.matches("^index$")){
	System.out.println("YES");
}else{
	System.out.println("NO");
}
int cailei;
if(request.getParameter("cailei")==null){
	cailei=1;
}else{
	cailei=Integer.parseInt(request.getParameter("cailei"));
}
String url3=request.getRequestURI().toString(); //得到相对url 
String url2=request.getRequestURI().toString(); //得到绝对URL
//验证用户登陆
String username = (String)session.getAttribute("username");
int flag=0;
if(username==null){
	
}else{
	flag=1;
}
//获取页数信息
String index_page;
if(request.getParameter("page")==null){
	index_page=String.valueOf(0);
}else{
	index_page=request.getParameter("page");
}
int page_ye=Integer.parseInt(index_page)*5;
//搜索属性
String searchtj;

/*统计 新闻数及 页数*/
String sqlPreCount = "select count(1) as count from news where newstype=? and (del is NULL or del <>1)  order BY newsid DESC ";
List<Mapx<String,Object>> sqlPreCount1 =  DB.getRunner().query(sqlPreCount, new MapxListHandler(),"boke");
//总商品数量
int total = sqlPreCount1.get(0).getInt("count");
//商品页数
int count_page=total/5;
System.out.println("count_page"+count_page);

int plus;
int minus;
//下一页
if(Integer.parseInt(index_page)==count_page){
	plus=count_page;
}else{
	plus =Integer.parseInt(index_page)+1;
}
//上一页
if(Integer.parseInt(index_page)==1){
	minus =1;	
}else{
	minus =Integer.parseInt(index_page)-1;
}
//用户信息
//List<Mapx<String, Object>> user = DB.getRunner().query("select userid from user where username=? ",new MapxListHandler(), username);

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <meta name="description" content="">
		  <meta name="keywords" content="饺耳、美食">
		<title>电子杂志</title>
		<link href="img/m-icon.png" type="image/x-icon" rel="shortcut icon" />	
		<link href="css/_main.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="layer/layer.js"></script>
		<!--[if it iE8]>
			<p class="tixin">为了达到最佳观看效果，请升级到最新浏览器</p>
        -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    	
	</head>
	<body>
		<%@ include file="header.jsp"%>
        <!--导航部分开始-->
        <div class="navbar">
        	<div class="container">
        		<div class="row">
			    	<ul id="nav2" class="nav2 clearfix">
						<li class="nLi">
								<h3><a href="front_index.jsp" >首页</a></h3>
						</li>
						<li class="nLi ">
								<h3><a href="front_news.jsp" >饺耳资讯</a></h3>
						</li>
						<li class="nLi ">
								<h3><a href="front_product.jsp?cailei=1" >饺耳菜品</a></h3>
								<ul class="sub">
									<li><a href="front_product.jsp?cailei=1">特色水饺</a></li>
									<li><a href="front_product.jsp?cailei=2">开胃凉菜</a></li>
									<li><a href="front_product.jsp?cailei=3">精美热菜</a></li>
									<li><a href="front_product.jsp?cailei=4">滋补汤锅</a></li>
									<li><a href="front_product.jsp?cailei=5">酒水饮料</a></li>
								</ul>
						</li>
						<li class="nLi on">
								<h3><a href="about-us.jsp" >关于饺耳</a></h3>
								<ul class="sub">
									<li><a href="about-us.jsp?cailei=1">公司介绍</a></li>
									<li><a href="about-us.jsp?cailei=2">公司文化</a></li>
									<li><a href="about-us.jsp?cailei=3">线下活动</a></li>
									<li><a href="about-us.jsp?cailei=6">电子杂志</a></li>
									<li><a href="about-us.jsp?cailei=4">人才招聘</a></li>
									<li><a href="about-us.jsp?cailei=5">联系我们</a></li>
								</ul>
						</li>
						<li class="nLi">
								<h3><a href="about-us.jsp?cailei=3">线下活动</a></h3>
						</li>
						<li class="nLi">
								<h3><a href="about-us.jsp?cailei=4">人才招聘</a></h3>
						</li>
						<li class="nLi">
								<h3><a href="about-us.jsp?cailei=5">联系我们</a></h3>
						</li>
						
					</ul>
        		</div>
		    </div>
		</div>
        <!--导航部分结束-->
        <!--banner图部分开始-->
        <div class="us-banner"></div>
        <!--banner图部分结束-->
        <!--博客主体内容开始-->
        <div class="mainbox" style="padding: 50px 0;">
         <div class="container" style="position: relative;">
         	<!--左边导航部分开始-->
         	<div class="us-left">
                    <ul class="about-tab">
                        <a href="about-us.jsp?cailei=1"><li id="d1" class="js-tab">公司介绍 <i></i></li></a>
                        <a href="about-us.jsp?cailei=2"><li id="d2" class="js-tab">企业文化<i></i></li></a>
                        <a href="about-us.jsp?cailei=3"><li id="d3" class="js-tab">线下活动<i></i></li></a>
                        <a href="about-us.jsp?cailei=6"><li id="d6" class="js-tab">电子杂志<i></i></li></a>
                        <a href="about-us.jsp?cailei=4"><li id="d4" class="js-tab">人才招聘<i></i></li></a>
                        <a href="about-us.jsp?cailei=5"><li id="d5" class="js-tab">联系我们 <i></i></li></a>

                    </ul>
                    			    <script type="text/javascript">
if(<%=cailei%>==1){
	$("#d1").addClass("active"); 
}
if(<%=cailei%>==2){
	$("#d2").addClass("active"); 
	}
if(<%=cailei%>==3){
	$("#d3").addClass("active"); 
	}
if(<%=cailei%>==4){
	$("#d4").addClass("active"); 
	}
if(<%=cailei%>==5){
	$("#d5").addClass("active"); 
	}
if(<%=cailei%>==6){
	$("#d6").addClass("active"); 
	}
 </script>
                    <div class="tab-line"></div>
            </div>
         	<!--左边导航部分结束-->
         	<!--右边部分开始-->
         	<div class="us-right">
         		<div class="e-book">
         			<div class="top-title">
         				<h3>饺耳电子杂志（第一期）</h3>
         			</div>
         			<div class="summary">
         				<div class="cell cell-start">
         					<div class="book-fm">
         						<img src="img/book-fm.jpg" class="img-responsive"/>
         					</div>
         					<div class="cell_primary">
         						<ul class="clearfix">
			                    	<li>【饺耳世家】：暖暖刊（第一期）</li>
			                    	<li>【发布日期】：2016-10-24</li>
			                    	<li>【所属分类】：电子杂志</li>
			                    	<li>【出版商】：饺耳世家</li>
			                    	<li>【案例大小】：6.94MB</li>
			                    	<li>【页数】：23页</li>
			                   </ul>
							    <div class="bdsharebuttonbox">
							    	<span class="fl" style="margin: 6px 6px 6px 0;font-size: 18px;">分享到</span>
									<a href="#" class="bds_more" data-cmd="more"></a>
									<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
									<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
									<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
									<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
									<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
								</div>
								<div class="down_read">
									<a class="down" href=""><strong><span class="glyphicon glyphicon-circle-arrow-down"></span>免费下载</strong></a>
									<a class="read" href=""><strong><span class="glyphicon glyphicon-sound-6-1"></span>在线阅读</strong></a>
								</div>
         					</div>
         				</div>
         				<div class="about-word">
         					<strong>杂志关键词:</strong>少女电子杂志在线阅读，幽默电子杂志下载，暖心杂志在线阅读
         				</div>
         				<div class="book-infor">
         					<h4>杂志描述</h4>
         					<p>《暖暖刊》由暖暖文学社编写的一本暖心幽默的杂志，内容励志有趣，适合所有少女。只要你有一颗少女心，我们就会精心打造最完美的你。暖暖大家族的倾心原创暖心文章尽在此刊中。</p>
         				</div>
         				<div class="about-book">
         					<h4>相关杂志</h4>
         					<ul class="clearfix">
         						<li><a href=""><img src="img/book-fm.jpg" class="img-responsive"/><p>饺耳杂志</p></a></li>
         						<li><a href=""><img src="img/book-fm.jpg" class="img-responsive"/><p>饺耳杂志</p></a></li>
         						<li><a href=""><img src="img/book-fm.jpg" class="img-responsive"/><p>饺耳杂志</p></a></li>
         						<li><a href=""><img src="img/book-fm.jpg" class="img-responsive"/><p>饺耳杂志</p></a></li>
         						<li><a href=""><img src="img/book-fm.jpg" class="img-responsive"/><p>饺耳杂志</p></a></li>
         					</ul>
         				</div>
         			</div>
         		</div>
         	</div>
         	<!--右边部分结束-->
         </div>	
        </div> 	
	</body>
	<!--百度分享js-->
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</html>
