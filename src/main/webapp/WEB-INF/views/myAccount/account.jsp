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
</style>
<div class="container" id="dvShow">
    <div class="content">
        <h2>Mi Cuenta &raquo; Detalle cuenta</h2>
        <th></th>
        <th></th>
        <th></th>
        <th></th>

        <div class="container">

            <form class="form-horizontal" action="${urlBase}/usuario/detail/" method="POST" >

                <br />

                <body>

                <div class="container">
                    <table class="table">
                        <thead>

                        </thead>
                        <tbody>

                        <tr>
                            <td>Nombre:</td>
                            <td> ${usuarioList.firstName}</td>

                        </tr>
                        <tr>
                            <td>Apellido:</td>
                            <td>${usuarioList.lastName}</td>
                        </tr>

                        <tr>
                            <td>Rut:</td>
                            <td>${usuarioList.rut}</td>
                        </tr>

                        <tr>
                            <td>Correo:</td>
                            <td> ${usuarioList.email}</td>

                        </tr>

                        <tr>
                            <td>Contraseña:</td>
                            <td> ${usuarioList.password}</td>

                        </tr>

                        <tr>
                            <td>Puntos acumulados:</td>
                            <td> X cantidad</td>

                        </tr>

                        </tbody>
                    </table>
                </div>

                </body>

            </form>
        </div>
    </div>
    <div>
        <a href="" class="btn btn-sm btn-primary" >Generar Cupon de Descuento</a>
    </div>

    <div>
        AGREGARE UN BLOQUE DONDE SE VEAN IMAGENES DE PRODUCTOS QUE LE PUEDEN INTERESAR, COMO EN EL INDEX
    </div>
</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>

</body>
</html>

