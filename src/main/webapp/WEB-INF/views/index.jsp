<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:19
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

<div class="row">

    <div class="col-md-3 mt-5">
        <t:subMenu></t:subMenu>
    </div>

    <div class="col-md-9 mt-5">
        <c:forEach items="${productList}" var="product">
            <div class="col-md-3 mr-3 mb-3" style="border:solid 1px; height: 40vh;display: block">
                <div class="row">
                    <img src="${urlBase}/images/${product.image.path}" style="width:100%; ">
                </div>
                <br>
                    ${product.name}
                <br>
                    ${product.description}
                <br>
                <span>  <b>Precio: </b>$${product.price}</span>
                <button class="btn-primary mb-1" style="width: 100%;padding: 0px">Para más información haz click aquí</button>
            </div>
        </c:forEach>

    </div>

</div>


</body>
</html>
