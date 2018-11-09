
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
        <h2>Store &raquo; Detalle de tiendas</h2>
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

</body>
</html>