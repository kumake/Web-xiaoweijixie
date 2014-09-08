<!--#include file="conn.asp"-->
<!--#include file="sp_inc/class_page.asp"-->
<!--#include file="plugIn/Setting.Config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=config_sitename%></title>
<meta name="keywords" content="<%=config_seokeyword%>">
<meta name="description" content="<%=config_seocontent%>">
<link href="css/public.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="container">
<table  width="1005" height="1061" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<!--#include file="head.asp" --></td>
	</tr>
	<tr>
		<td>		
				<table id="__01" width="1005" height="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<!--#include file="sidebar.asp" -->
						</td>
						<td>
							<table>
								<tr>
									<td background="images/index_content_05_03.jpg" width="766" height="41" style="line-height:41px">
										<div style="background:url(images/index_content_05_01.jpg) no-repeat left top ; font-size:14px;  font-weight:bold;color:#222 ;padding-top:3px;" >　　　 技术支持</div></td>
								</tr>
								<tr>
									<td width="766" height="536">
									<!-- 主体部分开始 -->
										<div id="main_content">
										<% singlename = VerificationUrlParam("signle","string","技术支持")
										response.Write UserSinglePage(singlename)%>
										</div>
									<!-- 主体部分结束 -->
										</td>
								</tr>								
							</table></td>
					</tr>
				</table></td>
	</tr>
	<tr>
		<td colspan="2" background="images/index_04_01.jpg"  width="1005" height="129" >
			<!--#include file="footer.asp" -->
		</td>
	</tr>
</table>
</div>
</body>
</html>