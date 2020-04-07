$(document).ready(function(){

    let users = $.get("http://localhost:3000/bookings/resume")
    users.done(function(data){
        for (i in data) {
            $("#tableBody").append(
                "<tr><td>"
                + data[i].movie_name + "</td>"
                + "<td>" + data[i].user + "</td>"
                + "<td>" + data[i].email + "</td>"
                + "<td>" + data[i].identification + "</td>"
                + "<td>" + data[i].cellphone +
                "</td></tr>"
            );
        }
    });
    $.get("http://localhost:3000/functions", function(data) {
        
        for (i in data) {
            $("#dateBooking").append("<option value='"
            + data[i].day
            + "'>"
            + data[i].day
            + "</option>"
            );
        }
    })
})

$("#dateBooking").change(function (){
    let selectDate = $(this).children("option:selected").val();
    console.log("selected date : " + selectDate);
    selectDate = selectDate === "NULL" ? nill : selectDate;

    let bookings = $.get("http://localhost:3000/bookings/resume", { day: selectDate });
    bookings.done(function(data) {
        let str = ""
        for (i in data) {
            if (data[i].day == selectDate) {
                str += "<tr><td>"
                        + data[i].movie_name + "</td>"
                        + "<td>" + data[i].user + "</td>"
                        + "<td>" + data[i].email + "</td>"
                        + "<td>" + data[i].identification + "</td>"
                        + "<td>" + data[i].cellphone +
                        "</td></tr>";
            };
        }
        $("#tableBody").html(str);
    });

  
});