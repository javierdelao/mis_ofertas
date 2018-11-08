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
<script>
    $(document).ready(function() {
        //Siempre que salgamos de un campo de texto, se chequeará esta función
        $("#form input").keyup(function() {
            var form = $(this).parents("#form");
            var check = checkCampos(form);
            if(check) {
                $("#user-data-next-button").prop("disabled", false);
            }
            else {
                $("#user-data-next-button").prop("disabled", true);
            }
        });
    });

    //Función para comprobar los campos de texto
    function checkCampos(obj) {
        var camposRellenados = true;
        obj.find("input").each(function() {
            var $this = $(this);
            if( $this.val().length <= 0 ) {
                camposRellenados = false;
                return false;
            }
        });
        if(camposRellenados == false) {
            return false;
        }
        else {
            return true;
        }
    }
</script>

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
                    <input type="text" name="name" class="form-control" placeholder="Producto" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Descripción producto</label>
                <div class="col-sm-4">
                    <input type="text" name="description" class="form-control" placeholder="Producto" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Fecha Expiracioón</label>
                <div class="col-sm-4">
                    <input type="date" name="expirationDate" class="form-control" placeholder="Producto" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">¿Perecible?</label>
                <div class="col-sm-4">
                    <select class="form-control" name="is_perishable" required>
                        <option value="true">Si</option>
                        <option value="false">No</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Precio</label>
                <div class="col-sm-4">
                    <input type="number" name="price" class="form-control" placeholder="Precio" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Categoria</label>
                <div class="col-sm-3">
                    <select name="productType" class="form-control" required>
                        <c:forEach items="${productTypes}" var="productType">
                            <option value="${productType.id}">${productType.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Imagen</label>
                <div class="col-sm-4">
                    <input type="file" name="image" class="form-control" placeholder="Tienda" required>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-3 control-label">Tipo producto</label>
                <div class="col-sm-3">
                    <select name="area" class="form-control" required>
                        <c:forEach items="${areas}" var="area">
                            <option value="${area.id}">${area.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Estado</label>
                <div class="col-sm-3">
                    <select name="status" class="form-control" required>
                        <c:forEach items="${statuses}" var="status">
                            <option value="${status.id}">${status.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label"></label>
                <div class="col-sm-3">
                    <input type="submit" class="btn btn-success" >
                </div>
            </div>

        </form>
    </div>
</div>

</body>
</html>
