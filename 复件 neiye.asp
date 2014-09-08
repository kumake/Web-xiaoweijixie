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
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">　　家禽屠宰设备</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">　　畜类屠宰设备</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">　　肉制品深加工设备</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">　　血加工成套设备</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">　　清洗输送设备</li>
									<li style="background:url(images/pic1.jpg) no-repeat left 50%">　　配套设备</li>
								</ul>
							</div>
						</td>
						<td rowspan="6"  width="766" height="536">
						<!--主体内容开始 -->
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
					Dim Tarray:Tarray = UICon.QueryData("select count(*) as total from user_pro where "&strwhere&"")
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
				Dim sql:sql = UICon.QueryPageByNotIn("*","user_pro", ""&strwhere&"", "ID", "IndexID desc,ID",false,current_page,pagesize)
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
										<a href="product_in.asp?categoryID=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" class="pro_pic">暂无缩略图</a>
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
						<!--主体内容结束 -->
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<img src="images/neiye_05.jpg" width="239" height="37" alt=""></td>
					</tr>
					<tr>
						<td background="images/neiye_h.jpg" width="230" height="153">
						<div id="contact_us">
							<p><strong style="color:#333">邮箱：</strong>njweikezhong@163.com</p>
							<p><strong style="color:#333">电话：</strong>025-52772586</p>
							<p><strong style="color:#333">联系电话：</strong>13952021570</p>
							<p><strong style="color:#333">联系人：</strong>陈经理</p>
							<p><strong style="color:#333">地址：</strong>南京江宁区禄口镇</p>
							<p style="background:url(images/cxt.jpg) no-repeat 50% top; height:40px; line-height:40px;"><strong style="color:#333"  >阿里巴巴：</strong></p>
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
					<p>南京清洗保洁公司　天津论坛　南京阳光</p>
					<p>蓝莓苗木　精密螺丝　南京贷款投资</p>
					<p>南京清洗保洁公司　天津论坛　南京阳光</p>
					<p>蓝莓苗木　精密螺丝　南京贷款投资</p>
					<p>南京清洗保洁公司　天津论坛　南京阳光</p>
					<p>蓝莓苗木　精密螺丝　南京贷款投资</p>
					<p>蓝莓苗木　精密螺丝　南京贷款投资</p>
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