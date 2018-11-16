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
        <h2>Productos </h2>
        <form class="form-inline" method="post" action="/product/filter">
            <div class="row" style="margin-left: 2%">

                <div class="form-group">
                    <span>Estado</span><br>
                    <select onchange="form.submit()" name="statusId" class="form-control" value="${status.id}">
                        <option ${status.id==0?'selected="selected"':''}
                                value="0">
                            Todos
                        </option>
                        <c:forEach items="${statuses}" var="status_">
                            <option ${status.id==status_.id?'selected="selected"':''}
                                    value="${status_.id}">
                                    ${status_.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <span>Area</span><br>
                    <select onchange="form.submit()" name="areaId" class="form-control" value="${area.id}">
                        <option ${area.id==0?'selected="selected"':''}
                                value="0">
                            Todos
                        </option>
                        <c:forEach items="${areas}" var="area_">
                            <option ${area.id==area_.id?'selected="selected"':''}
                                    value="${area_.id}">
                                    ${area_.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <span>Tipo de producto</span><br>
                    <select onchange="form.submit()" name="productTypeId" class="form-control" value="${area.id}">
                        <option ${productType.id==0?'selected="selected"':''}
                                value="0">
                            Todos
                        </option>
                        <c:forEach items="${productTypes}" var="productType_">
                            <option ${productType.id==productType_.id?'selected="selected"':''}
                                    value="${productType_.id}">
                                    ${productType_.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <br>
                    <input name="textSearch" value="${textSearch}" type="text" placeholder="Ingrese palabra a buscar">
                    <input type="submit" class="btn btn-sm btn-primary" value="Buscar"></input>
                </div>

            </div>

        </form>
        <br/>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <tr>
                    <th>Ver</th>
                    <th>Descripción</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Fecha Publicación</th>
                    <th>Imagen</th>
                    <th>Oferta activa</th>
                    <th>Editar</th>
                    <th>Eliminar</th>

                </tr>
                <c:if test="${productList.size()==0}">
                    <tr>
                        <td colspan="10">
                            No hay productos que mostrar, por favor modifique los filtros o ingrese productos
                        </td>
                    </tr>
                </c:if>
                <c:forEach items="${productList}" var="product">
                    <tr>
                        <td>
                            <a href="${urlBase}/product/detail/${product.id}" id="detalleT" title="Ver detalle"
                               class="btn btn-primary btn-sm"><span
                                    class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                        </td>
                        <td>
                                ${product.description}
                        </td>


                        <td>
                                ${product.name}
                        </td>
                        <td>
                            <c:if test="${product.offer!=null}">
                                <span style="text-decoration: line-through">$${product.price}</span><br>
                                <span>${product.offer.discount}% Off</span><br>
                                <span>$${product.price-(product.price*(product.offer.discount/100))} </span>
                            </c:if>
                            <c:if test="${product.offer==null}">
                                <span>$${product.price}</span>
                            </c:if>

                        </td>
                        <td>
                                ${product.publicationDate}
                        </td>
                        <td>
                            <img src="${urlBase}/images/${product.image.path}" style="width:150px; height:auto;">
                        </td>
                        <c:if test="${product.offer!=null}">
                            <td>
                                <div id="getting-started-${product.offer.id}"></div>
                                <a href="${urlBase}/offer/${product.offer.id}" title="Editar datos"
                                   class="btn btn-primary btn-sm"><span
                                        class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                <script type="text/javascript">
                                    $("#getting-started-${product.offer.id}")
                                        .countdown("${product.offer.expirationDateString}", function (event) {
                                            $(this).text(
                                                event.strftime('%D days %H:%M:%S')
                                            );
                                        });
                                </script>
                            </td>
                        </c:if>
                        <c:if test="${product.offer==null}">
                            <td>
                                <a href="${urlBase}/offer/create/${product.id}" title="Agregar oferta"
                                   class="btn btn-primary btn-sm"><span
                                        class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
                            </td>
                        </c:if>
                        <td>

                            <a href="${urlBase}/product/edit/${product.id}" id="editarP" title="Editar datos"
                               class="btn btn-primary btn-sm"><span
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
        <a href="${urlBase}/product/create" class="btn btn-sm btn-primary">Agregar producto</a>
    </div>
</div>
<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>

</body>
</html>

