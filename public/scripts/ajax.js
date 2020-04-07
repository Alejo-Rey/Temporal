$(document).ready(function(){
  $.get("http://localhost:3000/movies", function (data) {
    for (i in data) {
      $("#grid").append(
        "<div class='col-sm-3' style='padding: 5px;'><img src='"
        + data[i].url_img
        + "' class='img'></img></div>"
      );
      $("#date").append("<option id='"
        + data[i].day_function
        + "value='"
        + data[i].day_function
        + "'>"
        + data[i].day_function
        + "</option>"
      );
      console.log(data[i].day_function);
    }
  });
});
$("#date").change(function (){
  let selectDate = $(this).children("option:selected").val();
  console.log("selected date : " + selectDate);
  selectDate = selectDate === "NULL" ? null : selectDate;
  console.log(selectDate);
  $.get("http://localhost:3000/movies", { day: selectDate })
    .done(function(data){
      console.log(data)
      let str = "";
      
      for (i in data){
        str += "<div class='col-sm-3' style='padding: 5px;'><img src='"
                + data[i].url_img
                + "' class='img'></img></div>" 
      }
          $("#grid").html(str);
    });

});

