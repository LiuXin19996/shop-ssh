<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title>网上商城</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet" type="text/css"/>

<script>
	function saveCart(){
		document.getElementById("cartForm").submit();
	}
</script>

</head>
<body>

<div class="container header">
	
	
	<%@ include file="menu.jsp" %>

</div>

<div class="container productContent">
		<div class="span6">
			<div class="hotProductCategory">
					<s:iterator var="c" value="#session.cList">
						<dl>
							<dt>
								<a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a>
							</dt>
								<s:iterator var="cs" value="#c.categorySeconds">
									<dd>
										<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><s:property value="#cs.csname"/></a>
									</dd>
								</s:iterator>	
						</dl>
					</s:iterator>	
			</div>
			

		</div>
		
		<div class="span18 last">
			
			<div class="productImage">
					<a title="" style="outline-style: none; text-decoration: none;" id="zoom" href="http://image/r___________renleipic_01/bigPic1ea8f1c9-8b8e-4262-8ca9-690912434692.jpg" rel="gallery">
						<div class="zoomPad"><img style="opacity: 1;" title="" class="medium" src="${ pageContext.request.contextPath }/<s:property value="model.image"/>"><div style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;" class="zoomPup"></div><div style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;" class="zoomWindow"><div style="width: 368px;" class="zoomWrapper"><div style="width: 100%; position: absolute; display: none;" class="zoomWrapperTitle"></div><div style="width: 0%; height: 0px;" class="zoomWrapperImage"><img src="%E5%B0%9A%E9%83%BD%E6%AF%94%E6%8B%89%E5%A5%B3%E8%A3%852013%E5%A4%8F%E8%A3%85%E6%96%B0%E6%AC%BE%E8%95%BE%E4%B8%9D%E8%BF%9E%E8%A1%A3%E8%A3%99%20%E9%9F%A9%E7%89%88%E4%BF%AE%E8%BA%AB%E9%9B%AA%E7%BA%BA%E6%89%93%E5%BA%95%E8%A3%99%E5%AD%90%20%E6%98%A5%E6%AC%BE%20-%20Powered%20By%20Mango%20Team_files/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg" style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;"></div></div></div><div style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;" class="zoomPreload">Loading zoom</div></div>
					</a>
				
			</div>
			<div class="name"><s:property value="product.pname"/></div>
			<div class="sn">
				<div>编号：<s:property value="product.pid"/></div>
			</div>
			<div class="info">
				<dl>
					<dt>商城价:</dt>
					<dd>
						<strong>￥：<s:property value="product.shop_price"/>元</strong>
							参 考 价：
							<del>￥<s:property value="product.market_price"/>元</del>
					</dd>
				</dl>
					<dl>
						<dt>促销:</dt>
						<dd>
								<a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
						</dd>
					</dl>
					<dl>
						<dt>    </dt>
						<dd>
							<span>    </span>
						</dd>
					</dl>
			</div>
			<form id="cartForm" action="${ pageContext.request.contextPath }/cart_addCart.action" method="post" >
				<input type="hidden" name="pid" value="<s:property value="product.pid"/>"/>
				<div class="action">
				
					<s:if test="colorState==1">
				      	<dl class="color">
							颜色分类:<select name="color">
							     <s:iterator var="co" value="colorList">
							     <option><s:property value="co"/></option>
							     </s:iterator>
							   </select>
							
						 
						</dl>
				    
				    </s:if>
					 
					 <s:if test="sizeState==1">
					 	<dl class="size">
							尺 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<select name="size">
						         <s:iterator var="si" value="sizeList">
							     <option><s:property value="si"/></option>
							     </s:iterator>
							   </select>
							
						</dl>
						
					 
					 </s:if>
						
			 
						<dl class="quantity">
							购买数量:<input id="count" name="count" value="1"  onpaste="return false;" type="text"/>件
						</dl>
						
					<div class="buy">
							<input id="addCart" class="addCart" value="加入购物车" type="button" onclick="saveCart()"/>
					</div>
				</div>
			</form>
	
			<div id="bar" class="bar">
				<ul>
						<li id="introductionTab">
							<a href="${ pageContext.request.contextPath }/product_introProduct.action?statusCode=1&proId=<s:property value="proId"/>">商品介绍</a>
						</li>
						
						<li id="commentsTab">
							<a href="${ pageContext.request.contextPath }/product_showComments.action?statusCode=2&proId=<s:property value="proId"/>&evalCode=1&page=1">商品评论</a>
						</li>
						
				</ul>
			</div>
			
			<s:if test="statusCode==1">
				<div id="introduction" name="introduction" class="introduction">
					<div class="title">
						<strong><s:property value="product.pdesc"/></strong>
					</div>
					<div>
						<img src="${pageContext.request.contextPath }/<s:property value="product.image"/>">
					</div>
				</div>
				</s:if>
				 
				<s:elseif test="statusCode==2">
	
				 <s:iterator var="orderitem" value="pageBean.list">
				  <div id="comments" name="comments" class="comments">
				  <s:property  value="#orderitem.order.user.name" />  评论：
				      <s:property  value="#orderitem.comments" />
				  </div>
				  </s:iterator>
                 
             <div class="pagination">
		       <span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
			  <s:if test="pageBean.page != 1">
				<a href="${ pageContext.request.contextPath }/product_showComments.action?statusCode=2&proId=<s:property value="proId"/>&evalCode=1&page=1" class="firstPage">&nbsp;</a>
				<a href="${ pageContext.request.contextPath }/product_showComments.action?statusCode=2&proId=<s:property value="proId"/>&evalCode=1&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
			 </s:if>
			
			 <s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/product_showComments.action?statusCode=2&proId=<s:property value="proId"/>&evalCode=1&page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			 </s:iterator>
			
			 <s:if test="pageBean.page != pageBean.totalPage">	
				<a class="nextPage" href="${ pageContext.request.contextPath }/product_showComments.action?statusCode=2&proId=<s:property value="proId"/>&evalCode=1&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/product_showComments.action?statusCode=2&proId=<s:property value="proId"/>&evalCode=1&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
			 </s:if>
			</div>
				  
		      </s:elseif>
				
			 
				
				
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
</div>
</div>
	<div class="span24">
		<div class="copyright">Copyright © 2019 网上商城 版权所有</div>
	</div>
</div>
</body>
</html>