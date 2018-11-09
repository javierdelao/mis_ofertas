<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:25
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


<div class="container">
    <div class="content">
        <h2>Tienda &raquo; Agregar datos</h2>
        <th></th>
        <th></th>
        <th></th>
        <th></th>

        <form class="form-horizontal" action="${urlBase}/store/create" method="POST" >

            <div class="form-group">
                <label class="col-sm-3 control-label">Nombre tienda</label>
                <div class="col-sm-4">
                    <input type="text" name="name" class="form-control" placeholder="Nombre" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Direccion</label>
                <div class="col-sm-4">
                    <input type="text" name="direction" class="form-control" placeholder="Direccion" required>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Comunas</label>
                <div class="col-sm-3">
                    <select name="commune" class="form-control" required>
                        <c:forEach items="${communes}" var="commune">
                            <option value="${commune.id}">${commune.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Ciudad</label>
                <div class="col-sm-3">
                    <select name="city" class="form-control" required>
                        <c:forEach items="${citys}" var="city">
                            <option value="${city.id}">${city.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Pais</label>
                <div class="col-sm-3">
                    <select name="country" class="form-control" required>
                        <c:forEach items="${countrys}" var="country">
                            <option value="${country.id}">${country.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-3 control-label"></label>
                <div class="col-sm-3">
                    <input type="submit" class="btn btn-success">
                </div>
            </div>

        </form>
    </div>
</div>

</body>
</html>
