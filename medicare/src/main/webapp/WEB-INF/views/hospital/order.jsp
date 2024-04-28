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
    <div class="main-panel" >
        <div class="content-wrapper">
        	<div style="height:1100px; width:900px; margin:auto; border:4px solid #F96C85; border-radius:15px;">
        	<form action="order.in">
        	<div style="padding-left:50px; padding-top:20px; padding-bottom:20px; border-bottom:1px solid #F96C85;">
        	😄 ${ loginUser.memName }님
        	<input type="hidden" name="memNo" value="${ loginUser.memNo }">
        	<input type="hidden" name="orderDate" id="orderDate">
        	</div>
        	<div style="padding-left:50px; padding-top:10px; padding-bottom:50px; border-bottom:1px solid #F96C85;">
        	&nbsp;✔ 진료항목 <br><br>
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="diagnosisType" value="1">  일반진료 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="diagnosisType" value="2"> 비대면진료 <br>
       		</div>
       		<div id="calender" style="  padding-top:10px; height:500px;">
       		<p style="text-align:left; padding-left:50px;">🕑 예약 날짜 / 예약 시간</p>
				<div id="calendarForm" style=" padding-top:50px; "></div>
				<div id="orderTime" style="visibility: hidden; border:4px solid #F96C85; border-radius:15px; margin-top:50px; margin-bottom:20px; margin-left:50px; padding-left:30px; padding-right:30px;">
				ㅁㄴㅁㄴㅇㄴㅁㅇㅁ
				ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴ
				</div>
			</div>
			<div>
				<textarea rows="5" cols="50" name="addSymtom" style="margin-left:50px; margin-top:50px;" placeholder="추가증상을 입력하세요(선택)"></textarea> 
			</div>
			<hr style="background-color:#F96C85;">
			<div style="text-align:right; padding-right:10px;">
			<button class="btn btn-primary" style="background-color: #F96C85; color:white; border:0px;">접수하기</button>
			</div>
			</form>
			</div>
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
            // Remove existing event handlers
            $(".cal_date .next, .cal_date .prev").off("click");
            $(".custom_calendar_table td").off("click mouseenter mouseleave");

            // Previous and next month click handlers
            $(".cal_date").on("click", ".next", function () {
                nowDate.setMonth(nowDate.getMonth() + 1); // Move to the next month
                calendarMaker($("#calendarForm"), nowDate); // Re-generate the calendar for the new month
            });

            $(".cal_date").on("click", ".prev", function () {
                nowDate.setMonth(nowDate.getMonth() - 1); // Move to the previous month
                calendarMaker($("#calendarForm"), nowDate); // Re-generate the calendar for the new month
            });

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

                var date = new Date(selectedDate);
                var daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
                var dayOfWeek = daysOfWeek[date.getDay()];

                var timeRadioButtons = generateTimeRadioButtons(dayOfWeek); // Generate radio buttons for the specified day
                console.log(timeRadioButtons)
                if(timeRadioButtons === ""){
                	$("#orderTime").html("휴진입니다");
                }else{
                	$("#orderTime").html(timeRadioButtons);
                }

            	$("#orderDate").val(selectedDate);
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

    var lunchStart = "13:00";
    var lunchEnd = "14:00";

    var elementIds = ["${ h.hosStMon }", "${ h.hosCtMon }", "${ h.hosStTue }", "${ h.hosCtTue }", "${ h.hosStWen }", "${ h.hosCtWen }", "${ h.hosStThu }", "${ h.hosCtThu }", "${ h.hosStFri }", "${ h.hosCtFri }", "${ h.hosStSat }", "${ h.hosCtSat }", "${ h.hosStSun }", "${ h.hosCtSun }", "${ h.hosStHol }", "${ h.hosCtHol }"];
    var elementIdss = [];
    var currentDate = new Date();

    // Get the day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
    var currentDayOfWeek = currentDate.getDay();

    // Define an array to map the day of the week to its name
    var daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

    // Get the name of the current day of the week
    var currentDayName = daysOfWeek[currentDayOfWeek];

    // Define the convertToTime function
	    function convertToTime(value) {
	    if (value.length === 3) {
	        return "0" + value.substring(0, 1) + ":" + value.substring(1);
	    } else if (value.length === 4) {
	        return value.substring(0, 2) + ":" + value.substring(2);
	    } else {
	        return "Invalid time format";
	    }
	}

    // Loop through the array and update the value of each element
    for (var i = 0; i < elementIds.length; i++) {
        // Check if the element exists before updating its value
        var convertedTime = convertToTime(elementIds[i]);
        elementIdss.push(convertedTime); // Push the converted time into the elementIdss array
        console.log(elementIdss[i]); // Log the array after the loop
    }

    // Define start and end times for each day of the week (assuming Monday to Sunday)
    var dayStartEndTimes = {
        "Monday": { start: elementIdss[0], end: elementIdss[1] },
        "Tuesday": { start: elementIdss[2], end: elementIdss[3] },
        "Wednesday": { start: elementIdss[4], end: elementIdss[5] },
        "Thursday": { start: elementIdss[6], end: elementIdss[7] },
        "Friday": { start: elementIdss[8], end: elementIdss[9] },
        "Saturday": { start: elementIdss[10], end: elementIdss[11] },
        "Sunday": { start: elementIdss[12], end: elementIdss[13] }
    };

    // Function to generate radio buttons for each 30-minute interval for a specific day
    function generateTimeRadioButtons(day) {

        var startTime = dayStartEndTimes[day].start;
        var endTime = dayStartEndTimes[day].end;
        var timeRadioButtons = ""; // Initialize an empty string to store the generated radio buttons
        var currentTime = startTime; // Initialize current time with the start time
        // Loop through each interval between start and end time
        console.log("타냐");
        while (compareTimes(currentTime, endTime) < 0) {
            // Exclude lunchtime
            if (compareTimes(currentTime, lunchStart) < 0 || compareTimes(currentTime, lunchEnd) >= 0) {
                // Generate radio button HTML for the current time interval
                timeRadioButtons += "<input type='radio' name='time' value='" + currentTime + "'> " + currentTime + " ~ " + add30Minutes(currentTime) + "<br>";
            }
            currentTime = add30Minutes(currentTime); // Move to the next 30-minute interval
        }

        // Function to compare time strings (e.g., "09:00")

        return timeRadioButtons; // Return the generated radio buttons HTML
    }


    function compareTimes(time1, time2) {
        var date1 = new Date("2000-01-01 " + time1);
        var date2 = new Date("2000-01-01 " + time2);
        return date1 - date2;
    }

    // Function to add 30 minutes to a given time
    function add30Minutes(time) {
        var splitTime = time.split(":");
        var hours = parseInt(splitTime[0]);
        var minutes = parseInt(splitTime[1]);

        // Add 30 minutes
        minutes += 30;
        if (minutes >= 60) {
            hours++;
            minutes -= 60;
        }

        // Format hours and minutes
        var formattedHours = hours < 10 ? "0" + hours : hours.toString();
        var formattedMinutes = minutes < 10 ? "0" + minutes : minutes.toString();

        return formattedHours + ":" + formattedMinutes; // Return the time with added 30 minutes
    }
	    	   
    </script>
</body>
</html>