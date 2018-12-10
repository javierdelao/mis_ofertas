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
        <h2>Mi Cuenta &raquo; Genera Descuento</h2>
        <th></th>
        <th></th>
        <th></th>
        <th></th>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <tr><font></font>
                    <th colspan="2">Mis Puntos: </th>
                    <th colspan="3" >${usuarioList.points}</th>
                </tr>
                <tr>
                    <th>Puntos</th>
                    <th>Descuento</th>
                    <th>Tope</th>
                    <th>Rubro</th>
                    <th>Generar</th>
                </tr>
                <tr>
                    <td>0 - 100</td>
                    <td>5%</td>
                    <td>100000</td>
                    <td>Alimentos</td>
                    <td>
                        <a href="${urlBase}/usuario/edit" title="Generar Descuento" class="btn btn-primary btn-sm"><span
                                class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                    </td>
                </tr>
                <tr>
                    <td>101 - 500</td>
                    <td>10%</td>
                    <td>150000</td>
                    <td>Alimentos, Electrónica y Línea Blanca</td>
                    <td>
                        <a href="${urlBase}/usuario/edit" title="Generar Descuento" class="btn btn-primary btn-sm"><span
                                class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                    </td>
                </tr>
                <tr>
                    <td>500 - 1000</td>
                    <td>15%</td>
                    <td>300000</td>
                    <td>Alimentos, Electrónica, Línea Blanca y Ropa</td>
                    <td>
                        <a href="${urlBase}/usuario/edit" title="Generar Descuento" class="btn btn-primary btn-sm"><span
                                class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                    </td>
                </tr>

            </table>
        </div>
    </div>

</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>

</body>
</html>

