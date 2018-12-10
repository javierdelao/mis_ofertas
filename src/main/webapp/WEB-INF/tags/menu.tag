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

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${baseUrl}/home">Mis Ofertas</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${baseUrl}/home" id="inicio"><span class="glyphicon glyphicon-log-in"></span> Inicio</a></li>
                <li><a href="${baseUrl}/product/"><span class="glyphicon glyphicon-log-in"></span> Productos</a></li>
                <li><a href="${baseUrl}/typeProd/"><span class="glyphicon glyphicon-log-in"></span> Tipo Productos</a></li>
                <li><a href="${baseUrl}/typeCat/"><span class="glyphicon glyphicon-log-in"></span> Categorias</a></li>
                <li><a href="${baseUrl}/store/"><span class="glyphicon glyphicon-log-in"></span> Tiendas</a></li>
                <li><a id="reportes"><span class="glyphicon glyphicon-log-in"></span> Reportes</a></li>
                <li><a id="mCuenta"><span class="glyphicon glyphicon-log-in"></span> Mi Cuenta</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="row">
    <div class="col-md-12" id="dvShow">
    </div>
</div>

<!-- AdminLTE App -->
