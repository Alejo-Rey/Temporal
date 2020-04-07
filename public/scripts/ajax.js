$(document).ready(function(){
  $.get("http://localhost:3000/movies", function (data) {
    for (i in data) {
      $("#grid").append(
        "<div class='col-sm-3' style='padding: 5px;'><img src='"
        + data[i].url_img
        + "' class='img'></img></div>"
      );
      $("#date").append("<option value='"
        + data[i].day_function
        + "'>"
        + data[i].day_function
        + "</option>"
      );

      console.log(data[i].day_function);
    }
  });

  $("#date").click(function (e){
    let selectDate = $("#date :selected").val();
    console.log("selected date : " + selectDate);

    if (selectDate){
      $.get("http://localhost:3000/movies", { day: selectDate })
        .done(function(data){
          for (i in data){
            $("#grid").html(
              "<div class='col-sm-3' style='padding: 5px;'><img src='"
              + data[i].url_img
              + "' class='img'></img></div>"
            );
            console.log("new get: " + data[0].name)
          }
        });
    }
  });


  

});