											<table id="__01" width="239"  border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<img src="images/neiye_01.jpg" width="239" height="41" alt=""></td>
											</tr>
											<tr>
												<td  background="images/neiye_h.jpg" width="239" height="146">
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
													</div></td>
											</tr>
											<tr>
												<td>
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
														</div></td>
													</tr>
													<tr>
														<td><img src="images/neiye_08.jpg" width="239" height="36" alt="" /></td>
													</tr>											
													<tr>
													<td  background="images/neiye_h.jpg" width="239" height="154">
													<div id="links">
													<p>�Ͼ���ϴ���๫˾�������̳���Ͼ�����</p>
													<p>��ݮ��ľ��������˿���Ͼ�����Ͷ��</p>
													<p>�Ͼ���ϴ���๫˾�������̳���Ͼ�����</p>
													<p>��ݮ��ľ��������˿���Ͼ�����Ͷ��</p>
													<p>�Ͼ���ϴ���๫˾�������̳���Ͼ�����</p>
													<p>��ݮ��ľ��������˿���Ͼ�����Ͷ��</p>
													<p>��ݮ��ľ��������˿���Ͼ�����Ͷ��</p>
													</div></td>
													</tr>
													<tr>
														<td>
														<img src="images/neiye_10.jpg" width="239" height="10" alt=""></td>
													</tr>
											</table>