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
<body>
<div id="container">
<table  width="1005" height="1061" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="2">
			<!--#include file="head.asp" -->
		</td>
	</tr>
	<tr>
		<td>
			<table id="__01" width="233" height="578" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<img src="images/index_nav_01.jpg" width="233" height="42" alt=""></td>
				</tr>
				<tr>
					<td background="images/index_nav_02.jpg" width="233" height="150">	
					<!--���ݿ�ʼ -->
					<div style="overflow:hidden; height:150px;">
			<div style="width:229px; overflow:hidden; ">
			<SCRIPT type=text/javascript>
			<!--
			var focus_width=229
			var focus_height=150
			var text_height=0
			var swf_height = focus_height+text_height
			
			var pics='images/ff.jpg|images/ff.jpg|images/ff.jpg|images/ff.jpg|images/ff.jpg|images/ff.jpg'
			var links='bc/news_in.asp?itemid=14|images/ff.jpg|images/ff.jpg|bc/news_in.asp?itemid=15|images/ff.jpg|images/ff.jpg'
			var texts='images/ff.jpg|images/ff.jpg|images/ff.jpg|images/ff.jpg|images/ff.jpg|images/ff.jpg'

			
			
				document.write('<object ID="focus_flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
				document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="images/playswf.swf"><param name="quality" value="high"><param name="bgcolor" value="#FFFFFF">');
				document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
				document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
				document.write('<embed ID="focus_flash" src="images/playswf.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#C5C5C5" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');	
			document.write('</object>');
				
				//-->
				</SCRIPT>
				</div>
				</div>
					<!--���ݽ��� -->
					</td>
				</tr>
				<tr>
					<td>
						<img src="images/index_nav_03.jpg" width="233" height="37" alt=""></td>
				</tr>
				<tr>
					<td background="images/index_nav_04.jpg" width="233" height="143">
							<div id="equip_list">
								<ul>
								<%
									set rs = UICon.Query("select top 6 * from user_pro order by id desc")
									do while not rs.eof
								
								%>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">����<a  href="product_in.asp?categoryid=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" title="<%=rs("title")%>"  target="_blank" ><%=rs("title")%></a></li>	
								<%
									rs.movenext
									loop
									rs.close
									set rs=nothing
								%>

								</ul>
							</div>
					</td>
				</tr>
				<tr>
					<td>
						<img src="images/index_nav_05.jpg" width="233" height="37" alt=""></td>
				</tr>
				<tr>
					<td background="images/index_nav_06.jpg" width="233" height="152">
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
					<td>
						<img src="images/index_nav_07.jpg" width="233" height="17" alt=""></td>
				</tr>
			</table>
		</td>
		<td>
				<table id="__01" width="772" height="578" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<img src="images/index_content_01.jpg" width="540" height="39" alt=""></td>
						<td>
							<img src="images/index_content_02.jpg" width="232" height="39" alt=""></td>
					</tr>
					<tr>
						<td width="540" height="154" background="images/index_content_03_01.jpg" >
							<div id="introduce">
							  <p>�����Ͼ���Τ��е�豸���޹�˾������1981�꣬�Խ���������һ��ר�Ҵ����������豸�Ŀ�����Ա����������ҹ��������ƿ�����������ʽ�����������̻����ռ������ߵȲ����ϵ�в�Ʒ�����û���ӭ�����в��������ʽ��ȴ��������ʽ���½��̻���������ϻ�����ͨ����ϵ�����С�С�ͼ������׳��������Ʒ�����������Ը��ݿͻ������Ҫ�󣬰����������������Ĳ�Ʒ���нӸ��ֹ��ļ��������豸��ά�޺͸��졣</p>
							</div>						</td>
						
						<td width="232" height="154" background="images/index_content_04_01.jpg">
							<div id="contact_us">
							<p><strong style="color:#333">���䣺</strong>njweikezhong@163.com</p>
							<p><strong style="color:#333">�绰��</strong>025-52772586</p>
							<p><strong style="color:#333">��ϵ�绰��</strong>13952021570</p>
							<p><strong style="color:#333">��ϵ�ˣ�</strong>�¾���</p>
							<p><strong style="color:#333">��ַ��</strong>�Ͼ�������»����</p>
							<p style="background:url(images/cxt.jpg) no-repeat 50% top; height:40px; line-height:40px;"><strong style="color:#333"  >����Ͱͣ�</strong></p>
							</div>						</td>
					</tr>
					<tr>
						<td><img src="images/index_content_05.jpg" width="540" height="33" alt="" /></td>
						<td>
							<img src="images/index_content_06.jpg" width="232" height="33" alt=""></td>
					</tr>
					<tr>
						<td background="images/index_content_07.jpg" width="540" height="133">
							<div id="support">
								<ul>
								<%
									set rs = UICon.Query("select top 5 * from user_case order by id desc")
									do while not rs.eof								
								%>
									<li><em><%=year(rs("PostTime"))%>-<%=month(rs("PostTime"))%>-<%=day(rs("PostTime"))%></em>����<a  href="case_in.asp?categoryid=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" title="<%=rs("title")%>"  target="_blank" ><%=rs("title")%></a></li>
								<%
									rs.movenext
									loop
									rs.close
									set rs=nothing
								%>	
								</ul>
							</div>						</td>
						<td background="images/index_content_08.jpg" width="232" height="133">
								<div id="news_con">
								<ul>
								<%
									set rs = UICon.Query("select top 5 * from user_news order by id desc")
									do while not rs.eof
								
								%>
									<li>����<a  href="news_in.asp?categoryid=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" title="<%=rs("title")%>"  target="_blank" ><%
									if len(rs("title"))>14 then	
									response.write left(rs("title"),13)&"..."
									else
									response.write rs("title")
									end if
									%></a></li>	
								<%
									rs.movenext
									loop
									rs.close
									set rs=nothing
								%>																			
								</ul>
							</div>						</td>
					</tr>
					<tr>
						<td>
							<img src="images/index_content_09.jpg" width="540" height="47" alt=""></td>
						<td>
							<img src="images/index_content_10.jpg" width="232" height="47" alt=""></td>
					</tr>
					<tr>
						<td colspan="2" background="images/index_content_11.jpg" width="772" height="159">
						<!--���ݿ�ʼ -->
								<script src="JS/MSClass.js"></script>
                        <div id="marqueediv6" style=" text-align:center;width:750px;height:159px;margin-left:13px;">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
						  
                           <%

				set rs = UICon.QUery("select top 20 * from user_pro order by hots desc ")
				if rs.recordcount<>0 then
				do while not rs.eof
				'''''''''��ô�ֶ���''''''
				''��ҳ�����DIV+css�����Է���ʵ�������ǳ����㲻��Ҫ��ҳ��
				''ֻ��Ҫ�ı�css�� procontent ��ǩ�µ�li�Ŀ�ȼ���
				''һ�� ֻҪprocontent �Ŀ�Ⱥ�li�Ŀ��һ��
				''��Ҫ���� ֻҪ��li�Ŀ������Ϊ procontent�ļ���֮��
			   %>
                            <td width="122"><table width="122" border="0" align="center" cellpadding="0" cellspacing="0"  height="122">
                                <tr>
                                  <td width="122"><a href="product_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>"><img src="<%=rs("Field_picture")%>"  height="120" ; width="140"   border="0" style="margin-top:5px"/></a>
								  <a href="product__in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" style="display:block; text-align:center; line-height:20px; color:#000; margin-top:5px;"><%=rs("title")%></a>								  </td>
                                </tr>
                            </table></td>
                            <td width="10">&nbsp;</td>
              <%
				rs.movenext
				loop
				end if
				%>              
                          </tr>
          </table>
        </div>
                        <script>new Marquee("marqueediv6",2,1,752,150,20,0,0)</script>
						<!--���ݽ��� -->						</td>
					</tr>
					<tr>
						<td colspan="2">
							<img src="images/index_content_12.jpg" width="772" height="13" alt=""></td>
					</tr>
				</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" background="images/index_04_01.jpg"  width="1005" height="129" >
			<div id="footer_text">
				<p>��Ȩ���С��Ͼ���Τ��е�豸���޹�˾������ַ���Ͼ�������»����</p>
				<p>���棺025-52772586���绰��13952021570����վͳ��</p>
			</div>
	</tr>
</table>
</div>
</body>
</html>

<%

%>
