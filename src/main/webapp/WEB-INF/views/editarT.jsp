<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:24
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
        <h2>Tienda &raquo; Editar datos</h2>
        <form class="form-horizontal" action="" method="post">
            <div class="form-group">
                <label class="col-sm-3 control-label">ID</label>
                <div class="col-sm-2">
                    <input type="text" name="id"  class="form-control" placeholder="ID" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Nombre</label>
                <div class="col-sm-4">
                    <input type="text" name="producto" class="form-control" placeholder="Producto" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Ubicacion</label>
                <div class="col-sm-4">
                    <input type="text" name="precio" class="form-control" placeholder="Precio" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">&nbsp;</label>
                <div class="col-sm-6">
                    <input id="tiendaS" type="submit" name="save" class="btn btn-sm btn-primary" value="Guardar datos">
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

    $("#tiendaS").click(function(){
        var url = "tiendas/tiendas.html";
        $("#dvShow").load(url);
    });

    $("#cancelar").click(function(){
        var url = "tiendas/tiendas.html";
        $("#dvShow").load(url);
    });
</script>
