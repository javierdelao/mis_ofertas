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
        <h2>Tiendas</h2>
        <form class="form-inline" method="post" action="/store/filter">
            <div class="form-group">
                <span>Comuna</span><br>
                <select onchange="form.submit()" name="communeId" class="form-control" value="${commune.id}">
                    <option ${commune.id==0?'selected="selected"':''}
                            value="0">
                        Todos
                    </option>
                    <c:forEach items="${communes}" var="commune_">
                        <option ${commune.id==commune_.id?'selected="selected"':''}
                                value="${commune_.id}">
                                ${commune_.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <br>
                <input name="textSearch" value="${textSearch}" type="text" placeholder="Ingrese palabra a buscar">
                <input type="submit" class="btn btn-sm btn-primary" value="Buscar"></input>
            </div>

        </form>
        <br/>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Direccion</th>
                    <th>Comuna</th>
                    <th>Ciudad</th>
                    <th>Pais</th>
                    <th>Detalle</th>
                    <th>Editar</th>
                </tr>
                <c:forEach items="${storeList}" var="store">
                    <tr>
                        <td>
                                ${store.id}


                        </td>


                        <td>
                                ${store.name}
                        </td>
                        <td>
                                ${store.direction}
                        </td>
                        <td>
                                ${store.commune.name}
                        </td>

                        <td>
                                ${store.commune.city.name}
                        </td>

                        <td>
                                ${store.commune.city.country.name}
                        </td>

                        <td>

                            <a href="${urlBase}/store/detail/${store.id}" id="detalleT" title="Ver detalle"
                               class="btn btn-primary btn-sm"><span
                                    class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                        </td>

                        <td>

                            <a href="${urlBase}/store/edit/${store.id}" id="editarT" title="Editar datos"
                               class="btn btn-primary btn-sm"><span
                                    class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
    <div>
        <a href="${urlBase}/store/create" class="btn btn-sm btn-primary">Agregar tienda</a>
    </div>


</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>

</body>
</html>

