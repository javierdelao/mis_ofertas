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

    .detailBox {
        width: 320px;
        border: 1px solid #bbb;
        margin: 50px;
    }

    .titleBox {
        background-color: #fdfdfd;
        padding: 10px;
    }

    .titleBox label {
        color: #444;
        margin: 0;
        display: inline-block;
    }

    .commentBox {
        padding: 10px;
        border-top: 1px dotted #bbb;
    }

    .commentBox .form-group:first-child, .actionBox .form-group:first-child {
        width: 80%;
    }

    .commentBox .form-group:nth-child(2), .actionBox .form-group:nth-child(2) {
        width: 18%;
    }

    .actionBox .form-group * {
        width: 100%;
    }

    .taskDescription {
        margin-top: 10px 0;
    }

    .commentList {
        padding: 0;
        list-style: none;
        max-height: 200px;
        overflow: auto;
    }

    .commentList li {
        margin: 0;
        margin-top: 10px;
    }

    .commentList li > div {
        display: table-cell;
    }

    .commenterImage {
        width: 30px;
        margin-right: 5px;
        height: 100%;
        float: left;
    }

    .commenterImage img {
        width: 100%;
        border-radius: 50%;
    }

    .commentText p {
        margin: 0;
    }

    .sub-text {
        color: #aaa;
        font-family: verdana;
        font-size: 11px;
    }

    .actionBox {
        border-top: 1px dotted #bbb;
        padding: 10px;
    }

    html, body {
        background-color: #F0F0F0;
        font-family: Arial, sans-serif;
        min-width: 500px;
    }

    .timeline {
        position: relative;
        display: block;
        background-color: #f00;
        height: 4px;
        margin: 200px 50px;
    }

    .timeline::before, .timeline::after {
        content: "";
        position: absolute;
        top: -8px;
        display: block;
        width: 0;
        height: 0;
        border-radius: 10px;
        border: 10px solid #f00;
    }

    .timeline::before {
        left: -20px;
    }

    .timeline::after {
        right: -10px;
        border: 10px solid transparent;
        border-radius: 30px;
        border-right: 0;
        border-left: 20px solid #f00;
    }

    .timeline li {
        position: relative;
        display: block;
        float: left;
        width: 120px;
        transform: rotate(-45deg);
        top: -65px;
    }

    .timeline li::before {
        content: "";
        position: absolute;
        top: 3px;
        left: -30px;
        border: 3px solid #f00;
        border-radius: 15px;
        width: 10px;
        height: 10px;
        background: #F0F0F0;
    }

    .timeline li span {
        display: none;
        position: absolute;
        top: 40px;
        left: -100px;
        width: 150px;
    }

    .timeline li:hover::before {
        border: 4px solid #0f0;
    }

    .timeline li:hover span {
        display: block;
        transform: rotate(45deg);
    }


</style>
<script>
    $(document).ready(function () {

        var fillstar = function (number) {
            for (var i = 1; i < 6; i++) {
                $("#star-" + i).css("background-color", "white");
            }
            for (var i = 1; i <= number; i++) {
                $("#star-" + i).css("background-color", "yellow");
            }
        }

        var sendValoration = function (valoration) {
            $("#valorationNumber").val(valoration);
            $("#valorationForm").submit();
        }

        var loadStar = function () {
            <c:if test="${valoration!=null}">
            var valoration =${valoration.valoration_star};
            if (valoration) {
                $("#valorationNumber").val(valoration);
                fillstar(valoration);
            }
            </c:if>
        }


        loadStar();
    });

    var fillstar = function (number) {
        for (var i = 1; i < 6; i++) {
            $("#star-" + i).css("background-color", "white");
        }
        for (var i = 1; i <= number; i++) {
            $("#star-" + i).css("background-color", "yellow");
        }
    }

    var sendValoration = function (valoration) {
        $("#valorationNumber").val(valoration);
        $("#valorationForm").submit();
    }

</script>


<div class="container">
    <div class="row">
        <h2>Product &raquo; Detalle de producto &raquo; ${product.name}</h2><br>
    </div>
    <div class="row">

        <div class="col-md-4">
            <div class="row">
                <img src="${urlBase}/images/${product.image.path}" style="width:100%; height:100%;">
            </div>
            <div class="row">
                <div class="stars" style="text-align: center">
                    <form id="valorationForm" action="/product/valoration" method="post">
                        <input type="hidden" id="valorationNumber" name="valorationNumber">
                        <input type="hidden" value="${product.id}" name="productId">
                    </form>
                    <i id="star-1" class="far fa-star fa-2x" onclick="sendValoration(1)" onmouseover="fillstar(1)"></i>
                    <i id="star-2" class="far fa-star fa-2x" onclick="sendValoration(2)" onmouseover="fillstar(2)"></i>
                    <i id="star-3" class="far fa-star fa-2x" onclick="sendValoration(3)" onmouseover="fillstar(3)"></i>
                    <i id="star-4" class="far fa-star fa-2x" onclick="sendValoration(4)" onmouseover="fillstar(4)"></i>
                    <i id="star-5" class="far fa-star fa-2x" onclick="sendValoration(5)" onmouseover="fillstar(5)"></i>

                </div>

                </svg>

            </div>
        </div>
        <div class="col-md-8">
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
                        <td>Descripcion</td>
                        <td> ${product.description}</td>

                    </tr>

                    <tr>
                        <td>Fecha de expiracion</td>
                        <td><c:if test="${product.expirationDate==null}">

                        </c:if>
                            <c:if test="${product.expirationDate!=null}">
                                ${product.expirationDate}
                            </c:if>
                        </td>

                    </tr>

                    <tr>
                        <td>Perecible</td>
                        <td><c:if test="${product.is_perishable}">
                            Si
                        </c:if>
                            <c:if test="${!product.is_perishable}">
                                No
                            </c:if>
                        </td>

                    </tr>

                    <tr>
                        <td>Nombre</td>
                        <td> ${product.name}</td>

                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td><c:if test="${product.offer!=null}">
                            <span style="text-decoration: line-through">$${product.price}</span><br>
                            <span>${product.offer.discount}% Off</span><br>
                            <span>$${product.price-(product.price*(product.offer.discount/100))} </span>
                        </c:if>
                            <c:if test="${product.offer==null}">
                                <span>$${product.price}</span>
                            </c:if></td>

                    </tr>

                    <tr>
                        <td>Fecha Publicacion</td>
                        <td> ${product.publicationDate}</td>

                    </tr>

                    <tr>
                        <td>Categoria</td>
                        <td>${product.area.name}</td>

                    </tr>
                    <tr>
                        <td>Tipo de producto</td>
                        <td> ${product.productType.name}</td>

                    </tr>


                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="row">


    </div>

    <div class="row">

        <div class="col-md-4">

            <div class="detailBox">
                <div class="titleBox">
                    <label>Comentarios</label>
                </div>
                <div class="commentBox">

                    <p class="taskDescription">Aquí puedes ingresar los comentarios de tu experiencia con el
                        producto</p>
                </div>
                <div class="actionBox">
                    <ul class="commentList">
                        <c:forEach items="${notes}" var="note">
                            <li>
                                <div class="commenterImage">
                                    <img src="${urlBase}/default/h.jpg"/>
                                </div>
                                <div class="commentText">
                                    <p class="">${note.text}</p>
                                    <p><a data-toggle="modal" data-target="#myModal">
                                        <i class="far fa-file"></i>
                                    </a></p>
                                    <span class="date sub-text">${note.systemUser.firstName} ${note.systemUser.lastName}</span><br>
                                    <span class="date sub-text">${note.commentDate}</span>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                    <form class="form-inline" role="form" action="/product/comment" method="post">
                        <div class="form-group">
                            <input type="hidden" value="${product.id}" name="productId">
                            <input class="form-control" type="text" name="text" placeholder="Tu comentario"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-default" value="Comentar"></input>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <div class="col-md-8">

            <ol class="timeline">
                <c:forEach items="${offerHistory}" var="offer">
                    <li>${offer.publicationDateString}
                        <span>
                            Del ${offer.publicationDateString} <br>
                                Hasta ${offer.expirationDateString}<br>
      ${offer.discount}% de descuento
    </span>
                    </li>
                </c:forEach>

            </ol>

        </div>

    </div>


</div>
<style>
    .modal-backdrop{
        z-index:-100 !important;
    }
</style>

<!-- Modal -->
<div id="myModal" class="modal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Documento adjunto</h4>
            </div>
            <div class="modal-body">
                <embed src="${urlBase}/documents/bd.pdf?zoom=50" width="575" height="500">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

</body>
</html>