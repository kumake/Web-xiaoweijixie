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
									<td>
										<img src="images/neiye_02.jpg" width="766" height="41" alt=""></td>
								</tr>
								<tr>
									<td width="766" height="536">
									<!-- 主体部分开始 -->
									<div id="main_content">
									<%
										'''''模型表ID
										Dim modelID:modelID = 1
										'''''模型表名称
										Dim ModelTable:ModelTable ="user_pro"
										Dim categoryid:categoryid = VerificationUrlParam("categoryid","int","0")
										Dim ItemID:ItemID = VerificationUrlParam("itemid","int","0")
										Dim Itempage:Itempage = VerificationUrlParam("page","int","0")
										Dim action:action = VerificationUrlParam("action","string","")
										if action<>"" and action="save" then
										''''增加评论
										Dim ModelItemID:ModelItemID = request.Form("ModelItemID")
										Dim ip:ip = request.ServerVariables("LOCAL_ADDR")
										Dim title:title = request.Form("txt_title")
										Dim content:content = request.Form("txt_content")
										UIcon.execute("insert into Sp_Comment (ModelID,ModelItemID,UseruID,UserName,title,content,ip,posttime) values ("&ModelID&","&ModelItemID&","&Sn("user_id")&",'"&Sn("user_username")&"','"&title&"','"&content&"','"&ip&"','"&now()&"')")
										''''更新模型表评论数目
										UIcon.execute("update "&ModelTable&" set CommentCount=CommentCount +1 where id="&ItemID&"")
										Alert "评论成功","page.asp?categoryid="&categoryid&"&ID="&ItemID&""
										end if
										%>
										<%
										''''该信息的用户组权限
										Dim UserGroup:UserGroup=""
										''''存放权限数组
										Dim UserGroupArray
										'''''验证标志
										Dim flag:flag = false
										'''''当前用户所属用户组
										Dim user_groupID:user_groupID = Sn("user_groupID")
										set rs = UICon.Query("select * from user_case where ID="&ItemID&"")
										UIcon.execute("update user_pro set Hots=Hots +1 where id="&ItemID&"")
										if rs.recordcount=0 then
										Alert "找不到对应的信息",""
										else
										UserGroup = rs("UserGroup")
										if UserGroup<>"" then
										if user_groupID<>"" then
										UserGroupArray = split(UserGroup,",")
										for i=0 to ubound(UserGroupArray)
										if cint(user_groupID)=Cint(UserGroupArray(i)) then
											flag = true
											exit for
										end if
										next
										if flag=false then Alert "你所在用户组无权查看该信息",""
										else
										Alert "该信息需要登陆验证！请先登陆",""
										end if
										end if
										%>
										<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
										<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
										<td height="20" align="left" valign="middle">&nbsp;</td>
										</tr>
										<tr>
										<td height="30" align="center" valign="middle" class="lan" ><h1 align="center"><%=rs("title")%></h1></td>
										</tr>
										<tr>
										<td height="18" align="left" valign="middle">&nbsp;</td>
										</tr>
										<tr>
										<td align="left" valign="middle" class="line_h"  headers="500">
										<% 
										if rs("Field_picture")<>"" then
										%>
										<div style="margin:10px auto; text-align:center"><img src="<%=rs("Field_picture")%>"></div>
										<% Else %>
										&nbsp;
										<% End If %>
										<%
										''''分页				
										if rs("Field_content")<>"" then
										Dim ContentArray:ContentArray = split(rs("Field_content"),"{#page#}")
										Dim pagelength:pagelength = ubound(ContentArray)
										''''显示信息内容
										if Cint(Itempage)>=Cint(pagelength) then Itempage = pagelength
										response.Write ContentArray(Itempage)
										response.Write"<br>"
										for pagei=0 to pagelength
										'''显示分页
										'response.Write "<a href='"&GetpageItemUrl()&pagei&"'>"
										'if Cint(Itempage)=Cint(pagei) then
										'response.Write "<font color='#FF0000'>"&(pagei+1)&"</font>"
										'else
										' response.Write (pagei+1)
										'end if
										'response.Write "</a>&nbsp;"
										next				
										end if
										end if
										%></td>
										</tr>
										<tr>
										<td height="70" align="left" valign="middle">
										<br>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
										<td height="35" align="left" valign="middle" class="news_fabutime" style="font-weight: bold">发布时间：<%=rs("posttime")%></td>
										<td align="right" valign="middle" class="news_word">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 点击次数（<%=rs("Hots")%>）</td>
										</tr>
										</table></td>
										</tr>
										</table>
										上一个案例：
										<%
										set rsu = Uicon.query("select top 1 id,categoryid,title from user_pro where categoryid="&categoryid&" and id<"&itemid&" order by id desc")
										'response.Write rsu("title")
										if rsu.recordcount<>0 then 
										response.Write "<a href='?categoryid="&rsu("categoryid")&"&itemid="& rsu("id")&"'  >"& rsu("title") &"</a>"
										else
										response.Write "已经是第一个案例"
										end if
										%></td>
										</tr>
										<tr>
										<td height="26">下一个案例：
										<%
										set rsn = Uicon.query("select top 1 id,categoryid,title from user_pro where categoryid="&categoryid&" and id>"&itemid&" order by id asc")
										if rsn.recordcount<>0 then 
										response.Write "<a href='?categoryid="&rsn("categoryid")&"&itemid="&rsn("id")&"'  >"&rsn("title")&"</a>"
										else
										response.Write "已经是最后一个案例"
										end if
										%></td>
										</tr>
										<tr>
										<td width="519" height="1"><img src="images/news_12.gif" width="100%" height="1" alt="" /></td>
										</tr>
										</table>
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