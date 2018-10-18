<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .content {
        margin-top: 80px;
    }
</style>
<div class="container" id="dvShow">
    <div class="content">
        <h2>Reportes</h2>
        <form class="form-inline" method="get">
            <div class="form-group">





                <select name="filter" class="form-control" onchange="form.submit()">
                    <option value="0">Seleccione la tienda</option>
                    <option value="1"> Ripley</option>
                    <option value="2"> Duoc </option>
                    <option value="3">Mis Ofertas</option>
                </select>


            </div>
        </form>
        <br />
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <tr>
                    <th>Q' Usuarios Registrados</th>
                    <th> Correos Enviados</th>
                    <th> Q' Valorizacion</th>
                    <th> Rubro </th>
                    <th> Descuentos Entregados</th>

                </tr>
                <tr>
                    <td>
                        3
                    </td>
                    <td>
                        3
                    </td>
                    <td>
                        5
                    </td>
                    <td>

                        ElectroHogar
                    </td>
                    <td>
                        3
                    </td>
                    </td>
                    <td>


                    </td>
                    <td>

                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>


    </div>
</div>
<center>
    <a href="../pdfs/reporte2-05-10.pdf" download="Reporte2Mayo2010">
        Descargar Archivo
    </a>
</center>
<br>
<br>



<center>
    <p>&copy; Sistemas Web Mis Ofertas</p>
</center>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"></script>    