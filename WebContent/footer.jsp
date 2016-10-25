<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jx.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.apache.commons.dbutils.QueryRunner"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 <!--页面底部板块开始-->
         <div class="footer">
        	<div class="container">
        		<div class="row">
        			<div class="cell">
        				<div class="logo"><a href="" target="_blank"><img src="img/logo02_03.png"></a></div>
        				<div class="cell_primary">
        					<p class="foot-link">
        						<a href="front_index.jsp" target="_blank">首页</a><span>|</span>
        						<a href="#" target="_blank">饺耳博客</a><span>|</span>
        						<a href="front_baike.jsp?page=0" target="_blank">饺耳百科</a><span>|</span>
        						<a href="#" target="_blank">饺耳问答</a><span>|</span>
        						<a href="#" target="_blank">饺耳图库</a><span>|</span>
        						<a href="#" target="_blank">RSS</a><span>|</span>
        						<a href="#" target="_blank">XML</a>
        					</p>
        					<p>© Copyright 2008-2016. 京ICP备15008545号</p>
        					<p>饺耳热线：010-80440188 / 010-80443266</p>
        					<p><a href="" target="_blank">技术支持：DESIGN BY IWISDOMS TEAM</a></p>
        					<p class="icon-link">
        						<a href="" target="_blank" title="分享到微信"><img src="img/wx-icon_03.png"></a>
        						<a href="" target="_blank" title="分享到新浪微博"><img src="img/wb-icon_03.png"></a>
        						<a href="" target="_blank" title="分享到QQ空间"><img src="img/kj-icon_03.png"></a>
        						<a href="" target="_blank" title="分享到人人网"><img src="img/rr-icon_03.png"></a>
        					</p>
        				</div>
        				<div class="e-mail">
        				<%//获取url
        				HashMap<String,String> param1= G.getParamMap(request);
        				String  urlfootor;
        				String path = request.getContextPath();  
        				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   
        				String servletPath=request.getServletPath();    
        				String requestURI=request.getRequestURI();  
        				System.out.println("path:"+path);  
        				System.out.println("basePath:"+basePath);   
        				System.out.println("servletPath:"+servletPath);   
        				if(request.getQueryString()==null){
        					urlfootor=requestURI;
        					System.out.println("requestURI111:"+requestURI);
        				}else{
        					urlfootor=requestURI+"?"+request.getQueryString();
        					System.out.println("requestURI111:"+requestURI+"?"+request.getQueryString());
        				}
        				//CREATE TABLE `mail` (
        				//		  `mailid` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮箱ID',
        				//		  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
        				//		  `mail` varchar(255) DEFAULT NULL COMMENT '邮箱',
        				//		  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
        				//		  `updatetime` datetime DEFAULT NULL COMMENT '最新修改时间',
        				//		  `count` int(11) DEFAULT NULL COMMENT '统计次数',
        				//		  `del` int(11) DEFAULT NULL,
        				//		  PRIMARY KEY (`mailid`)
        				//		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
        				//收集邮件信息
        				String mailusername;
						String mailmail;
						SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式  
        				if(param1.get("Action")!=null && param1.get("Action").equals("订阅")){
        					mailusername=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
        					mailmail=new String(request.getParameter("mail").getBytes("iso-8859-1"),"utf-8");
        					DB.getRunner().update("insert into mail(username,mail,createtime) values(?,?,?)",mailusername,mailmail,df1.format(new Date()));
        					%>
        					<script type="text/javascript" language="javascript">
        							alert("感谢您的订阅提交，我们将在2个工作日内给您发送邮件");                                            // 弹出错误信息
        							window.location="<%=urlfootor%>" ;                            // 跳转到登录界面
        					</script>
        				<%
        				}
        				%>
        					<h4>邮箱订阅/Newsletter</h4>
        					<form action="<%=urlfootor%>" class="input-group" method="POST">
        						<input type="text" name="username" placeholder="姓名"/>
        						<input type="text" name="mail" placeholder="邮箱"/>
        						<span class="mr20">把最新鲜的东西呈现给您</span><input type="submit" name="Action" value="订阅" />
        					</form>
        				</div>
        				<div class="ewm-box">
        					<img src="img/ewm02_03.jpg">
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
        <!--页面底部板块结束-->
        <!--返回顶部-->
		<div id="topcontrol" style="position: fixed; bottom: 80px; right: 30px;cursor: pointer; z-index: 9; display: none;" title="返回顶部">
			<img style="width:50px; height:50px;" src="img/gotop.jpg">
		</div>
		<!--返回顶部结束-->
</body>
</html>