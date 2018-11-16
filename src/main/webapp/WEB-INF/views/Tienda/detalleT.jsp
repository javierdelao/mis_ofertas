
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


<div class="container">
    <div class="content">
        <h2>Store &raquo; ${store.name} </h2>            <img src="${urlBase}/images/${store.image.path}" style="width:150px; height:auto;">

        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <form class="form-horizontal" action="${urlBase}/store/detail/" method="POST" >

            <br />

            <body>

            <div class="container">
                <table class="table">
                    <thead>

                    </thead>
                    <tbody>

                    <tr>
                        <td>Codigo</td>
                        <td> ${store.id}</td>

                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td> ${store.name}</td>

                    </tr>
                    <tr>
                        <td>Direccion</td>
                        <td>${store.direction}</td>

                    </tr>
                    <tr>
                        <td>Comuna</td>
                        <td>${store.commune.name}</td>

                    </tr>

                    <tr>
                        <td>Ciudad</td>
                        <td> ${store.commune.city.name}</td>

                    </tr>

                    <tr>
                        <td>Pais</td>
                        <td> ${store.commune.city.country.name}</td>

                    </tr>
                    </tbody>
                </table>
            </div>

            </body>

        </form>
    </div>
</div>


<div class="container">
    <div class="content">
<h2>Store &raquo; Productos publicados</h2>
<br />
<div class="table-responsive">
    <table class="table table-striped table-hover">
        <tr>
            <th>Producto</th>
            <th>Run Usuario</th>
            <th>Nombre Usuario</th>
            <th>Apellido Usuario</th>
            <c:forEach items="${productList}" var="product">
        </tr>

            <tr>
                <td>
                        ${product.name}

                </td>

                <td>
                        ${product.user.rut}

                </td>
                <td>
                        ${product.user.firstName}

                </td>
                <td>
                        ${product.user.lastName}

                </td>



            </tr>
        </c:forEach>

    </table>
</div>
</div>
</div>
</div>



</body>
</html>