<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:06
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
        <h2>Usuario &raquo; Agregar datos</h2>
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
                <label class="col-sm-3 control-label">Nombre</label>
                <div class="col-sm-4">
                    <input type="text" name="nombre" class="form-control" placeholder="Nombre" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Apellido</label>
                <div class="col-sm-4">
                    <input type="text" name="apellido" class="form-control" placeholder="Apellido" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Rut</label>
                <div class="col-sm-4">
                    <input type="text" name="rut" class="form-control" placeholder="Rut" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Email</label>
                <div class="col-sm-4">
                    <input type="text" name="email" class="form-control"  placeholder="Email" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Rol</label>
                <div class="col-sm-3">
                    <select name="rol" class="form-control">
                        <option value="">Seleccione Rol</option>
                        <option value="">Administrador</option>
                        <option value="">Cliente</option>
                        <option value="">Encargado Tienda</option>
                    </select>
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Tienda</label>
                <div class="col-sm-3">
                    <select name="tienda" class="form-control">
                        <option value="">Seleccione Tienda</option>
                        <option value="">Ripley SA</option>
                        <option value="">Duoc UC</option>
                        <option value="">Mis ofertas LTDA</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Password</label>
                <div class="col-sm-4">
                    <input type="text" name="password" class="form-control"  placeholder="Password" required>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">&nbsp;</label>
                <div class="col-sm-6">
                    <input id="usuarioS" type="submit" name="add" class="btn btn-sm btn-primary" value="Guardar datos">
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

    $("#usuarioS").click(function(){
        var url = "usuarios/usuarios.html";
        $("#dvShow").load(url);
    });

    $("#cancelar").click(function(){
        var url = "usuarios/usuarios.html";
        $("#dvShow").load(url);
    });
</script>

