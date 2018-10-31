<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/10/24
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/fore/top.jsp"%>

<div class="aliPayPageDiv">
    <div>
        <span class="confirmMoneyText">扫一扫付款（元）</span>
        <span class="confirmMoney">
		￥<fmt:formatNumber type="number" value="${param.totalPrice}" minFractionDigits="2"/></span>
    </div>
    <div>
        <img style="width: 300px; height: 400px" class="aliPayImg" src="/images/site/alipay2wei.jpg">
    </div>

    <div>
        <a href="forepay?orderId=${param.orderId}&totalPrice=${param.totalPrice}"><button class="confirmPay">确认支付</button></a>
    </div>

</div>


