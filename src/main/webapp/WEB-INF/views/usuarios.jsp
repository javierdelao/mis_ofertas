<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .content {
        margin-top: 80px;
    }
</style>
<div class="container" id="dvShow">
    <div class="content">
        <h2>Usuarios</h2>
        <form class="form-inline" method="get">
            <div class="form-group">
                <select name="filter" class="form-control" onchange="form.submit()">
                    <option value="0">Filtro Usuarios</option>
                    <option value="1">Administrador</option>
                    <option value="2">Cliente</option>
                    <option value="3">Encargado Tienda</option>
                </select>
            </div>
        </form>
        </br>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Rut</th>
                    <th>Email</th>
                    <th>Rol</th>
                    <th>Tienda</th>
                    <th>Password</th>>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
                <tr>
                    <td>
                        1
                    </td>
                    <td>
                        Carlos
                    </td>
                    <td>
                        Urbano
                    </td>
                    <td>
                        Rut
                    </td>
                    <td>
                        caurbano@alumnos.duoc.cl
                    </td>
                    <td>
                        Administrador
                    </td>
                    <td>
                        Nombre_tienda
                    </td>
                    <td>
                        Password
                    </td>
                    <td>

                        <a id="editarU" title="Editar datos" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                    </td>
                    <td>
                        <a href="index.php?aksi=delete&nik='.$row['codigo'].'" title="Eliminar" onclick="return confirm" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>
        <input id="agregarU" type="submit" name="agregar" class="btn btn-sm btn-primary" value="Registrar Usuario">
    </div>
</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

    $("#editarU").click(function(){
        var url = "usuarios/editarU.html";
        $("#dvShow").load(url);
    });
    $("#agregarU").click(function(){
        var url = "usuarios/agregarU.html";
        $("#dvShow").load(url);
    });
</script>



