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
										<div style="background:url(images/index_content_05_01.jpg) no-repeat left top ; font-size:14px;  font-weight:bold;color:#222 ;padding-top:3px;" >������ �豸չʾ</div></td>
								</tr>
								<tr>
									<td width="766" height="536">
									<!-- ���岿�ֿ�ʼ -->
												<%  
												key=trim(replace(request("key"),"'",""))
											 	CategoryID = VerificationUrlParam("CategoryID","int","0")%>
															<%
															''''''���ø÷�ҳ���͵ĺô���
															''�����ҳ��ʽ����һ���Խ����ݶ����ڴ�ͨ���α���ʾÿҳ��¼
															''�����ݱ��¼����10������1000��ʱ��
															''����һ֧�ʸ÷�ҳ��ʽ�ĺô�������Ҫ��������¼�ʹӱ��ж���������¼
															''���ݲ������ݼ�¼Խ��Ч��Խ���ԡ����ԣ�asp+sql2000+������100��
															'''''''
															Dim total_record   	'�ܼ�¼��
															Dim current_page	'��ǰҳ��
															Dim PCount			'ѭ��ҳ��ʾ��Ŀ
															Dim pagesize		'ÿҳ��ʾ��¼��
															Dim showpageNum:showpageNum = true		'�Ƿ���ʾ����ѭ��ҳ
															Dim showpagetotal:showpagetotal = true	'�Ƿ���ʾ��¼����
															Dim IsEnglish:IsEnglish = false			'�Ƿ���ʾӢ�ķ�ҳ��ʽ		
															Dim strwhere:strwhere = "isdel=0"		'��ѯ����
															'''��ȡ��ѯ����
															
															
															if categoryID<>0 then strwhere = strwhere &" and categoryID="&categoryID&""
															if key<>"" then strwhere = strwhere &" and title like '%"&key&"%'"
															''''������¼ֻȡһ�ν�ʡ���ݿ�ѹ��
															Dim total:total = VerificationUrlParam("total","int","0")
															if total = 0 then 
																Dim Tarray:Tarray = UICon.QueryData("select count(*) as total from user_pro where "&strwhere&"")
																total_record = Tarray(0,0)
															else
																total_record = total
															end if
															current_page = VerificationUrlParam("page","int","1")
															PCount = 8			'''��ҳѭ����ʾ��¼��
															pagesize = 8		'''ÿҳ��ʾ��¼��
															
															'���ַ�ʽΪ����IDΪ�ؼ�������
															'���з�ҳ��ʽЧ����á�����ʹ��,��������Ч���ܵ�����
															'Dim sql:sql = UICon.QueryPageByNum("categoryID,id,title,posttime","user_news", ""&strwhere&"", "ID", true,current_page,pagesize)
															'���ַ�ʽΪ����IndexID����IndexIDֵԽ��Խ��ǰ
															'									 "--------------��Ҫ���õ��ֶ�----------------","-������-","--��ѯ����---", "���ùؼ���","�����ֶ�","����true","��ǰҳ","ÿҳ��¼"
															Dim sql:sql = UICon.QueryPageByNotIn("*","user_pro", ""&strwhere&"", "ID", "IndexID desc,ID",false,current_page,pagesize)
															'response.Write sql
															'response.End()
															set rs = UICon.QUery(sql)
															if rs.recordcount<>0 then
															do while not rs.eof
															'''''''''��ô�ֶ���''''''
															''��ҳ�����DIV+css�����Է���ʵ�������ǳ����㲻��Ҫ��ҳ��
															''ֻ��Ҫ�ı�css�� procontent ��ǩ�µ�li�Ŀ�ȼ���
															''һ�� ֻҪprocontent �Ŀ�Ⱥ�li�Ŀ��һ��
															''��Ҫ���� ֻҪ��li�Ŀ������Ϊ procontent�ļ���֮��
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
															
																			  <table style="margin-bottom:30px;" width="190" height="200"  border="0" cellpadding="0" cellspacing="0">
																				<tr>
																				  <td height="140" align="center" valign="middle">
																				    <div align="center">
																				      <%if rs("Field_picture")<>"" then%>
																				                                                <a href="product_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" ><img src="<%=rs("Field_picture")%>" style="border:2px #aaa solid" width="150" height="140"/></a>
																			          <%else%>
																				        <a href="product_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" class="pro_pic">��������ͼ</a>
																			          <%end if%>
																			        </div></td>
																				</tr>
																				<tr>
																				  <td height="30"  style="line-height:30px"  align="center" valign="middle"><span style=""><div align="center"><a href="product_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>"><%=rs("Title")%></a></div></span></td>
																				</tr>
																				<tr>
																					<td align="center"><div align="center" class="STYLE1">��<%=rs("Field_jiage")%></div></td>
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
									
									<!-- ���Ჿ�ֽ��� -->
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