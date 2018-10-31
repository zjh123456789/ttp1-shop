<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/10/16
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<script>
    $(function() {
        $("#addForm").submit(function() {
            if (!checkEmpty("name", "产品名称"))
                return false;
            if (!checkNumber("original_price", "原价格"))
                return false;
            if (!checkNumber("promote_price", "优惠价格"))
                return false;
            if (!checkInt("stock", "库存"))
                return false;
            return true;
        });
    });
</script>

<div class="workingArea">

    <ol class="breadcrumb">
        <li><a href="/category/category_list">所有分类</a></li>
        <li><a href="/product/product_list?cid=${c.id}">${c.name}</a></li>
        <li class="active">产品管理</li>
    </ol>

    <div class="listDataTableDiv">
        <table
                class="table table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>名称</th>
                <th>原价</th>
                <th>优惠价</th>
                <th>库存</th>
                <th>图片</th>
                <th>属性</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ps}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>
                        <c:if test="${!empty p.showPicture}">
                        <img width="40px" src="/images/productSingle/${p.showPicture.id}.jpg">
                        </c:if>
                    </td>
                    <td>${p.name}</td>
                    <td>${p.original_price}</td>
                    <td>${p.promote_price}</td>
                    <td>${p.stock}</td>
                    <td><a href="/productImage/productImage_list?pid=${p.id}"><span>图片</span></a></td>
                    <td><a href="/propertyValue/propertyValue_edit?pid=${p.id}"><span>属性</span></a></td>
                    <td><a href="product_edit?id=${p.id}"><span>编辑</span></a></td>
                    <td><a deleteLink="true" href="product_delete?id=${p.id}"><span>删除</span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增产品</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="/product/product_add">
                <table class="addTable">
                    <tr>
                        <td>产品名称</td>
                        <td><input id="name" name="name" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>原价格</td>
                        <td><input value="99.98" name="original_price" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>优惠价格</td>
                        <td><input id="promote_price"  value="19.98" name="promote_price" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input id="stock"  value="99" name="stock" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="cid" value="${c.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>
