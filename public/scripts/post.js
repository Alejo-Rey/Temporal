$("#create").click(function () {
    let name  = $("#name").val();
    let description  = $("#description").val();
    let url_img  = $("#url_img").val();
    let day  = $("#day").val();


    let dataJson = {movie: {name: name,
                            description: description,
                            url_img: url_img,
                            day_function: day}}
    console.log(name)
    console.log(typeof(JSON.stringify(dataJson.name)))
    $.post("http://localhost:3000/movies",
        dataJson).done(function(data){
            
        console.log("name: " + data);
    })
    $('#myModal').modal('toggle');
});