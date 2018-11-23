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
        <h2>Tipos de Productos &raquo; Editar datos</h2>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <form class="form-horizontal" action="${urlBase}/typeProd/edit" method="POST" enctype="multipart/form-data">

            <input type="hidden" name="id" value="${productoTipo.id}">
            <div class="form-group">
                <label class="col-sm-3 control-label">Nombre Tipo Producto</label>
                <div class="col-sm-4">
                    <input type="text" name="name" class="form-control"  placeholder="Categoria" value="${productoTipo.name}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Descripcion</label>
                <div class="col-sm-4">
                    <input type="text" name="description" class="form-control"  placeholder="Descripcion" value="${productoTipo.description}">
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
