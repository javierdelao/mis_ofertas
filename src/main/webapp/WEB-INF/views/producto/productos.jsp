<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:08
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
<div class="container" id="dvShow">
    <div class="content">
        <h2>Productos</h2>
        <form class="form-inline" method="get">
            <div class="form-group">
                <!-- TODO extrar lista real -->
                <select name="filter" class="form-control" onchange="form.submit()">
                    <option value="0">Filtros de datos de empleados</option>
                    <option value="1">Electronica</option>
                    <option value="2">Linea Blanca</option>
                    <option value="3">Comida</option>
                </select>
            </div>
        </form>
        <br/>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <tr>
                    <th>Código</th>
                    <th>Descripción</th>
                    <th>Fecha Expiración</th>
                    <th>Perecible</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Fecha Publicación</th>
                    <th>Categoria</th>
                    <th>Imagen</th>
                    <th>Tipo Producto</th>
                    <th>Estado</th>
                    <th>Usuario</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
                <c:forEach items="${productList}" var="product">
                    <tr>
                        <td>
                                ${product.id}
                        </td>
                        <td>
                                ${product.description}
                        </td>
                        <td>
                            <c:if test="${product.expirationDate==null}">
                                No aplica
                            </c:if>
                            <c:if test="${product.expirationDate!=null}">
                                ${product.expirationDate}
                            </c:if>

                        </td>
                        <td>
                            <c:if test="${product.is_perishable}">
                                Si
                            </c:if>
                            <c:if test="${!product.is_perishable}">
                                No
                            </c:if>

                        </td>
                        <td>
                                ${product.name}
                        </td>
                        <td>
                            $${product.price}
                        </td>
                        <td>
                                ${product.publicationDate}
                        </td>
                        <td>
                                ${product.area.name}
                        </td>
                        <td>
                            <img src="${urlBase}/images/${product.image.path}" style="width:150px; height:auto;">
                        </td>
                        <td>
                                ${product.productType.name}
                        </td>
                        <td>
                                ${product.status.name}
                        </td>
                        <td>
                                ${product.user.firstName} ${product.user.lastName}
                        </td>
                        <td>

                            <a href="${urlBase}/product/edit/${product.id}" id="editarP" title="Editar datos" class="btn btn-primary btn-sm"><span
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
        <a href="${urlBase}/product/create" class="btn btn-sm btn-primary" >Agregar producto</a>
    </div>
</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>

</body>
</html>

