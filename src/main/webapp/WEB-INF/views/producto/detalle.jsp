
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<t:cdns title="Home"></t:cdns>
<t:comment title="cmnt"></t:comment>
<body>

<t:menu></t:menu>
<style>
    .content {
        margin-top: 80px;
    }
</style>


<div class="container">
    <div class="content">
        <h2>Product &raquo; Detalle de producto</h2>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <form class="form-horizontal" action="${urlBase}/product/detail/" method="POST" >

            <br />

            <img src="${urlBase}/images/${product.image.path}" style="width:150px; height:auto;">

            <br />

            <body>

            <div class="container">
                <table class="table">
                    <thead>

                    </thead>
                    <tbody>

                    <tr>
                        <td>Codigo</td>
                        <td>${product.id} </td>

                    </tr>
                    <tr>
                        <td>Descripcion </td>
                        <td> ${product.description}</td>

                    </tr>

                    <tr>
                        <td>Fecha de expiracion </td>
                        <td>     <c:if test="${product.expirationDate==null}">

                        </c:if>
                            <c:if test="${product.expirationDate!=null}">
                                ${product.expirationDate}
                            </c:if>
                        </td>

                    </tr>

                    <tr>
                        <td>Perecible </td>
                        <td> <c:if test="${product.is_perishable}">
                            Si
                        </c:if>
                            <c:if test="${!product.is_perishable}">
                                No
                            </c:if>
                        </td>

                    </tr>

                    <tr>
                        <td>Nombre </td>
                        <td> ${product.name}</td>

                    </tr>
                    <tr>
                        <td>Precio </td>
                        <td> <c:if test="${product.offer!=null}">
                            <span style="text-decoration: line-through">$${product.price}</span><br>
                            <span>${product.offer.discount}% Off</span><br>
                            <span>$${product.price-(product.price*(product.offer.discount/100))} </span>
                        </c:if>
                            <c:if test="${product.offer==null}">
                                <span>$${product.price}</span>
                            </c:if></td>

                    </tr>

                    <tr>
                        <td>Fecha Publicacion </td>
                        <td>    ${product.publicationDate}</td>

                    </tr>

                    <tr>
                        <td>Categoria </td>
                        <td>${product.area.name}</td>

                    </tr>
                    <tr>
                        <td>Tipo de producto </td>
                        <td> ${product.productType.name}</td>

                    </tr>



                    </tbody>
                </table>
            </div>

            </body>

            <h2>Product &raquo; Historial de ofertas</h2>

            <body>

            <div class="container">
                <table class="table">
                    <thead>

                    </thead>
                    <tbody>

                    <tr>
                        <td>Codigo</td>
                        <td> ${product.offer.id} </td>

                    </tr>

                    <tr>
                        <td>Descuento</td>
                        <td>${product.offer.discount} </td>

                    </tr>

                    <tr>
                        <td>Fecha de publicacion</td>
                        <td>${product.offer.publicationDate} </td>

                    </tr>

                    <tr>
                        <td>Fecha de publicacion</td>
                        <td>${product.offer.publicationDate} </td>

                    </tr>
                    <tr>
                        <td>Tipo de oferta</td>
                        <td>${product.offer.offerType.name} </td>

                    </tr>
                    </tbody>
                </table>
            </div>

</body>

            <br />

            <div class="wrapper">
                <div class="commentBoxfloat">
                    <form id="cmnt">
                        <fieldset>
                            <div class="form_grp">
                                <label>Comentarios</label>
                                <textarea id="userCmnt" placeholder="Write your comment here. You can Edit and Delete options. Just Hover in Your comment, you see the both buttons"></textarea>
                            </div>
                            <div class="form_grp">
                                <button type="button" id="submit">Submit</button>
                            </div>
                        </fieldset>
                    </form>
                </div>

                <div id="cmntContr"></div>


            </div>
        </form>
    </div>
</div>

</body>
</html>