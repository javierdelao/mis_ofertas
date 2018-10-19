<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Inicio</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet"
          id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>

    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {
            height: 450px
        }

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }

            .row.content {
                height: auto;
            }
        }

        .mr-3 {
            margin-right: 3%;
        }

        .mb-3 {
            margin-bottom: 3%;
        }
        .mb-1 {
            margin-bottom: 1%;
        }

        .mt-5 {
            margin-top: 5%;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Mis Ofertas</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a id="inicio"><span class="glyphicon glyphicon-log-in"></span> Inicio</a></li>
                <li><a id="productos"><span class="glyphicon glyphicon-log-in"></span> Productos</a></li>
                <li><a id="usuarios"><span class="glyphicon glyphicon-log-in"></span> Usuarios</a></li>
                <li><a id="tiendas"><span class="glyphicon glyphicon-log-in"></span> Tiendas</a></li>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script type="text/javascript">
    var url = "inicio.html";
    $("#dvShow").load(url);
    $("#inicio").click(function () {
        var url = "inicio.html";
        $("#dvShow").load(url);
    });
    $("#productos").click(function () {
        var url = "productos/productos.html";
        $("#dvShow").load(url);
    });
    $("#usuarios").click(function () {
        var url = "usuarios/usuarios.html";
        $("#dvShow").load(url);
    });
    $("#reportes").click(function () {
        var url = "reportes/reportes.html";
        $("#dvShow").load(url);
    });
    $("#mCuenta").click(function () {
        var url = "mCuenta.html";
        $("#dvShow").load(url);
    });
    $("#tiendas").click(function () {
        var url = "tiendas/tiendas.html";
        $("#dvShow").load(url);
    });
</script>

<div class="row">

    <div class="col-md-3 mt-5">
        <t:subMenu></t:subMenu>
    </div>

    <div class="col-md-9 mt-5">
        <c:forEach items="${productList}" var="product">
            <div class="col-md-3 mr-3 mb-3" style="border:solid 1px; height: 40vh;display: block">
                <div class="row">
                    <img src="${urlBase}/images/${product.image.path}" style="width:100%; ">
                </div>
                <br>
                    ${product.name}
                <br>
                    ${product.description}
                <br>
                <span>  <b>Precio: </b>$${product.price}</span>
                <button class="btn-primary mb-1" style="width: 100%;padding: 0px">Para más información haz click aquí</button>
            </div>
        </c:forEach>

    </div>

</div>


</body>
</html>
