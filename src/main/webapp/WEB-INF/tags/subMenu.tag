<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
    .vertical-menu {
        width: 200px;
    }

    .vertical-menu a {
        background-color: #eee;
        color: black;
        display: block;
        padding: 12px;
        text-decoration: none;
    }

    .vertical-menu a:hover {
        background-color: #ccc;
    }

    .vertical-menu a.active {
        background-color: #4CAF50;
        color: white;
    }

    .mt-5 {
        margin-top: 5%;
    }

    .ml-5 {
        margin-left: 5%;
    }

    .h10 {
        height: 10vh;
    }
    .centered{
        text-align: center;
        vertical-align: middle;
    }

</style>

<div class="row ml-5">
    <div class="vertical-menu ">
        <a href="${urlBase}/home/" class="${area==null?'active':''} h10 centered">Home</a>
        <c:forEach items="${areas}" var="areaTemp">
            <a href="${urlBase}/home/${areaTemp.id}" class="${area.id==areaTemp.id?'active':''} h10 centered">${areaTemp.name}</a>
        </c:forEach>
    </div>
</div>
