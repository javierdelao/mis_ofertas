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
    #container {
        min-width: 310px;
        max-width: 800px;
        height: 400px;
        margin: 0 auto
    }

    .content {
        margin-top: 80px;
    }

    .detailBox {
        width: 320px;
        border: 1px solid #bbb;
        margin: 50px;
    }

    .titleBox {
        background-color: #fdfdfd;
        padding: 10px;
    }

    .titleBox label {
        color: #444;
        margin: 0;
        display: inline-block;
    }

    .commentBox {
        padding: 10px;
        border-top: 1px dotted #bbb;
    }

    .commentBox .form-group:first-child, .actionBox .form-group:first-child {
        width: 80%;
    }

    .commentBox .form-group:nth-child(2), .actionBox .form-group:nth-child(2) {
        width: 18%;
    }

    .actionBox .form-group * {
        width: 100%;
    }

    .taskDescription {
        margin-top: 10px 0;
    }

    .commentList {
        padding: 0;
        list-style: none;
        max-height: 200px;
        overflow: auto;
    }

    .commentList li {
        margin: 0;
        margin-top: 10px;
    }

    .commentList li > div {
        display: table-cell;
    }

    .commenterImage {
        width: 30px;
        margin-right: 5px;
        height: 100%;
        float: left;
    }

    .commenterImage img {
        width: 100%;
        border-radius: 50%;
    }

    .commentText p {
        margin: 0;
    }

    .sub-text {
        color: #aaa;
        font-family: verdana;
        font-size: 11px;
    }

    .actionBox {
        border-top: 1px dotted #bbb;
        padding: 10px;
    }

    html, body {
        background-color: #F0F0F0;
        font-family: Arial, sans-serif;
        min-width: 500px;
    }

    .timeline {
        position: relative;
        display: block;
        background-color: #f00;
        height: 4px;
        margin: 200px 50px;
    }

    .timeline::before, .timeline::after {
        content: "";
        position: absolute;
        top: -8px;
        display: block;
        width: 0;
        height: 0;
        border-radius: 10px;
        border: 10px solid #f00;
    }

    .timeline::before {
        left: -20px;
    }

    .timeline::after {
        right: -10px;
        border: 10px solid transparent;
        border-radius: 30px;
        border-right: 0;
        border-left: 20px solid #f00;
    }

    .timeline li {
        position: relative;
        display: block;
        float: left;
        width: 120px;
        transform: rotate(-45deg);
        top: -65px;
    }

    .timeline li::before {
        content: "";
        position: absolute;
        top: 3px;
        left: -30px;
        border: 3px solid #f00;
        border-radius: 15px;
        width: 10px;
        height: 10px;
        background: #F0F0F0;
    }

    .timeline li span {
        display: none;
        position: absolute;
        top: 40px;
        left: -100px;
        width: 150px;
    }

    .timeline li:hover::before {
        border: 4px solid #0f0;
    }

    .timeline li:hover span {
        display: block;
        transform: rotate(45deg);
    }

    .image-upload > input {
        display: none;
    }

    .image-upload i {
        width: 80px;
        cursor: pointer;
    }


</style>
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
                <li><a href="${baseUrl}/home" id="inicio"><i class="fas fa-home"></i> Inicio</a></li>
                <c:if test="${user.rol.name=='REPRESENTATIVE'}">
                    <li><a href="${baseUrl}/product/"><i class="fab fa-product-hunt"></i>Productos</a></li>
                </c:if>
                <c:if test="${user.rol.name=='ADMIN'}">
                    <li><a href="${baseUrl}/typeProd/"><i class="fas fa-tag"></i> Tipo Productos</a></li>
                </c:if>
                <c:if test="${user.rol.name=='ADMIN'}">
                    <li><a href="${baseUrl}/typeCat/"><i class="fab fa-opencart"></i> Categorias</a></li>
                </c:if>
                <c:if test="${user.rol.name=='ADMIN'}">
                    <li><a href="${baseUrl}/store/"><i class="fas fa-store"></i> Tiendas</a></li>
                </c:if>
                <c:if test="${user.rol.name=='ADMIN'}">
                    <li><a a href="${baseUrl}/report/" id="reportes"><i class="fas fa-chart-bar"></i> Reportes</a></li>
                </c:if>
                <li><a href="${baseUrl}/usuario/show"><i class="fas fa-user"></i> Mi Cuenta</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="row">
    <div class="col-md-12" id="dvShow">
    </div>
</div>

<!-- AdminLTE App -->
