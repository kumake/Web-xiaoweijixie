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
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table  width="1005" height="1061" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<!--#include file="head.asp" -->
		</td>
	</tr>
	<tr>
		<td>		
				<table  width="1005" height="577" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="2">
							<img src="images/neiye_01.jpg" width="239" height="41" alt=""></td>
						<td>
							<img src="images/neiye_02.jpg" width="766" height="41" alt=""></td>
					</tr>
					<tr>
						<td colspan="2" background="images/neiye_h.jpg" width="239" height="146">
							<div id="equip_list">
								<ul>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">�������������豸</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">�������������豸</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">��������Ʒ��ӹ��豸</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">����Ѫ�ӹ������豸</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">������ϴ�����豸</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">���������豸</li>
								</ul>
							</div>
						</td>
						<td rowspan="6"  width="766" height="536">
						<!--�������ݿ�ʼ -->
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
				<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				  <% 
				  for i=1 to 2
				   %>
				  <tr>
					<% 
					for k=1 to 4
					%>
					<td align="center">
				
								  <table width="200" height="160" border="0" cellpadding="0" cellspacing="0">
									<tr>
									  <td height="150" align="center" valign="middle">
									  <%if rs("Field_picture")<>"" then%>
<a href="product_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" ><img src="<%=rs("Field_picture")%>" width="200" height="140"/></a>
										<%else%>
										<a href="product_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" class="pro_pic">��������ͼ</a>
										<%end if%>
										</td>
									</tr>
									<tr>
									  <td height="23"   align="center" valign="middle"><span style="line-height:150%"><a href="product_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>"><%=rs("Title")%></a></span></td>
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
						<!--�������ݽ��� -->
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<img src="images/neiye_05.jpg" width="239" height="37" alt=""></td>
					</tr>
					<tr>
						<td background="images/neiye_h.jpg" width="230" height="153">
						<div id="contact_us">
							<p><strong style="color:#333">���䣺</strong>njweikezhong@163.com</p>
							<p><strong style="color:#333">�绰��</strong>025-52772586</p>
							<p><strong style="color:#333">��ϵ�绰��</strong>13952021570</p>
							<p><strong style="color:#333">��ϵ�ˣ�</strong>�¾���</p>
							<p><strong style="color:#333">��ַ��</strong>�Ͼ�������»����</p>
							<p style="background:url(images/cxt.jpg) no-repeat 50% top; height:40px; line-height:40px;"><strong style="color:#333"  >����Ͱͣ�</strong></p>
							</div>
						</td>
						<td>
							<img src="images/neiye_07.jpg" width="9" height="153" alt=""></td>
					</tr>
					<tr>
						<td colspan="2">
							<img src="images/neiye_08.jpg" width="239" height="36" alt=""></td>
					</tr>
					<tr>
						<td colspan="2" background="images/neiye_h.jpg" width="239" height="154">
					<div id="links">
					<p>�Ͼ���ϴ���๫˾�������̳���Ͼ�����</p>
					<p>��ݮ��ľ��������˿���Ͼ�����Ͷ��</p>
					<p>�Ͼ���ϴ���๫˾�������̳���Ͼ�����</p>
					<p>��ݮ��ľ��������˿���Ͼ�����Ͷ��</p>
					<p>�Ͼ���ϴ���๫˾�������̳���Ͼ�����</p>
					<p>��ݮ��ľ��������˿���Ͼ�����Ͷ��</p>
					<p>��ݮ��ľ��������˿���Ͼ�����Ͷ��</p>
					</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<img src="images/neiye_10.jpg" width="239" height="10" alt=""></td>
					</tr>
				</table>				
		</td>
	</tr>
	<tr>
		<td colspan="2" background="images/index_04_01.jpg"  width="1005" height="129" >
			<!--#include file="footer.asp" -->
		</td>
	</tr>
</table>
</body>
</html>