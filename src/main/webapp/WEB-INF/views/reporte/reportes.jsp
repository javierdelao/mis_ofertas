<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:09
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
<script>
    $(document).ready(function () {



    Highcharts.chart('container-productos-visitados', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Mis productos mas visitados'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [
                <c:forEach items="${visitProductResport}" var="visitProduct" varStatus="loop">
                {
                    name:'${visitProduct.product.name}',
                    y: ${visitProduct.visitQta},
                    sliced: true,
                    selected: true
                }
                <c:if test="${loop.index!=(visitPerDayReports.size()-1)}">
                ,
                </c:if>
                </c:forEach>

            ]
        }]
    });


        Highcharts.chart('container-mejor-valorados', {
            chart: {
                type: 'column'
            },
            title: {
                text: 'Productos mejor valorados'
            },
            subtitle: {
                text: 'Source: WorldClimate.com'
            },
            xAxis: {
                categories: [
                    'Productos'
                ],
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Rainfall (mm)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} Estrellas</b></td></tr>',
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
            series: [
                <c:forEach items="${productValorationAveragesAsc}" var="productValorationAverage" varStatus="loop">
                {
                    name: '${productValorationAverage.product.name}',
                    data: [${productValorationAverage.averageValorationProduct}]

                }
                <c:if test="${loop.index!=(visitPerDayReports.size()-1)}">
                ,
                </c:if>
                </c:forEach>
                ]
        });

        Highcharts.chart('container-peor-valorados', {
            chart: {
                type: 'column'
            },
            title: {
                text: 'Productos peor valorados'
            },
            subtitle: {
                text: 'Source: WorldClimate.com'
            },
            xAxis: {
                categories: [
                    'Productos'
                ],
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Rainfall (mm)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} Estrellas</b></td></tr>',
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
            series: [ <c:forEach items="${productValorationAveragesDesc}" var="productValorationAverage" varStatus="loop">
                {
                    name: '${productValorationAverage.product.name}',
                    data: [${productValorationAverage.averageValorationProduct}]

                }
                <c:if test="${loop.index!=(visitPerDayReports.size()-1)}">
                ,
                </c:if>
                </c:forEach>]
        });

    });
</script>


<div class="container">
    <div class="content">
        <h2>Reportes</h2>
    </div>
</div>

<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <div id="container-productos-visitados" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>
    <div class="col-md-6"  style="margin-top: 5%">
        <div id="container-mejor-valorados" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>

    <div class="col-md-6" style="margin-top: 5%">
        <div id="container-peor-valorados" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>

    <div class="col-md-6" style="margin-top: 5%">
        <div id="container-categorias-visitadas" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>
</div>

</body>
</html>
