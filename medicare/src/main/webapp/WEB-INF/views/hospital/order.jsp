<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
    margin: 0;
    padding: 0;
}

.custom_calendar_table{
    text-align: center;
}

.custom_calendar_table thead.cal_date th {
    font-size: 1.5rem;
}

.custom_calendar_table thead.cal_date th button {
    font-size: 1.5rem;
    background: none;
    border: none;
}

.custom_calendar_table thead.cal_week th {
    background-color: #288CFF;
    color: #fff;
}

.custom_calendar_table tbody td {
    cursor: pointer;
}

.custom_calendar_table tbody td:nth-child(1) {
    color: red;
}

.custom_calendar_table tbody td:nth-child(7) {
    color: #288CFF;
}

.custom_calendar_table tbody td.select_day {
    background-color: #288CFF;
    color: #fff;
}
#calender div{
	float:left;
	padding-left: 50px;
}

.past-date {
    background-color: #f2f2f2; /* Gray background color */
    cursor: not-allowed; /* Change cursor to not-allowed */
}
</style>

</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper">
        	<form action="">
        	<div style="padding-left:50px; padding-bottom:50px; border-bottom:1px solid #F96C85;">
        	😄 XXX님
        	</div>
        	<div style="padding-left:50px; padding-top:10px; padding-bottom:50px; border-bottom:1px solid #F96C85;">
        	✔ 진료항목 <br><br>
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="diagnosisType" value="1">  일반진료 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="diagnosisType" value="2"> 비대면진료 <br>
       		</div>
       		<div id="calender" style=" padding-top:10px;">
       		<p style="text-align:left; padding-left:50px;">🕑 예약 날짜 / 예약 시간</p>
				<div id="calendarForm" style=" padding-top:50px;"></div>
				<div id="orderTime" style="visibility: hidden; border:1px solid black; margin-top:50px; margin-bottom:20px; margin-left:50px; padding-left:30px; padding-right:30px;">
					<input type="radio" name="time" value="a"> 9:00 ~ 10:00 <br>
					<input type="radio" name="time" value="b"> 10:00 ~ 11:00 <br>
					<input type="radio" name="time" value="c"> 11:00 ~ 12:00 <br>
					<input type="radio" name="time" value="d"> 13:00 ~ 14:00 <br>
					<input type="radio" name="time" value="e"> 14:00 ~ 15:00 <br>
					<input type="radio" name="time" value="f"> 15:00 ~ 16:00 <br>
					<input type="radio" name="time" value="g"> 17:00 ~ 18:00 <br>
					<input type="radio" name="time" value="h"> 18:00 ~ 19:00 <br>
					<input type="radio" name="time" value="i"> 19:00 ~ 20:00
				</div>
			</div>
			<div style="text-align:right;">
			<button class="btn btn-primary" style=" padding-top:20px;">접수하기</button>
			</div>
			</form>
   		</div>
    <jsp:include page="../common/footer.jsp"/>
    <script>
    (function () {
        calendarMaker($("#calendarForm"), new Date());
    })();

    var nowDate = new Date();
    function calendarMaker(target, date) {
        if (date == null || date == undefined) {
            date = new Date();
        }
        nowDate = date;
        if ($(target).length > 0) {
            var year = nowDate.getFullYear();
            var month = nowDate.getMonth() + 1;
            $(target).empty().append(assembly(year, month));
        } else {
            console.error("custom_calendar Target is empty!!!");
            return;
        }

        var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
        var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);


        var tag = "<tr>";
        var cnt = 0;
        //빈 공백 만들어주기
        for (i = 0; i < thisMonth.getDay(); i++) {
            tag += "<td></td>";
            cnt++;
        }

        //날짜 채우기
        for (i = 1; i <= thisLastDay.getDate(); i++) {
            if (cnt % 7 == 0) { tag += "<tr>"; }

            tag += "<td>" + i + "</td>";
            cnt++;
            if (cnt % 7 == 0) {
                tag += "</tr>";
            }
        }
        $(target).find("#custom_set_date").append(tag);
        calMoveEvtFn();

        function assembly(year, month) {
            var calendar_html_code =
                "<table class='custom_calendar_table'>" +
                "<colgroup>" +
                "<col style='width:81px'/>" +
                "<col style='width:81px'/>" +
                "<col style='width:81px'/>" +
                "<col style='width:81px'/>" +
                "<col style='width:81px'/>" +
                "<col style='width:81px'/>" +
                "<col style='width:81px'/>" +
                "</colgroup>" +
                "<thead class='cal_date'>" +
                "<th><button type='button' class='prev'>&lt;</button></th>" +
                "<th colspan='5'><p><span>" + year + "</span>년 <span>" + month + "</span>월</p></th>" +
                "<th><button type='button' class='next'>&gt;</button></th>" +
                "</thead>" +
                "<thead  class='cal_week'>" +
                "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
                "</thead>" +
                "<tbody id='custom_set_date'>" +
                "</tbody>" +
                "</table>";
            return calendar_html_code;
        }

        function calMoveEvtFn() {
            // Previous and next month click handlers

            // Selecting date click handler
            $(".custom_calendar_table").on("click", "td", function () {
                var selectedDay = parseInt($(this).text());
                var currentDay = new Date().getDate();
                if (selectedDay < currentDay) {
                    return; // Do nothing if the selected day is before today
                }
                
                $(".custom_calendar_table .select_day").removeClass("select_day");
                $(this).removeClass("select_day").addClass("select_day");

                // Get selected date
                var selectedMonth = nowDate.getMonth() + 1;
                var selectedYear = nowDate.getFullYear();

                // Pad single digit values with leading zero
                selectedDay = selectedDay >= 10 ? selectedDay : '0' + selectedDay;
                selectedMonth = selectedMonth >= 10 ? selectedMonth : '0' + selectedMonth;

                var selectedDate = selectedYear + "-" + selectedMonth + "-" + selectedDay;
                $("#orderTime").css("visibility", "");
                console.log(selectedDate); // Print selected date in yyyy-mm-dd format
            });

            // Set hover effect only for past dates
            $(".custom_calendar_table").on("mouseenter", "td", function () {
                var selectedDay = parseInt($(this).text());
                var currentDay = new Date().getDate();
                if (selectedDay < currentDay) {
                    return; // Do not apply hover effect on past dates
                }
                $(this).addClass("past-date");
            });

            $(".custom_calendar_table").on("mouseleave", "td", function () {
                $(this).removeClass("past-date");
            });
        }
    }
    </script>
</body>
</html>