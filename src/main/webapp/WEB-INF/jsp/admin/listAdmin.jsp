<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/10/18
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<div class="workingArea" style="padding-right: 50px; padding-left: 50px">
    <h1 class="label label-info" >管理员管理</h1>
    <br>
    <br>

    <div class="listDataTableDiv" >
        <table class="table table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>管理员名称</th>
                <th>角色</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${admins}" var="a">
                <tr>
                    <td>${a.id}</td>
                    <td>${a.name}</td>
                    <td>${a.type}</td>
                    <td><a deleteLink="true" href="/admin/admin_delete?id=${a.id}"><span
                            class=" 	glyphicon glyphicon-trash"></span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>
</div>

