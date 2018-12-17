<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<t:cdns title="Home"></t:cdns>
<body>

<t:menu></t:menu>
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

        var resetValoration = function () {
            $("#valorationNumber").val(${valoration.valoration_star});
            fillstar(${valoration.valoration_star});
        }


        loadStar();


         Highcharts.chart('container', {
             chart: {
                 type: 'column'
             },
             title: {
                 text: 'Visitas últimos 15 días'
             },
             subtitle: {
                 text: 'Source: misofertas.com'
             },
             xAxis: {
                 categories: [

        <c:forEach items="${visitPerDayReports}" var="visitPerDayReport" varStatus="loop">
        '${visitPerDayReport.dateString}'
        <c:if test="${loop.index!=(visitPerDayReports.size()-1)}">
        ,
        </c:if>
        </c:forEach>


                ],
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Visitas (Cantidad)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y} Visita(s)</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: 'Visitas',
                data: [<c:forEach items="${visitPerDayReports}" var="visitPerDayReport" varStatus="loop">
                    ${visitPerDayReport.visitQta}
                    <c:if test="${loop.index!=(visitPerDayReports.size()-1)}">
                    ,
                    </c:if>
                    </c:forEach>]

            }]
        });
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


        var resetValoration = function () {
            $("#valorationNumber").val(${valoration.valoration_star});
            fillstar(${valoration.valoration_star});
        }

</script>


<div class="container">
    <div class="row">
        <h2>Product &raquo; Detalle de producto &raquo; ${product.name}</h2><br>
    </div>
    <div class="row">

        <div class="col-md-4">
            <div class="row">
                <img src="${product.image.path}" style="width:100%; height:100%;">
            </div>
            <div class="row">
                <span>veces visto : ${qtaVisit}</span>
                <div class="stars" style="text-align: center">
                    <form id="valorationForm" action="/product/valoration" method="post">
                        <input type="hidden" id="valorationNumber" name="valorationNumber">
                        <input type="hidden" value="${product.id}" name="productId">
                    </form>
                    <i id="star-1" class="far fa-star fa-2x" onmouseout="resetValoration()" onclick="sendValoration(1)"
                       onmouseover="fillstar(1)"></i>
                    <i id="star-2" class="far fa-star fa-2x" onmouseout="resetValoration()" onclick="sendValoration(2)"
                       onmouseover="fillstar(2)"></i>
                    <i id="star-3" class="far fa-star fa-2x" onmouseout="resetValoration()" onclick="sendValoration(3)"
                       onmouseover="fillstar(3)"></i>
                    <i id="star-4" class="far fa-star fa-2x" onmouseout="resetValoration()" onclick="sendValoration(4)"
                       onmouseover="fillstar(4)"></i>
                    <i id="star-5" class="far fa-star fa-2x" onmouseout="resetValoration()" onclick="sendValoration(5)"
                       onmouseover="fillstar(5)"></i>

                </div>

                </svg>

            </div>
        </div>
        <div class="col-md-8">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <img style="width: 90%" src="${product.user.store.image.path}">
                    </div>
                    <div class="col-md-9">
                        <h3>${product.user.store.name}</h3>
                    </div>
                </div>
                <table class="table">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td>Vendedor</td>
                        <td>${product.user.firstName} ${product.user.lastName} </td>

                    </tr>
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
                                    <img src="${urlBase}/default/${note.systemUser.avatar}"/>
                                </div>
                                <div class="commentText">
                                    <p class="">${note.text}</p>
                                    <p>
                                        <c:forEach items="${note.documents}" var="document">
                                            <a data-toggle="modal" data-target="#myModal${document.id}">
                                                <i class="far fa-file"></i>
                                            </a>
                                        </c:forEach>
                                    </p>

                                    <span class="date sub-text">${note.systemUser.firstName} ${note.systemUser.lastName}</span><br>
                                    <span class="date sub-text">${note.commentDate}</span>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                    <form class="form-inline" role="form" action="/product/comment" method="post"
                          enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-8">
                                <input type="hidden" value="${product.id}" name="productId">
                                <input class="form-control" type="text" name="text" placeholder="Tu comentario"/>
                            </div>
                            <div class="col-md-2">
                                <div class="image-upload">
                                    <label for="file-input">
                                        <i class="fas fa-file"></i> </label>

                                    <input name="images" id="file-input" type="file" multiple="multiple"/>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <input type="submit" class="btn btn-default" value="Comentar"></input>
                                </div>
                            </div>

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
    .modal-backdrop {
        z-index: -100 !important;
    }
</style>

<c:forEach items="${notes}" var="note">
    <c:forEach items="${note.documents}" var="document">
        <!-- Modal -->
        <div id="myModal${document.id}" class="modal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Documento adjunto ${document.path}</h4>
                    </div>
                    <div class="modal-body">
                        <embed src="${document.path}?zoom=50" width="575" height="500">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </c:forEach>
</c:forEach>

<div id="container"></div>


</body>
</html>