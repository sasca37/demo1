<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%-- 구글 차트 사용을 위한 loader.js 추가 --%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <style>
        .chart{
            border: 1px solid orange;
            float: left;
            margin: 30px;
        }
    </style>
</head>

<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

    $(function () {
        timer = setInterval( function () {
            const time = '<c:out value="${list[0].time}"/>'
            const type = '<c:out value="${list[0].type}"/>'
            const no = '<c:out value="${list[0].no}"/>'
            const per = '<c:out value="${list[0].per}"/>'

            $.ajax({
                // type: "POST", //전송 방식
                url: "/ajax.do", // 호출할 주소
                data: {
                    time: time,
                    type : type,
                    no : no,
                    per : per
                }, // 넘길 데이터
                dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
                success: function(data) { // 결과 받기
                    //data = JSON.parse(data); // JSON 형태로 파싱
                    console.log(data);
                }

            });
        }, 1000);
    });

</script>


<div id="chart" class="chart" style="width: 779px; height: 300px">

</div>

<script type="text/javascript">
    //Google Stuff
    google.charts.load('current', {packages: ['corechart']});
    google.charts.setOnLoadCallback(function(){ drawChart(new_option)});
</script>

<script type="text/javascript">
    //  target : 차트 그릴 요소의 id 값, maxValue : y축 맥스 값, color: 차트 색상, name: 차트 이름
    var chartOption = function(target, maxValue, color, name){
        this.name = name;
        this.target = target;
        this.data = null;
        this.chart = null;
        this.options = {
            legend: { position: 'none' },
            vAxis: {minValue:0, maxValue:maxValue},
            hAxis: {
                textStyle: {
                    fontSize: 11
                }
            },
            colors: [color],
            animation: {
                duration: 500,
                easing: 'in',
                startup: true
            }
        }

    }

    var new_option = new chartOption('chart', 100, '#FF5E00', 'gpu0');

    function drawChart(option) {
        var o = option;
        if(o != null){
            //초기값일때만 처리
            if(o.chart == null && o.data == null){
                o.data = new google.visualization.DataTable();
                o.data.addColumn('string', 'time');
                o.data.addColumn('number', o.name);
                o.data.addRow(['', 0]);
                o.chart = new google.visualization.LineChart(document.getElementById(o.target));
            }

            o.chart.draw(o.data, o.options);
        }
    }

    function animateRenewal(option){
        var o = option;
        if (o.data.getNumberOfRows() >= 10) {
            o.data.removeRow(0);
        }

        var value = parseInt('<c:out value="${list[0].per}"/>')
        // var value = 0;
         var maxValue = o.options.vAxis.maxValue;

        o.data.insertRows(o.data.getNumberOfRows(), [[getNowTime(), value]]);
        drawChart(o);
    }

    setInterval(function(){
        animateRenewal(new_option);
    }, 1000);

    function checkTime(i) {
        if (i < 10) { i = '0' + i }
        return i
    }

    function getNowTime(){
        var d = new Date();
        var sep = ":";
        var hh = checkTime(d.getHours());
        var mm = checkTime(d.getMinutes());
        var ss = checkTime(d.getSeconds());
        return hh + sep + mm + sep + ss;
    }

</script>
</body>
</html>