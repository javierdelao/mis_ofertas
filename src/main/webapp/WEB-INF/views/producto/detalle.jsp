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
    .stars {
        cursor: pointer;

    &:hover {
    .star polygon {
        fill: #ffd055 !important;
    }
    }

    .star {
        float: left;
    }
    .polygon {
        fill: #d8d8d8;
    }





</style>
<script>
    $('.star.rating').click(function(){
        console.log( $(this).parent().data('stars') + ", " + $(this).data('rating'));
        $(this).parent().attr('data-stars', $(this).data('rating'));
    });
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
                <div class="stars" data-stars="1">
                    <svg height="25" width="23" class="star rating" data-rating="1">
                        <polygon points="9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78" style="fill-rule:nonzero;"/>
                    </svg>
                    <svg height="25" width="23" class="star rating" data-rating="2">
                        <polygon points="9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78" style="fill-rule:nonzero;"/>
                    </svg>
                    <svg height="25" width="23" class="star rating" data-rating="3">
                        <polygon points="9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78" style="fill-rule:nonzero;"/>
                    </svg>
                    <svg height="25" width="23" class="star rating" data-rating="4">
                        <polygon points="9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78" style="fill-rule:nonzero;"/>
                    </svg>
                    <svg height="25" width="23" class="star rating" data-rating="5">
                        <polygon points="9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78" style="fill-rule:nonzero;"/>
                    </svg>
                </div>
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
                    <label>Comment Box</label>
                </div>
                <div class="commentBox">

                    <p class="taskDescription">Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry.</p>
                </div>
                <div class="actionBox">
                    <ul class="commentList">
                        <li>
                            <div class="commenterImage">
                                <img src="http://placekitten.com/50/50"/>
                            </div>
                            <div class="commentText">
                                <p class="">Hello this is a test comment.</p> <span
                                    class="date sub-text">on March 5th, 2014</span>

                            </div>
                        </li>
                        <li>
                            <div class="commenterImage">
                                <img src="http://placekitten.com/45/45"/>
                            </div>
                            <div class="commentText">
                                <p class="">Hello this is a test comment and this comment is particularly very long and it
                                    goes on and on and on.</p> <span class="date sub-text">on March 5th, 2014</span>

                            </div>
                        </li>
                        <li>
                            <div class="commenterImage">
                                <img src="http://placekitten.com/40/40"/>
                            </div>
                            <div class="commentText">
                                <p class="">Hello this is a test comment.</p> <span
                                    class="date sub-text">on March 5th, 2014</span>

                            </div>
                        </li>
                    </ul>
                    <form class="form-inline" role="form">
                        <div class="form-group">
                            <input class="form-control" type="text" placeholder="Your comments"/>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-default">Add</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <div class="col-md-8">

            <ol class="timeline">
                <li>2000
                    <span>
      Infos about the year 2000.
    </span>
                </li>
                <li>2001 (test)
                    <span>
      Infos about the year 2001.
    </span>
                </li>
                <li>2002
                    <span>
      Infos about the year 2002.
    </span>
                </li>
                <li>2003
                    <span>
      Infos about the year 2003.
    </span>
                </li>
                <li>2004
                    <span>
      Infos about the year 2004.
    </span>
                </li>
            </ol>

        </div>

    </div>



</div>

</body>
</html>