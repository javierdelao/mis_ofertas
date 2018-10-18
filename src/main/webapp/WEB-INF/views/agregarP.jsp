<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <form class="form-horizontal" action="" method="post">
            <div class="form-group">
                <label class="col-sm-3 control-label">ID</label>
                <div class="col-sm-2">
                    <input type="text" name="id" class="form-control" placeholder="ID" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Producto</label>
                <div class="col-sm-4">
                    <input type="text" name="producto" class="form-control" placeholder="Producto" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Precio</label>
                <div class="col-sm-4">
                    <input type="text" name="precio" class="form-control" placeholder="Precio" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Tienda</label>
                <div class="col-sm-4">
                    <input type="text" name="tienda" class="form-control" placeholder="Tienda" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Categoria</label>
                <div class="col-sm-3">
                    <select name="estado" class="form-control">
                        <option value="">Selecciona estado</option>
                        <option value="">Electronica</option>
                        <option value="">Linea Blanca</option>
                        <option value="">Comida</option>
                    </select>
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">&nbsp;</label>
                <div class="col-sm-6">
                    <input id="productoS" type="submit" name="add" class="btn btn-sm btn-primary" value="Guardar datos">
                    <a id="cancelar" class="btn btn-sm btn-danger">Cancelar</a>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">

    $("#productoS").click(function(){
        var url = "productos/productos.html";
        $("#dvShow").load(url);
    });

    $("#cancelar").click(function(){
        var url = "productos/productos.html";
        $("#dvShow").load(url);
    });
</script>
