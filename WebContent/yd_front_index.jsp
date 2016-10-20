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

String url3=request.getRequestURI().toString(); //得到相对url 
String url2=request.getRequestURI().toString(); //得到绝对URL
//验证用户登陆
String username = (String)session.getAttribute("username");
int flag=0;
if(username==null){
	
}else{
	flag=1;
}
int cailei;
if(request.getParameter("cailei")==null){
	cailei=1;
}else{
	cailei=Integer.parseInt(request.getParameter("cailei"));
}
System.out.println("cailei"+cailei);
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
//菜品列表信息
//CREATE TABLE `productmenu` (
// `productmenuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品ID',
//  `productlei` varchar(255) DEFAULT NULL COMMENT '菜品类别',
//  `productname` varchar(255) DEFAULT NULL COMMENT '菜名',
//  `productEname` varchar(255) DEFAULT NULL COMMENT '菜英文名',
//  `content1` text COMMENT '菜品简介',
//  `img1` varchar(255) DEFAULT NULL COMMENT '图片1',
//  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
//  `updatetime` datetime DEFAULT NULL COMMENT '最新修改时间',
//  `is_discuss` tinyint(1) DEFAULT NULL COMMENT '是否被评论',
//  `del` int(11) DEFAULT NULL,
//  `count` int(11) DEFAULT NULL COMMENT '销售量',
//  `yprice` int(11) DEFAULT NULL COMMENT '原价格',
//  `xprice` int(11) DEFAULT NULL COMMENT '现价格',
//  `shoucang` int(11) DEFAULT NULL COMMENT '收藏量',
//  `canshu_url` int(11) DEFAULT NULL,
//  `tagid` int(22) DEFAULT NULL,
//  `visitor` varchar(255) DEFAULT NULL,
//  PRIMARY KEY (`productmenuid`)
//) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
//获取菜品信息
String leibie="";
if(cailei==1){
	leibie="特色水饺";
}
if(cailei==2){
	leibie="开胃凉菜";
	}
if(cailei==3){
	leibie="精美热菜"; 
	}
if(cailei==4){
	leibie="主食";
	}
if(cailei==5){
	leibie="酒水饮料";
	}
System.out.println(leibie);
List<Mapx<String,Object>> caipinshow;
	caipinshow=DB.getRunner().query("select productmenuid,productname,productEname,substring(content1,1,64) as content1,count,yprice,img1 from productmenu where del=? order by productmenuid desc limit 6", new MapxListHandler(), "0");
System.out.println("caipinshow"+caipinshow);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="饺耳世家">
		<meta name="keywords" content="饺耳世家、美食">
		<title>饺耳世家|饺耳美食|水饺|美食</title>
		<link href="images/top-icon.png" type="image/x-icon" rel="shortcut icon" />	
		<link href="css/m-style.css" rel="stylesheet">
		<script src="js/jquery-1.11.1.min.js"></script>
	</head>
	<body>
		<div class="container" style="position: relative;">
			<div class="head">
				<p>饺耳世家</p>
			</div>
			<!--轮播图开始-->
            <div class="sliderout">
                <div class="slider">
                  <ul>
                        <li style="float: left; display: inline;">
                            <a href=""><img src="images/M-banner01_02.jpg" style="width: 100%; height: 100%;"/></a>
                        </li>
                        <li style="float: left; display: inline;"> 
                            <a href=""><img src="images/M-banner01_02.jpg" style="width: 100%; height: 100%;"/></a>
                        </li>
                        <li style="float: left; display: inline;">
                            <a href=""><img src="images/M-banner01_02.jpg" style="width: 100%; height: 100%;"/></a>
                        </li>
                        <li style="float: left; display: inline;">
                            <a href=""><img src="images/M-banner01_02.jpg" style="width: 100%; height: 100%;"/></a>
                        </li>
                  </ul>
                </div>
            </div>
	       <script type="text/javascript" src="js/yxMobileSlider.js"></script>
	       <script>
	        $(".slider").yxMobileSlider({width: 640, height: 360, during: 3000})
	       </script>
            <!--轮播图end-->
            <!--导航部分开始-->
            <div class="nav">
            	<div class="cell">
            		<div class="cell_primary">
            			<a href="yd_not_open.html">
            				<div class="nav-icon nav-cake"></div>
            				<h4>饺耳外卖</h4>
            			</a>
            		</div>
            		<div class="cell_primary">
            			<a href="yd_front_baike.jsp">
            				<div class="nav-icon nav-baike"></div>
            				<h4>饺耳百科</h4>
            			</a>
            		</div>
            		<div class="cell_primary">
            			<a href="yd_front_news.jsp">
            				<div class="nav-icon nav-news"></div>
            				<h4>饺耳资讯</h4>
            			</a>
            		</div>
            		<div class="cell_primary">
            			<a href="yd_front_boke.jsp" style="border: 0;">
            				<div class="nav-icon nav-blog"></div>
            				<h4>饺耳博客</h4>
            			</a>
            		</div>
            	</div>
            </div>
            <!--导航部分结束-->
            <!--主内容区开始-->
            <div class="mainbox">
            	<div class="menu-list">
            	<%for(int i=0;i<caipinshow.size();i++){%>
            		<a href="">
            		<div class="cell bg-white">
	            			<div class="menu-pic">
	            				<img src="<%=caipinshow.get(i).getStringView("img1")%>">
	            			</div>
	            			<div class="cell_primary">
	            				<h4><%=caipinshow.get(i).getStringView("productname")%></h4>
	            				<p class="color-999999"><%=caipinshow.get(i).getStringView("productEname")%></p>
	            				<p class="color-666666 mb5">月售<%=caipinshow.get(i).getIntView("count")%><span class="ml10">好评率100%</span></p>
	            				<p><span class="color-dd2727 size16">￥<%=caipinshow.get(i).getIntView("yprice")%></span><del class="color-666666 ml10">38</del></p>
	            			</div>
            		</div>
            		</a>
				<%} %>



            	</div>
            </div>
            <!--主内容区结束-->
            <div style="height: 50px; width: 100%;"></div>
            <!--底部内容开始-->
            <div class="footer">
            	<div class="cell">
            		<div class="cell_primary">
	            		<a href="yd_front_index.jsp" class="footer-title on">
	            			<span class="footer-title-icon home"></span>
	            			<span>首页</span>	
	            		</a>
            		</div>
            		<div class="cell_primary">
	            		<a href="yd_front_product.jsp" class="footer-title">
	            			<span class="footer-title-icon menu"></span>
	            			<span>菜谱</span>	
	            		</a>
            		</div>
            		<div class="cell_primary">
	            		<a href="yd_front_boke.jsp" class="footer-title">
	            			<span class="footer-title-icon us"></span>
	            			<span>饺耳</span>	
	            		</a>
            		</div>
            		<div class="cell_primary">
	            		<a href="yd_not_open.html" class="footer-title">
	            			<span class="footer-title-icon personal"></span>
	            			<span>个人</span>	
	            		</a>
            		</div>
            	</div>
            </div>
            <!--底部内容结束-->
		</div>
	</body>
</html>

