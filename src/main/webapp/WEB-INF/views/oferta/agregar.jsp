<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<t:cdns title="Home"></t:cdns>
<body>

<t:menu></t:menu>
<style>
    .content {
        margin-top: 80px;
    }
</style>


<div class="container">
    <div class="content">
        <h2>Oferta &raquo; Crear</h2>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <form class="form-horizontal" action="${urlBase}/product/create" method="POST">

            <div class="form-group">
                <label class="col-sm-3 control-label">Nombre producto</label>
                <div class="col-sm-4">
                    <input type="text" name="name" class="form-control" placeholder="Producto" value="${producto.name}"
                           disabled>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Descripción</label>
                <div class="col-sm-4">
                    <input type="text" name="name" class="form-control" placeholder="Producto"
                           value="${producto.description}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Imagen</label>
                <div class="col-sm-4">
                    <img src="${urlBase}/images/${producto.image.path}" style="width:150px; height:auto;"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Descuento</label>
                <div class="col-sm-3">
                    <input type="number" name="cantidad" max="99" class="form-control" required>
                </div>
                <div class="col-sm-1">
                   %
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Fecha de inicio de la oferta</label>
                <div class="col-sm-4">
                    <input type="date" name="fechaInicio" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Fecha de expiracion de la oferta</label>
                <div class="col-sm-4">
                    <input type="date" name="fechaExpiracion" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Cantidad disponible</label>
                <div class="col-sm-4">
                    <input type="number" name="cantidad" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Tipo de oferta</label>
                <div class="col-sm-4">
                    <select class="form-control" name="offerType">
                        <option>Offertype 1</option>
                        <option>Offertype 2</option>
                    </select>
                </div>
            </div>

        </form>
    </div>
</div>

</body>
</html>
