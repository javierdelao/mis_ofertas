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
<style>
    /* Generals resets and unimportant stuff */
    * { margin: 0px; padding: 0px; }
    body {
        background: #eaebec;
        font-family: "Open Sans", sans-serif;
    }
    #view-code{
        color:#48cfad;
        font-size:14px;
        text-transform:uppercase;
        font-weight:700;
        text-decoration:none;
        position:absolute;top:640px; left:50%;margin-left:-35px;
    }
    #view-code:hover{color:#34c29e;}

    /* --- Product Card ---- */
    #make-3D-space{
        position: relative;
        perspective: 800px;
        width:340px;
        height:500px;
        transform-style: preserve-3d;
        transition: transform 5s;
        position:absolute;
        top:80px;
        left:50%;
        margin-left:-167px;
    }



    .stats-container{
        background:#fff;
        position:absolute;
        top:386px;
        left:0;
        width:265px;
        height:300px;
        padding:27px 35px 35px;
        -webkit-transition: all 200ms ease-out;
        -moz-transition: all 200ms ease-out;
        -o-transition: all 200ms ease-out;
        transition: all 200ms ease-out;
    }

    .stats-container .product_name{
        font-size:22px;
        color:#393c45;
    }
    .stats-container p{
        font-size:16px;
        color:#b1b1b3;
        padding:2px 0 20px 0;
    }
    .stats-container .product_price{
        float:right;
        color:#48cfad;
        font-size:22px;
        font-weight:600;
    }
    .image_overlay{
        position:absolute;
        top:0;
        left:0;
        width:100%;
        height:100%;
        background: black;
        opacity:0;
    }

    .product-options{
        padding:2px 0 0;
    }
    .product-options strong{
        font-weight:700;
        color:#393c45;
        font-size:14px;
    }
    .product-options span{
        color:#969699;
        font-size:14px;
        display:block;
        margin-bottom:8px;
    }
    #view_details{
        position:absolute;
        top:112px;
        left:50%;
        margin-left:-85px;
        border:2px solid #fff;
        color:#fff;
        background:#4CAF50;
        font-size:19px;
        text-align:center;
        text-transform:uppercase;
        font-weight:700;
        padding:10px 0;
        width:172px;
        opacity:0;
        -webkit-transition: all 200ms ease-out;
        -moz-transition: all 200ms ease-out;
        -o-transition: all 200ms ease-out;
        transition: all 200ms ease-out;
    }
    #view_details:hover{
        background:#fff;
        color: #4CAF50;
        cursor:pointer;

    }


    div.shadow{
        width:335px;height:520px;
        opacity:0;
        position:absolute;
        top:0;
        left:0;
        z-index:3;
        display:none;
        background: -webkit-linear-gradient(left,rgba(0,0,0,0.1),rgba(0,0,0,0.2));
        background: -o-linear-gradient(right,rgba(0,0,0,0.1),rgba(0,0,0,0.2));
        background: -moz-linear-gradient(right,rgba(0,0,0,0.1),rgba(0,0,0,0.2));
        background: linear-gradient(to right, rgba(0,0,0,0.1), rgba(0,0,0,0.2));
    }
<c:forEach items="${customProductList.customProductListItems}" var="customProductListItem">
    <c:forEach items="${customProductListItem.products}" var="product">
    #product-front${product.id}, #product-back${product.id}{
        width:335px;
        height:500px;
        background:#fff;
        position:absolute;
        left:-5px;
        top:-5px;
        -webkit-transition: all 100ms ease-out;
        -moz-transition: all 100ms ease-out;
        -o-transition: all 100ms ease-out;
        transition: all 100ms ease-out;
    }


    #product-back${product.id}{
        display:none;
        transform: rotateY( 180deg );
    }
    #product-card.animate #product-back${product.id}, #product-card.animate #product-front${product.id}{
        top:0px;
        left:0px;
        -webkit-transition: all 100ms ease-out;
        -moz-transition: all 100ms ease-out;
        -o-transition: all 100ms ease-out;
        transition: all 100ms ease-out;
    }

    #product-card${product.id}{
        width:325px;
        height:490px;
        position:absolute;
        top:10px;
        left:10px;
        overflow:hidden;
        transform-style: preserve-3d;
        -webkit-transition:  100ms ease-out;
        -moz-transition:  100ms ease-out;
        -o-transition:  100ms ease-out;
        transition:  100ms ease-out;
    }
    div#product-card${product.id}.flip-10{
        -webkit-transform: rotateY( -10deg );
        -moz-transform: rotateY( -10deg );
        -o-transform: rotateY( -10deg );
        transform: rotateY( -10deg );
        transition:  50ms ease-out;
    }
    div#product-card${product.id}.flip90{
        -webkit-transform: rotateY( 90deg );
        -moz-transform: rotateY( 90deg );
        -o-transform: rotateY( 90deg );
        transform: rotateY( 90deg );
        transition:  100ms ease-in;
    }
    div#product-card${product.id}.flip190{
        -webkit-transform: rotateY( 190deg );
        -moz-transform: rotateY( 190deg );
        -o-transform: rotateY( 190deg );
        transform: rotateY( 190deg );
        transition:  100ms ease-out;
    }

    #product-back${product.id} div.shadow{
        z-index:10;
        opacity:1;
        background: -webkit-linear-gradient(left,rgba(0,0,0,0.2),rgba(0,0,0,0.1));
        background: -o-linear-gradient(right,rgba(0,0,0,0.2),rgba(0,0,0,0.1));
        background: -moz-linear-gradient(right,rgba(0,0,0,0.2),rgba(0,0,0,0.1));
        background: linear-gradient(to right, rgba(0,0,0,0.2), rgba(0,0,0,0.1));
    }

    #product-card${product.id}.animate #view_details{
        opacity:1;
        width:152px;
        font-size:15px;
        margin-left:-75px;
        top:115px;
        -webkit-transition: all 200ms ease-out;
        -moz-transition: all 200ms ease-out;
        -o-transition: all 200ms ease-out;
        transition: all 200ms ease-out;
    }

    #product-card${product.id}.animate .image_overlay{
        opacity:0.7;
        -webkit-transition: all 200ms ease-out;
        -moz-transition: all 200ms ease-out;
        -o-transition: all 200ms ease-out;
        transition: all 50ms ease-out;
    }

    #product-card${product.id}.animate .stats-container{
        top:272px;
        -webkit-transition: all 200ms ease-out;
        -moz-transition: all 200ms ease-out;
        -o-transition: all 200ms ease-out;
        transition: all 200ms ease-out;
    }

    div#product-card${product.id}.flip180{
        -webkit-transform: rotateY( 180deg );
        -moz-transform: rotateY( 180deg );
        -o-transform: rotateY( 180deg );
        transform: rotateY( 180deg );
        transition:  150ms ease-out;
    }
    #product-card${product.id}.animate{
        top:5px;
        left:5px;
        width:335px;
        height:500px;
        box-shadow:0px 13px 21px -5px rgba(0, 0, 0, 0.3);
        -webkit-transition:  100ms ease-out;
        -moz-transition:  100ms ease-out;
        -o-transition:  100ms ease-out;
        transition:  100ms ease-out;
    }

    </c:forEach>
    </c:forEach>

    #flip-back{
        position:absolute;
        top:20px;
        right:20px;
        width:30px;
        height:30px;
        cursor:pointer;
    }
    #cx, #cy{
        background:#d2d5dc;
        position:absolute;
        width:0px;
        top:15px;
        right:15px;
        height:3px;
        -webkit-transition: all 250ms ease-in-out;
        -moz-transition: all 250ms ease-in-out;
        -ms-transition: all 250ms ease-in-out;
        -o-transition: all 250ms ease-in-out;
        transition: all 250ms ease-in-out;
    }
    #flip-back:hover #cx, #flip-back:hover #cy{
        background:#979ca7;
        -webkit-transition: all 250ms ease-in-out;
        -moz-transition: all 250ms ease-in-out;
        -ms-transition: all 250ms ease-in-out;
        -o-transition: all 250ms ease-in-out;
        transition: all 250ms ease-in-out;
    }
    #cx.s1, #cy.s1{
        right:0;
        width:30px;
        -webkit-transition: all 100ms ease-out;
        -moz-transition: all 100ms ease-out;
        -ms-transition: all 100ms ease-out;
        -o-transition: all 100ms ease-out;
        transition: all 100ms ease-out;
    }
    #cy.s2{
        -ms-transform: rotate(50deg);
        -webkit-transform: rotate(50deg);
        transform: rotate(50deg);
        -webkit-transition: all 100ms ease-out;
        -moz-transition: all 100ms ease-out;
        -ms-transition: all 100ms ease-out;
        -o-transition: all 100ms ease-out;
        transition: all 100ms ease-out;
    }
    #cy.s3{
        -ms-transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg);
        -webkit-transition: all 100ms ease-out;
        -moz-transition: all 100ms ease-out;
        -ms-transition: all 100ms ease-out;
        -o-transition: all 100ms ease-out;
        transition: all 100ms ease-out;
    }
    #cx.s1{
        right:0;
        width:30px;
        -webkit-transition: all 100ms ease-out;
        -moz-transition: all 100ms ease-out;
        -ms-transition: all 100ms ease-out;
        -o-transition: all 100ms ease-out;
        transition: all 100ms ease-out;
    }
    #cx.s2{
        -ms-transform: rotate(140deg);
        -webkit-transform: rotate(140deg);
        transform: rotate(140deg);
        -webkit-transition: all 100ms ease-out;
        -moz-transition: all 100ms ease-out;
        -ms-transition: all 100ease-out;
        -o-transition: all 100ms ease-out;
        transition: all 100ms ease-out;
    }
    #cx.s3{
        -ms-transform: rotate(135deg);
        -webkit-transform: rotate(135deg);
        transform: rotate(135deg);
        -moz-transition: all 100ms ease-out;
        -ms-transition: all 100ms ease-out;
        -o-transition: all 100ms ease-out;
        transition: all 100ms ease-out;
    }
    #carousel{
        width:335px;
        height:500px;
        overflow:hidden;
        position:relative;

    }
    #carousel ul{
        position:absolute;
        top:0;
        left:0;
    }
    #carousel li{
        width:335px;
        height:500px;
        float:left;
        overflow:hidden;
    }
    .arrows-perspective{
        width:335px;
        height:55px;
        position: absolute;
        top: 218px;
        transform-style: preserve-3d;
        transition: transform 5s;
        perspective: 335px;
    }
    .carouselPrev, .carouselNext{
        width: 50px;
        height: 55px;
        background: #ccc;
        position: absolute;
        top:0;
        transition: all 200ms ease-out;
        opacity:0.9;
        cursor:pointer;
    }
    .carouselNext{
        top:0;
        right: -26px;
        -webkit-transform: rotateY( -117deg );
        -moz-transform: rotateY( -117deg );
        -o-transform: rotateY( -117deg );
        transform: rotateY( -117deg );
        transition: all 200ms ease-out;

    }
    .carouselNext.visible{
        right:0;
        opacity:0.8;
        background: #efefef;
        -webkit-transform: rotateY( 0deg );
        -moz-transform: rotateY( 0deg );
        -o-transform: rotateY( 0deg );
        transform: rotateY( 0deg );
        transition: all 200ms ease-out;
    }
    .carouselPrev{
        left:-26px;
        top:0;
        -webkit-transform: rotateY( 117deg );
        -moz-transform: rotateY( 117deg );
        -o-transform: rotateY( 117deg );
        transform: rotateY( 117deg );
        transition: all 200ms ease-out;

    }
    .carouselPrev.visible{
        left:0;
        opacity:0.8;
        background: #eee;
        -webkit-transform: rotateY( 0deg );
        -moz-transform: rotateY( 0deg );
        -o-transform: rotateY( 0deg );
        transform: rotateY( 0deg );
        transition: all 200ms ease-out;
    }
    #carousel .x, #carousel .y{
        height:2px;
        width:15px;
        background:#48cfad;
        position:absolute;
        top:31px;
        left:17px;
        -ms-transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg);
    }
    #carousel .x{
        -ms-transform: rotate(135deg);
        -webkit-transform: rotate(135deg);
        transform: rotate(135deg);
        top:21px;
    }
    #carousel .carouselNext .x{
        -ms-transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg);
    }
    #carousel .carouselNext .y{
        -ms-transform: rotate(135deg);
        -webkit-transform: rotate(135deg);
        transform: rotate(135deg);
    }
</style>

<Script>

    $(document).ready(function(){



        <c:forEach items="${customProductList.customProductListItems}" var="customProductListItem">
            <c:forEach items="${customProductListItem.products}" var="product">

        // Lift card and show stats on Mouseover
        $('#product-card${product.id}').hover(function(){
            $(this).addClass('animate');
            $('div.carouselNext, div.carouselPrev').addClass('visible');
        }, function(){
            $(this).removeClass('animate');
            $('div.carouselNext, div.carouselPrev').removeClass('visible');
        });

        // Flip card to the back side
        $('#view_details').click(function(){
            $('#product-card${product.id}').addClass('flip-10');
            setTimeout(function(){
                $('#product-card${product.id}').removeClass('flip-10').addClass('flip90').find('div.shadow').show().fadeTo( 80 , 1, function(){
                    $('#product-front, #product-front div.shadow').hide();
                });
            }, 50);
        });

        // Flip card back to the front side
        $('#flip-back').click(function(){

            $('#product-card${product.id}').removeClass('flip180').addClass('flip190');
            setTimeout(function(){
                $('#product-card${product.id}').removeClass('flip190').addClass('flip90');

                $('#product-back${product.id} div.shadow').css('opacity', 0).fadeTo( 100 , 1, function(){
                    $('#product-back${product.id}, #product-back${product.id} div.shadow').hide();
                    $('#product-front${product.id}, #product-front${product.id} div.shadow').show();
                });
            }, 50);

            setTimeout(function(){
                $('#product-card${product.id}').removeClass('flip90').addClass('flip-10');
                $('#product-front${product.id} div.shadow').show().fadeTo( 100 , 0);
                setTimeout(function(){
                    $('#product-front${product.id} div.shadow').hide();
                    $('#product-card${product.id}').removeClass('flip-10').css('transition', '100ms ease-out');
                    $('#cx, #cy').removeClass('s1 s2 s3');
                }, 100);
            }, 150);

        });

        </c:forEach>
        </c:forEach>








        /* ----  Image Gallery Carousel   ---- */

        var carousel = $('#carousel ul');
        var carouselSlideWidth = 335;
        var carouselWidth = 0;
        var isAnimating = false;

        // building the width of the casousel
        $('#carousel li').each(function(){
            carouselWidth += carouselSlideWidth;
        });
        $(carousel).css('width', carouselWidth);

        // Load Next Image
        $('div.carouselNext').on('click', function(){
            var currentLeft = Math.abs(parseInt($(carousel).css("left")));
            var newLeft = currentLeft + carouselSlideWidth;
            if(newLeft == carouselWidth || isAnimating === true){return;}
            $('#carousel ul').css({'left': "-" + newLeft + "px",
                "transition": "300ms ease-out"
            });
            isAnimating = true;
            setTimeout(function(){isAnimating = false;}, 300);
        });

        // Load Previous Image
        $('div.carouselPrev').on('click', function(){
            var currentLeft = Math.abs(parseInt($(carousel).css("left")));
            var newLeft = currentLeft - carouselSlideWidth;
            if(newLeft < 0  || isAnimating === true){return;}
            $('#carousel ul').css({'left': "-" + newLeft + "px",
                "transition": "300ms ease-out"
            });
            isAnimating = true;
            setTimeout(function(){isAnimating = false;}, 300);
        });
    });

</Script>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>

<div class="row">

    <div class="col-md-3 mt-5">
        <t:subMenu></t:subMenu>
    </div>

    <div class="col-md-9 mt-5">
        <c:forEach items="${customProductList.customProductListItems}" var="customProductListItem">
            <div class="col-md-10 mr-2 mb-2" style="border:solid 5px; display: block">
                <br>
                <c:if test="${customProductListItem.area!=null}">
                    <span style=" text-align: -webkit-center ; font-family: 'Source Sans Pro', sans-serif;font-size: 30px"  > Por que sabemos de tu interés en:
                    </br>
                        <span style=" text-align: center; align-content: center ; font-family: 'Source Sans Pro', sans-serif;font-size: 50px; color: darkgreen"><strong>${customProductListItem.area.name}</strong>  </span></span>
                </c:if>
                <c:if test="${customProductListItem.area==null}">
                    <span style=" text-align: -webkit-center ; font-family: 'Source Sans Pro', sans-serif;font-size: 45px"  >  Productos recientemente publicados  </span>
                </c:if>

            </div>
            <c:forEach items="${customProductListItem.products}" var="product">

                <div class="col-md-5" style="border:solid 0px; height: 100vh; display: block">
                    <div class="row">

                        <div id="make-3D-space">
                            <div id="product-card${product.id}">
                                <div id="product-front${product.id}">
                                    <div class="shadow"></div>
                                    <img src="${product.image.path}" style="width:100%; ">
                                    <div class="image_overlay"></div>
                                    <a href="${urlBase}/product/detail/${product.id}" id="view_details" title="Ver detalle" class="btn btn-primary mb-1" style="width: 100% padding: 0px">Ver Detalle</a>

                                    <div class="stats">
                                        <div class="stats-container">
                                            <span class="product_name">${product.name}</span>

                                            <div class="product-options">
                                                <strong>Precio</strong>
                                                <span>$${product.price}</span>
                                                <strong>Descripción</strong>
                                                <span>${product.description}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="product-back${product.id}">
                                <div class="shadow"></div>
                                <div id="carousel">
                                    <ul>
                                        <li><img src="${urlBase}/images/${product.image.path}" style="width:100%; "></li>
                                    </ul>
                                    <div class="arrows-perspective">
                                        <div class="carouselPrev">
                                            <div class="y"></div>
                                            <div class="x"></div>
                                        </div>
                                        <div class="carouselNext">
                                            <div class="y"></div>
                                            <div class="x"></div>
                                        </div>
                                    </div>
                                </div>
                                <div id="flip-back">
                                    <div id="cy"></div>
                                    <div id="cx"></div>
                                </div>
                            </div>
                        </div>

                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

                    </div>
                </div>
            </c:forEach>
        </c:forEach>

    </div>



</div>


</body>
</html>

