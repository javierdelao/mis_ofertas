<%--
  Created by IntelliJ IDEA.
  User: javierdelao
  Date: 04-05-18
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<script>
    $(document).ready(function() {
        //Siempre que salgamos de un campo de texto, se chequeará esta función
        $("#form input").keyup(function() {
            var form = $(this).parents("#form");
            var check = checkCampos(form);
            if(check) {
                $("#user-data-next-button").prop("disabled", false);
            }
            else {
                $("#user-data-next-button").prop("disabled", true);
            }
        });
    });

    //Función para comprobar los campos de texto
    function checkCampos(obj) {
        var camposRellenados = true;
        obj.find("input").each(function() {
            var $this = $(this);
            if( $this.val().length <= 0 ) {
                camposRellenados = false;
                return false;
            }
        });
        if(camposRellenados == false) {
            return false;
        }
        else {
            return true;
        }
    }
</script>
<script>
        function checkRut(rut) {
        // Despejar Puntos
        var valor = rut.value.replace('.','');
        // Despejar Guión
        valor = valor.replace('-','');

        // Aislar Cuerpo y Dígito Verificador
        cuerpo = valor.slice(0,-1);
        dv = valor.slice(-1).toUpperCase();

        // Formatear RUN
        rut.value = cuerpo + '-'+ dv

        // Si no cumple con el mínimo ej. (n.nnn.nnn)
        if(cuerpo.length < 7) { rut.setCustomValidity("RUT Incompleto"); return false;}

        // Calcular Dígito Verificador
        suma = 0;
        multiplo = 2;

        // Para cada dígito del Cuerpo
        for(i=1;i<=cuerpo.length;i++) {

            // Obtener su Producto con el Múltiplo Correspondiente
            index = multiplo * valor.charAt(cuerpo.length - i);

            // Sumar al Contador General
            suma = suma + index;

            // Consolidar Múltiplo dentro del rango [2,7]
            if(multiplo < 7) { multiplo = multiplo + 1; } else { multiplo = 2; }

        }

        // Calcular Dígito Verificador en base al Módulo 11
        dvEsperado = 11 - (suma % 11);

        // Casos Especiales (0 y K)
        dv = (dv == 'K')?10:dv;
        dv = (dv == 0)?11:dv;

        // Validar que el Cuerpo coincide con su Dígito Verificador
        if(dvEsperado != dv) { rut.setCustomValidity("RUT Inválido"); return false; }

        // Si todo sale bien, eliminar errores (decretar que es válido)
        rut.setCustomValidity('');
    }
</script>
<script>
    function caracteresCorreoValido(email){

        var exp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(!exp.test(document.getElementById("email").value)){
            email.setCustomValidity("Email Inválido");
            return false;
        }else{
            email.setCustomValidity("");
            return true;
        }
    }
</script>


<div class="row" style="padding-top: 15%;">
    <div class="col-md-offset-4 col-md-4" style="margin-top:15px;border:3px solid grey">
        <br>
        <form action="/login" METHOD="POST">
        <div class="row">
            <div class="col-md-4"><h4>RUT</h4></div>
            <div class="col-md-8"><input type="text" class="form-control" name="rut" id="rut" oninput="checkRut(this)" required></div>
            <p style="text-align: right; color: #ada9a9;margin-right: 15px;">Ejemplo: 12345678K</p>
        </div>
        <div class="row">
            <div class="col-md-4"><h4>Contraseña</h4></div>
            <div class="col-md-8"><input type="password" class="form-control" name="password" required></div>
        </div>
        <div class="row">
            <div class="col-md-4"><h4></h4></div>
            <div class="col-md-4"><input type="submit" class="btn btn-default" value="Ingresar"></div>
            <div class="col-md-4"><a class="btn btn-default" data-toggle="modal" data-target="#myModal">Registrarse</a></div>
        </div>
        </form>
        <c:if test="${error}">
            <span style="color: red">Credenciales inválidas</span>
        </c:if>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">

    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <form id="registerForm" METHOD="POST" action="/register" onsubmit="validar()">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Registro</h4>
            </div>
            <div class="modal-body">
               <div class="row">
                   <div class="col-md-3">Rut</div>
                   <div class="col-md-8"><input class="form-control" type="rut" name="rut" id="registerRut" oninput="checkRut(this)"  required></div>
               </div>

                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Nombre</div>
                    <div class="col-md-8"><input id="registerNombre" class="form-control" name="firstName"  type="text"  required></div>
                </div>

                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Apellido paterno</div>
                    <div class="col-md-8"><input id="registerApP" class="form-control" name="lastName"  type="text" required></div>
                </div>

                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Contraseña</div>
                    <div class="col-md-8"><input class="form-control" id="pass1" name="password" type="password" required></div>
                </div>
                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Repita Contraseña</div>
                    <div class="col-md-8"><input class="form-control" id="pass2" name="passwordConf" type="password" required></div>
                </div>

                <div class="row" style="padding-top: 5px">
                    <div class="col-md-3">Correo electronico</div>
                    <div class="col-md-8"><input class="form-control" id="email" name="email" type="text" oninput="caracteresCorreoValido(this)" required></div>

                </div>

            </div>
            <div class="modal-footer">
                <input type="submit" class="btn btn-default" value="Registrarse" oninput="checkRut(this)"  required>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
            </form>

        </div>

    </div>
</div>
<script type="text/javascript">

    function validar_clave(e) {

        var caract_invalido = " ";
        var caract_longitud = 6;
        var cla1 = $('#registerForm #pass1').val();
        var cla2 = $('#registerForm #pass2').val();
        if (cla1 == '' || cla2 == '') {
            alert('Debes introducir tu clave en los dos campos.');
            //document.registro
            e.preventDefault();
            return false;
        }
        if (cla1.length < caract_longitud) {
            alert('Tu clave debe constar de ' + caract_longitud + ' carácteres.');
            //document.registro
            e.preventDefault();
            return false;
        }
        if (cla1.indexOf(caract_invalido) > -1) {
            alert("Las claves no pueden contener espacios");
            //document.registro
            e.preventDefault();
            return false;
        } else {
            if (cla1 != cla2) {
                alert("Las claves introducidas no son iguales");
                //document.registro
                e.preventDefault();
                return false;
            } else {
                return true;
            }
        }
    }

    $(function() {
        $('#registerForm').submit(function(e) {
            validar_clave(e);
        });
    });
</script>


</body>
</html>
