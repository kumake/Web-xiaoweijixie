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
										<div style="background:url(images/index_content_05_01.jpg) no-repeat left top ; font-size:14px;  font-weight:bold;color:#222 ;padding-top:3px;" >　　　 工程案例</div></td>
								</tr>
								<tr>
									<td width="766" height="536">
									<!-- 主体部分开始 -->
												<%  
												key=trim(replace(request("key"),"'",""))
											 	CategoryID = VerificationUrlParam("CategoryID","int","0")%>
															<%
															''''''采用该分页类型的好处：
															''常规分页方式采用一次性将数据读入内存通过游标显示每页记录
															''当数据表记录大于10万甚至1000万时？
															''采用一支笔该分页方式的好处就是需要多少条记录就从表中读多少条记录
															''根据测试数据记录越多效果越明显。测试：asp+sql2000+数据量100万
															'''''''
															Dim total_record   	'总记录数
															Dim current_page	'当前页面
															Dim PCount			'循环页显示数目
															Dim pagesize		'每页显示记录数
															Dim showpageNum:showpageNum = true		'是否显示数字循环页
															Dim showpagetotal:showpagetotal = true	'是否显示记录总数
															Dim IsEnglish:IsEnglish = false			'是否显示英文分页格式		
															Dim strwhere:strwhere = "isdel=0"		'查询条件
															'''获取查询条件
															
															
															if categoryID<>0 then strwhere = strwhere &" and categoryID="&categoryID&""
															if key<>"" then strwhere = strwhere &" and title like '%"&key&"%'"
															''''总数记录只取一次节省数据库压力
															Dim total:total = VerificationUrlParam("total","int","0")
															if total = 0 then 
																Dim Tarray:Tarray = UICon.QueryData("select count(*) as total from user_case where "&strwhere&"")
																total_record = Tarray(0,0)
															else
																total_record = total
															end if
															current_page = VerificationUrlParam("page","int","1")
															PCount = 8			'''分页循环显示记录数
															pagesize = 8		'''每页显示记录数
															
															'这种方式为根据ID为关键字排序
															'该中分页方式效果最好。建议使用,但是排序效果受到限制
															'Dim sql:sql = UICon.QueryPageByNum("categoryID,id,title,posttime","user_news", ""&strwhere&"", "ID", true,current_page,pagesize)
															'这种方式为根据IndexID排序，IndexID值越大越靠前
															'									 "--------------需要引用的字段----------------","-表名称-","--查询条件---", "引用关键字","排序字段","倒序true","当前页","每页记录"
															Dim sql:sql = UICon.QueryPageByNotIn("*","user_case", ""&strwhere&"", "ID", "IndexID desc,ID",false,current_page,pagesize)
															'response.Write sql
															'response.End()
															set rs = UICon.QUery(sql)
															if rs.recordcount<>0 then
															do while not rs.eof
															'''''''''怎么分多列''''''
															''该页面采用DIV+css。所以分列实现起来非常方便不需要改页面
															''只需要改变css中 procontent 标签下的li的宽度即可
															''一列 只要procontent 的宽度和li的宽度一致
															''需要几列 只要将li的宽度设置为 procontent的几分之几
														   %>
															<table   style="padding-top:20px" width="100%" border="0" cellspacing="0"  cellpadding="0" align="center">
															  <% 
															  for i=1 to 2
															   %>
															  <tr>
																<% 
																for k=1 to 4
																%>
																<td align="center" style="padding-top:10px;">
															
																			  <table style="margin-bottom:30px;" width="190" height="190"  border="0" cellpadding="0" cellspacing="0">
																				<tr>
																				  <td height="140" align="center" valign="middle">
																				    <div align="center">
																				      <%if rs("Field_picture")<>"" then%>
																				                                                <a href="case_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" ><img src="<%=rs("Field_picture")%>" style="border:2px #aaa solid" width="150" height="140"/></a>
																			          <%else%>
																				        <a href="case_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" class="pro_pic">暂无缩略图</a>
																			          <%end if%>
																			        </div></td>
																				</tr>
																				<tr>
																				  <td height="20px"  style="line-height:10px"  align="center" valign="middle"><span style=""><div align="center"><a href="case_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>"><%=rs("Title")%></a></div></span></td>
																				</tr>
																				</table>	
																</td>
																<% 
																rs.movenext
																if rs.eof then exit for
																next
																%>
															  </tr>
																<% 
																if rs.eof then exit for
																next
																loop
																
																%>
															</table>
											
														  <div style="line-height:30px; text-align:center; width:100%;"> <%PageIndexUrl total_record,current_page,PCount,pagesize,showpageNum,showpagetotal,IsEnglish%></div>
																		<% 
															else
															Response.Write("&nbsp;")
															end if
															 %>
									
									<!-- 不提部分结束 -->
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