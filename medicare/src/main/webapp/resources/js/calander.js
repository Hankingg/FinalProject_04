/**
 * 
 */
   var today = new Date();
	function buildCalendar() {
	    var row = null;
	    var cnt = 0;
	    var calendarTable = document.getElementById("calendar");
	    var calendarTableTitle = document.getElementById("calendarTitle");
	    calendarTableTitle.innerHTML = today.getFullYear() + "년" + (today.getMonth() + 1) + "월";

	    var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
	    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

	    while (calendarTable.rows.length > 2) {
	        calendarTable.deleteRow(calendarTable.rows.length - 1);
	    }

	    var firstDayOfWeek = firstDate.getDay(); // 첫째 날의 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)
	    row = calendarTable.insertRow();

	    // 첫째 날 이전의 빈 칸 채우기
	    for (var i = 0; i < firstDayOfWeek; i++) {
	        cell = row.insertCell();
	        cnt += 1;
	    }

	    for (var i = 1; i <= lastDate.getDate(); i++) {
	        if (cnt % 7 == 0) {
	            row = calendarTable.insertRow();
	        }

	        cell = row.insertCell();
	        cnt += 1;

	        cell.setAttribute('id', i);
	        cell.innerHTML = i;
	        cell.align = "center";

	        cell.onclick = function () {
    var cellContent = this.innerHTML.trim();
    if (cellContent !== "") {
        var clickedYear = today.getFullYear();
        var clickedMonth = today.getMonth() + 1; // Note: Months are zero-based, so add 1 to get the correct month
        var clickedDate = parseInt(cellContent);

        // Format the clicked date
        clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
        clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
        var clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

        // Check if opener window is available
        if (opener !== null) {
            var dateInput = opener.document.getElementById("date");
            if (dateInput !== null) {
                dateInput.value = clickedYMD;
            } else {
                console.error("Element with ID 'date' not found in opener's document.");
            }
        } else {
            console.error("Opener window is null. Cannot access 'opener.document'.");
        }

        // Close the current window
        self.close();
    }
};
	    }
	    
	    
	}
	
	function prevCalendar(){
		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		buildCalendar();
	}
	
	function nextCalendar(){
		today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
		buildCalendar();
	}
	
	
	window.onload = function() {
        buildCalendar();
    };