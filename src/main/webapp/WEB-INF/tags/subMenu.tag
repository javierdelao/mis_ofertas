<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
    .vertical-menu {
        width: 200px;
    }

    .vertical-menu a {
        background-color: #eee;
        color: black;
        display: block;
        padding: 12px;
        text-decoration: none;
    }

    .vertical-menu a:hover {
        background-color: #ccc;
    }

    .vertical-menu a.active {
        background-color: #4CAF50;
        color: white;
    }

    .mt-5 {
        margin-top: 5%;
    }

    .ml-5 {
        margin-left: 5%;
    }

    .h10 {
        height: 10vh;
    }
    .centered{
        text-align: center;
        vertical-align: middle;
    }

</style>

<style>
    #menu{
        position: inherit;
        background-color:#222;
        height:100%;
        z-index:10;
        width:190px;
        color:#bbb;
        top:20px;

        -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        transition: all 0.3s ease;
        opacity:1;
        font-family: 'Source Sans Pro', sans-serif;
    }

    #menu ul{
        list-style:none;
        margin-top:0;
        padding:0
    }
    #menu ul li{border-bottom: 1px solid #2a2a2a;}
    #menu>ul>li>a{border-left:4px solid #222;}
    #menu ul li a{
        color:inherit;
        font-size:16px;
        display:block;
        padding:8px 0 8px 7px;
        text-decoration:none;
        -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        transition: all 0.3s ease;
        font-weight: 600;
    }
    #menu ul a i{
        margin-right:10px;
        font-size: 18px;
        margin-top: 3px;
        width: 20px;
    }
    #menu ul a i[class='fa-caret']{float: right;}
    #menu ul a:hover,#menu ul a.active{
        background-color:#111;
        border-left-color: #FFCC33;
        color:#FFCC33;
    }
    #menu ul a:hover i:first-child{color:#FFCC33;}

    /* Submenu */
    #menu ul li a.active+ul{display:block}
    #menu ul li ul{margin-top: 0;display: none;}
    #menu ul li ul li{border-bottom: none;}
    #menu ul li ul li a{padding-left: 30px;}
    #menu ul li ul li a:hover{
        background-color:#1A1A1A;
    }
    /* /Submenu */


    /* Cuando este a la Izq, para esconderlo posicionarlo a la Izq a -width */
    .left{left:-280px;}
    .show{left:0;}

    #showmenu{
        margin-left:100%;
        position:absolute;
        top:0;
        padding:6px 10px 7px 10px;
        font-size:1.3em;
        color:#FFCC33;
        -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }

    #container{padding: 50px;}

</style>

<script>
    $("#showmenu").click(function(e){
        $("#menu").toggleClass("show");
    });
    $("#menu a").click(function(event){
        if($(this).next('ul').length){
            event.preventDefault();
            $(this).next().toggle('fast');
            $(this).children('i:last-child').toggleClass('fa-caret-down fa-caret-left');
        }
    });
</script>

<style>

    input#abrir-cerrar:checked ~ #sidebar {
        width:300px;
    }
    input#abrir-cerrar:checked + label[for="abrir-cerrar"], input#abrir-cerrar:checked ~ #contenido {
        margin-left:300px;
        transition: margin-left .4s;
    }
    input#abrir-cerrar:checked + label[for="abrir-cerrar"] .cerrar {
        display:inline;
    }
    input#abrir-cerrar:checked + label[for="abrir-cerrar"] .abrir {
        display:none;
    }
</style>
<script>


    function mostrar() {
        document.getElementById("sidebar").style.width = "300px";
        document.getElementById("contenido").style.marginLeft = "300px";
        document.getElementById("abrir").style.display = "none";
        document.getElementById("cerrar").style.display = "inline";
    }

    function ocultar() {
        document.getElementById("sidebar").style.width = "0";
        document.getElementById("contenido").style.marginLeft = "0";
        document.getElementById("abrir").style.display = "inline";
        document.getElementById("cerrar").style.display = "none";
    }
</script>




<!-- menu vertical -->
<nav id="menu" class="left show">
    <ul>
        <li><a href="${urlBase}/home/" class="${area==null?'active':''} h10 centered"><i class="fa fa-home"></i>Home</a></li>

        <c:forEach items="${areas}" var="areaTemp">
            <li><a href="${urlBase}/home/${areaTemp.id}" class="${area.id==areaTemp.id?'active':''} h10 centered">${areaTemp.name}</a> </li>
        </c:forEach>
    </ul>


    </label>
</nav>
<style>
    input#abrir-cerrar { visibility:hidden; position: absolute; top: -9999px; }
</style>

<input id="abrir-cerrar" name="abrir-cerrar" type="checkbox" value="" />
<label for="abrir-cerrar">
    &#9776; <span class="abrir">Abrir</span><span class="cerrar">Cerrar</span>
</label>

<!-- /menu vertical -->
