<%--
  Created by IntelliJ IDEA.
  User: javierdelao
  Date: 04-05-18
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="row" style="padding-top: 15%;">
    <div class="col-md-offset-4 col-md-4" style="margin-top:15px;border:3px solid grey">
        <br>
        <form action="/login" METHOD="POST">
        <div class="row">
            <div class="col-md-4"><h4>Rut</h4></div>
            <div class="col-md-8"><input type="text" class="form-control" name="rut"></div>
        </div>
        <div class="row">
            <div class="col-md-4"><h4>Contraseña</h4></div>
            <div class="col-md-8"><input type="password" class="form-control" name="password"></div>
        </div>
        <div class="row">
            <div class="col-md-4"><h4></h4></div>
            <div class="col-md-4"><input type="submit" class="btn btn-default" value="Ingresar"></div>
            <div class="col-md-4"><a class="btn btn-default" data-toggle="modal" data-target="#myModal">Registrarse</a></div>
        </div>
        </form>
        <c:if test="${error}">
            <span style="color: red">Credenciales invalidas</span>
        </c:if>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">

    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <form id="registerForm" METHOD="POST" action="/register">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Registro</h4>
            </div>
            <div class="modal-body">
               <div class="row">
                   <div class="col-md-3">Rut</div>
                   <div class="col-md-8"><input class="form-control" type="text" name="rut" id="registerRut"  required></div>
               </div>
                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Nombre</div>
                    <div class="col-md-8"><input id="registerNombre" class="form-control" name="firstName"  type="text"  required></div>
                </div>
                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Apellido paterno</div>
                    <div class="col-md-8"><input id="registerApP" class="form-control" name="lastName"  type="text" required></div>
                </div>

                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Contraseña</div>
                    <div class="col-md-8"><input class="form-control" id="pass1" name="password" type="password" required></div>
                </div>
                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Repita Contraseña</div>
                    <div class="col-md-8"><input class="form-control" id="pass2" name="passwordConf" type="password" required></div>
                </div>

                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Correo electronico</div>
                    <div class="col-md-8"><input class="form-control" id="email" name="email" type="email" required></div>
                </div>

            </div>
            <div class="modal-footer">
                <input type="submit" class="btn btn-default" value="Registrarse" >
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
            </form>
        </div>

    </div>
</div>

</body>
</html>
