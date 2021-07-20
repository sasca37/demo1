<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="layout/header.jsp" %>

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<meta charset="utf-8">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div id="chart_div" style="width: 98%; height: 500px; margin: 10px"></div>
<script type="text/javascript">

     google.charts.load('current', {packages: ['corechart', 'bar']});
     google.charts.setOnLoadCallback(drawMaterial);

     function drawMaterial() {
         var data = new google.visualization.DataTable();

         data.addColumn('timeofday', 'GPU_GRAPH');
         data.addColumn('number', 'GPU_0');
         data.addColumn('number', 'GPU_1');

         data.addRows([
             [{v: [8, 0, 0], f: '8 am'}, 1, .25],
             [{v: [9, 0, 0], f: '9 am'}, 2, .5],
             [{v: [10, 0, 0], f:'10 am'}, 3, 1],
             [{v: [11, 0, 0], f: '11 am'}, 4, 2.25],
             [{v: [12, 0, 0], f: '12 pm'}, 5, 2.25],
             [{v: [13, 0, 0], f: '1 pm'}, 6, 3],
             [{v: [14, 0, 0], f: '2 pm'}, 7, 4],
             [{v: [15, 0, 0], f: '3 pm'}, 8, 5.25],
             [{v: [16, 0, 0], f: '4 pm'}, 9, 7.5],
             [{v: [17, 0, 0], f: '5 pm'}, 10, 10],
         ]);

         var options = {
             title: 'Motivation and Energy Level Throughout the Day',
             hAxis: {
                 title: 'GPU GRAPH',
                 format: 'h:mm a',
                 viewWindow: {
                     min: [7, 30, 0],
                     max: [17, 30, 0]
                 }
             },
             vAxis: {
                 title: 'Rating (scale of 1-100)'
             }
         };

         var materialChart = new google.charts.Bar(document.getElementById('chart_div'));
         materialChart.draw(data, options);
     }
</script>

<%@ include file="layout/footer.jsp" %>
</body>
</html>