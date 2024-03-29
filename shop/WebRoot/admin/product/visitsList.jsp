<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	</HEAD>
	<body>
		<form id="Form1" name="Form1">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>商品访问排行列表</strong>
						</TD>
					</tr>
					 
				
	 
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="4%">
										序号
									</td>
									<td align="center" width="10%">
										商品图片
									</td>
									<td align="center" width="10%">
										商品名称
									</td>
									<td align="center" width="4%">
										商品价格
									</td>
									<td align="center" width="4%">
										访问量
									</td>
		
								</tr>
									<s:iterator var="p" value="pageBean.list" status="status">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="4%">
												<s:property value="#status.count"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												<img width="60" height="65" src="${ pageContext.request.contextPath }/<s:property value="#p.image"/>">
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												<s:property value="#p.pname"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="4%">
												<s:property value="#p.shop_price"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="4%">
											  <s:property value="#p.visits"/>
										</td>
										 
									  </tr>
									</s:iterator>	
							</table>
						</td>
					</tr>
					
				</TBODY>
			</table>
			
			<div class="pagination"  align="center">
				  <span>第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页 </span>
				  <s:if test="pageBean.page != 1">
					 <a href="${ pageContext.request.contextPath }/adminProduct_findAllByVisits.action?page=1">首页</a>|
					 <a href="${ pageContext.request.contextPath }/adminProduct_findAllByVisits.action?page=<s:property value="pageBean.page-1"/>">上一页</a>|
				 </s:if>		
				 <s:iterator var="i" begin="1" end="pageBean.totalPage">
				 <s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/adminProduct_findAllByVisits.action?page=<s:property value="#i"/>"><s:property value="#i"/></a>
				 </s:if>
				 <s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				 </s:else>
			    </s:iterator>
				<s:if test="pageBean.page != pageBean.totalPage">
					 <a href="${ pageContext.request.contextPath }/adminProduct_findAllByVisits.action?page=<s:property value="pageBean.page+1"/>">下一页</a>|
					 <a href="${ pageContext.request.contextPath }/adminProduct_findAllByVisits.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>|
				</s:if>			   
		   </div>	 
		</form>
	</body>
</HTML>

