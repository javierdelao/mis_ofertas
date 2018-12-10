<%--
  Created by IntelliJ IDEA.
  User: Hikawa
  Date: 23-11-2018
  Time: 1:49
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<html lang="en">
<t:cdns title="Home"></t:cdns>
<body>

<t:menu></t:menu>

<style>
    .content {
        margin-top: 80px;
    }

    .modal-backdrop {
        z-index: -100 !important;
    }

    .radio-img > input {
        display: none;
    }

    .radio-img > img {
        cursor: pointer;
        border: 2px solid transparent;
    }

    .radio-img > input:checked + img {
        border: 2px solid orange;
    }
</style>
<div class="container" id="dvShow">
    <div class="content">
        <h2>Mi Cuenta &raquo; Detalle cuenta</h2>
        <th></th>
        <th></th>
        <th></th>
        <th></th>

        <div class="container">


            <br/>

            <body>

            <div class="container">
                <table class="table">
                    <thead>

                    </thead>
                    <tbody>

                    <tr>
                        <td>Nombre:</td>
                        <td> ${user.firstName}</td>

                    </tr>
                    <tr>
                        <td>Apellido:</td>
                        <td>${user.lastName}</td>
                    </tr>

                    <tr>
                        <td>Rut:</td>
                        <td>${user.rut}</td>
                    </tr>

                    <tr>
                        <td>Correo:</td>
                        <td> ${user.email}</td>

                    </tr>

                    <tr>
                        <td>Contraseña:</td>
                        <td> ${user.password}</td>

                    </tr>

                    <tr>
                        <td>Puntos acumulados:</td>
                        <td> ${user.points} Pts.</td>

                    </tr>
                    <tr>
                        <td>Avatar:</td>
                        <td>
                            <div class="col-md-2">
                                <img style="width: 100%" src="${urlBase}/default/${user.avatar}">
                            </div>
                            <div class="col-md-2">
                                <button data-toggle="modal" data-target="#myModal"
                                        style="text-align: center;margin-top: 33%" class="btn btn-success">Cambiar
                                </button>
                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            </body>


        </div>
    </div>
    <div>
        <a href="${urlBase}/usuario/testCodeBar" class="btn btn-sm btn-primary">Generar Cupon de Descuento</a>
    </div>

    <div>
        AGREGARE UN BLOQUE DONDE SE VEAN IMAGENES DE PRODUCTOS QUE LE PUEDEN INTERESAR, COMO EN EL INDEX
    </div>
</div>
<div id="myModal" class="modal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Escoge un avatar </h4>
            </div>
            <form action="${urlBase}/usuario/avatar" method="post">

                <div class="modal-body">
                    <div class="row" style="padding-top: 5px">
                        <div class="col-md-3">
                            Avatar
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar0.jpg"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar0.jpg">
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar1.png"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar1.png">
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar2.jpg"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar2.jpg">
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar3.jpg"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar3.jpg">
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar4.png"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar4.png">
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar5.png"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar5.png">
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar6.jpg"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar6.jpg">
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar7.jpg"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar7.jpg">
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar8.jpg"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar8.jpg">
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar9.png"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar9.png">
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="radio-img">
                                        <input type="radio" name="avatar" value="avatar10.png"/>
                                        <img style="width: 100%" src="${urlBase}/default/avatar10.png">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <input class="btn btn-success" type="submit" value="Cambiar"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </form>


        </div>

    </div>
</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>

</body>
</html>

