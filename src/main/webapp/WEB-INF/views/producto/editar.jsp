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
        <h2>Producto &raquo; Agregar datos</h2>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <form class="form-horizontal" action="${urlBase}/product/create" method="POST" enctype="multipart/form-data">

            <div class="form-group">
                <label class="col-sm-3 control-label">Nombre producto</label>
                <div class="col-sm-4">
                    <input type="text" name="name" class="form-control" placeholder="Producto" value="${producto.name}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Descripción producto</label>
                <div class="col-sm-4">
                    <input type="text" name="description" class="form-control" placeholder="Producto" value="${producto.description}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Fecha Expiración</label>
                <div class="col-sm-4">
                    <input type="date" id="expirationDate" name="expirationDate" class="form-control" placeholder="Producto" value="${producto.expirationDateString}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">¿Perecible?</label>
                <div class="col-sm-4">
                    <select class="form-control" name="is_perishable">
                        <option value="true">Si</option>
                        <option value="false">No</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Precio</label>
                <div class="col-sm-4">
                    <input type="number" name="price" class="form-control" placeholder="Precio">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Categoria</label>
                <div class="col-sm-3">
                    <select name="productType" class="form-control">
                        <c:forEach items="${productTypes}" var="productType">
                            <option value="${productType.id}">${productType.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Imagen</label>
                <div class="col-sm-4">
                    <input type="file" name="image" class="form-control" placeholder="Tienda">
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-3 control-label">Tipo producto</label>
                <div class="col-sm-3">
                    <select name="area" class="form-control">
                        <c:forEach items="${areas}" var="area">
                            <option value="${area.id}">${area.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Estado</label>
                <div class="col-sm-3">
                    <select name="status" class="form-control">
                        <c:forEach items="${statuses}" var="status">
                            <option value="${status.id}">${status.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label"></label>
                <div class="col-sm-3">
                    <input type="submit" class="btn btn-success">
                </div>
            </div>

        </form>
    </div>
</div>

</body>
</html>
