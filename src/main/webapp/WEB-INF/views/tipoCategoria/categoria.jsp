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
        <h2>Categorias</h2>
        <form class="form-inline" method="post" action="/typeCat/filter">
            <div class="form-group">
                <br>
                <input name="textSearch" value="${textSearch}" type="text" placeholder="Ingrese palabra a buscar">
                <input type="submit" class="btn btn-sm btn-primary" value="Buscar"></input>
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

                </tr>
                <c:forEach items="${areas}" var="areas">
                    <tr>
                        <td>
                                ${areas.id}
                        </td>
                        <td>
                                ${areas.name}
                        </td>
                        <td>
                                ${areas.description}
                        </td>
                        <td>

                            <a href="${urlBase}/typeCat/edit/${areas.id}" id="editarCat" title="Editar datos" class="btn btn-primary btn-sm"><span
                                    class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                        </td>

                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
    <div>
        <a href="${urlBase}/typeCat/create" class="btn btn-sm btn-primary" >Agregar categoria</a>
    </div>
</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>

</body>
</html>

