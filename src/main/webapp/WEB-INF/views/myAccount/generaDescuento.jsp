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
                    <th colspan="2">Mis Puntos:</th>
                    <th colspan="3">${usuario.points}</th>
                </tr>
                <tr>
                    <th>Puntos</th>
                    <th>Descuento</th>
                    <th>Tope</th>
                    <th>Generar</th>
                </tr>
                <tr>
                    <td>100</td>
                    <td>5%</td>
                    <td>100000</td>
                    <td>
                        <c:if test="${usuario.points>=100}">
                            <a href="${urlBase}/usuario/discount/generate/1" title="Generar Descuento"
                               class="btn btn-primary btn-sm"><i class="fas fa-barcode"></i></a>
                        </c:if>
                        <c:if test="${usuario.points<100}">
                            <a data-toggle="tooltip" title="No tienes los puntos suficientes">
                                <button disabled
                                        class="btn btn-primary btn-sm">
                                    <i class="fas fa-barcode"></i>
                                </button>
                            </a>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>500</td>
                    <td>10%</td>
                    <td>150000</td>
                    <td>
                        <c:if test="${usuario.points>=500}">
                            <a href="${urlBase}/usuario/discount/generate/2" title="Generar Descuento"
                               class="btn btn-primary btn-sm"><i class="fas fa-barcode"></i></a>
                        </c:if>
                        <c:if test="${usuario.points<500}">
                            <a data-toggle="tooltip" title="No tienes los puntos suficientes">
                                <button disabled
                                        class="btn btn-primary btn-sm">
                                    <i class="fas fa-barcode"></i>
                                </button>
                            </a>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>1000</td>
                    <td>15%</td>
                    <td>300000</td>
                    <td>
                        <c:if test="${usuario.points>=1000}">
                            <a href="${urlBase}/usuario/discount/generate/3" title="Generar Descuento" class="btn btn-primary btn-sm">
                                <i class="fas fa-barcode"></i>
                            </a>
                        </c:if>
                        <c:if test="${usuario.points<1000}">
                            <a data-toggle="tooltip" title="No tienes los puntos suficientes">
                                <button disabled
                                        class="btn btn-primary btn-sm">
                                    <i class="fas fa-barcode"></i>
                                </button>
                            </a>
                        </c:if>
                    </td>
                </tr>

            </table>
        </div>
    </div>
    <div class="row">
        <div class="table-responsive">
            <table  class="table table-striped table-hover">
                <thead>
                <th>Porcentaje descuento</th>
                <th>Fecha Creación</th>
                <th>Fecha Expiración</th>
                <th>Estado</th>
                <th>Codigo de barra</th>


                </thead>
                <tbody>
                <c:forEach items="${discounts}" var="discount">
                    <tr>
                        <td>${discount.percentage}%</td>
                        <td>${discount.formatCreationDate}</td>
                        <td>${discount.formatExpirationDate}</td>
                        <td>${discount.usedString}</td>
                        <td><img src="${discount.path}" /></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>

</body>
</html>

