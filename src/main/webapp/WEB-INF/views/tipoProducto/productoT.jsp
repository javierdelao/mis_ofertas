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
        <h2>Tipos de Productos</h2>
        <form class="form-inline" method="get">
            <div class="form-group">
                <input type="text" placeholder="Categoria">
                <a class="btn btn-sm btn-primary" >Buscar</a>
            </div>
        </form>
        <br />
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
                <c:forEach items="${productTypes}" var="productTypes">
                    <tr>
                        <td>
                                ${productTypes.id}
                        </td>
                        <td>
                                ${productTypes.name}
                        </td>
                        <td>
                                ${productTypes.description}
                        </td>
                        <td>

                            <a href="${urlBase}/typeProd/edit/${productTypes.id}" id="editarT" title="Editar datos" class="btn btn-primary btn-sm"><span
                                    class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                        </td>
                        <td>
                            <a href="index.php?aksi=delete&nik='.$row['codigo'].'" title="Eliminar"
                               onclick="return confirm"
                               class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"
                                                                   aria-hidden="true"></span></a>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
    <div>
        <a href="${urlBase}/typeProd/create" class="btn btn-sm btn-primary" >Agregar categoria</a>
    </div>
</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>

</body>
</html>

