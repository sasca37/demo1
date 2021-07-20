<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="layout/header.jsp" %>

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<meta charset="utf-8">

<style>



</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<button id="change-chart">Change to Classic</button>
<br><br>
<div id="chart_div" style="width: 800px; height: 500px;"></div>
<script type="text/javascript">
    // $(document).ready(function () {
    //     drawStuff();
    // });

    google.charts.load('current', {'packages':['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawStuff);

    function drawStuff() {

        var button = document.getElementById('change-chart');
        var chartDiv = document.getElementById('chart_div');

        var data = google.visualization.arrayToDataTable([
            ['GPU_GRAPH', 'GPU_0', 'GPU_1'],
            ['Canis Major Dwarf', 8000, 23.3],
            ['Sagittarius Dwarf', 24000, 4.5],
            ['Ursa Major II Dwarf', 30000, 14.3],
            ['Lg. Magellanic Cloud', 50000, 0.9],
            ['Bootes I', 60000, 13.1]
        ]);

        var materialOptions = {
            width: 800,
            chart: {
                title: 'Nearby galaxies',
                subtitle: 'distance on the left, brightness on the right'
            },
            series: {
                0: { axis: 'GPU_0' }, // Bind series 0 to an axis named 'distance'.
                1: { axis: 'GPU_1' } // Bind series 1 to an axis named 'brightness'.
            },
            axes: {
                y: {
                    distance: {label: 'parsecs'}, // Left y-axis.
                    brightness: {side: 'right', label: 'apparent magnitude'} // Right y-axis.
                }
            }
        };

        var classicOptions = {
            width: 900,
            series: {
                0: {targetAxisIndex: 0},
                1: {targetAxisIndex: 1}
            },
            title: 'Nearby galaxies - distance on the left, brightness on the right',
            vAxes: {
                // Adds titles to each axis.
                0: {title: 'parsecs'},
                1: {title: 'apparent magnitude'}
            }
        };

        function drawMaterialChart() {
            var materialChart = new google.charts.Bar(chartDiv);
            materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
            button.innerText = 'Change to Classic';
            button.onclick = drawClassicChart;
        }

        function drawClassicChart() {
            var classicChart = new google.visualization.ColumnChart(chartDiv);
            classicChart.draw(data, classicOptions);
            button.innerText = 'Change to Material';
            button.onclick = drawMaterialChart;
        }

        drawMaterialChart();
    };
</script>

<%@ include file="layout/footer.jsp" %>
</body>
</html>