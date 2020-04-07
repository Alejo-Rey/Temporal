# API of booking movies
This API is build to booking services of movies
_______

## Controllers

Resource 	   | HTTP Verb       |
--------------- | --------------- |
movies | GET, POST, PUT, DELETE |
bookings | GET, POST, PUT, DELETE |
functions | GET, POST, PUT, DELETE |
users | GET, POST, PUT, DELETE |


## How to run it

`git clone https://github.com/Alejo-Rey/movies_booking.git`

`cd movies_share`

`bundle install`

`./create.sh`

 `rails server --binding 0.0.0.0 --port 3000`


## Endpoints

### /movies

`curl -X GET 'http://localhost:3000/movies'`\
To show all the movies

`curl -X GET 'http://localhost:3000/movies' -d '{"day": "2020-02-20T02:50:00.000Z"}'`\
To show an especific movie filter by a date

`curl -X POST 'http://localhost:3000/movies' -d '{"name":"movie 5","description":"descriotion movie 5","url_img":"url image 5","day_function":"2020-02-20T02:50:00.000Z"}'`\
To create a movie

### /functions

`curl -X GET 'http://localhost:3000/functions/'`\
To show all the functions

`curl -X POST 'http://localhost:3000/functions/' -d '{"day": "2020-02-20T02:50:00.000Z", "num_chairs": 10, "movie_id": "1"}'`\
To create a function of one movie at day

### /users

`curl -X GET 'http://localhost:3000/users/'`\
To show all the users

`curl -X POST 'http://localhost:3000/users/' -d '{"identification": 1111, "name": "user 1", "email": "email 1", "cellphone": "cel 1"}'`\
To create an user

### /bookings

`curl -X GET 'http://localhost:3000/bookings/'`\
To show all the bookings

`curl -X POST 'http://localhost:3000/bookings/' -d '{"booking": {"day": "2020-04-04T02:16:41.435Z", "function_id": 1, "identification": 222, "name": "user 2", "email": "email 2"}}'`\
To create a booking of one function


 ## Author
 * **Alejo-Rey** - [Alejo-Rey](https://github.com/Alejo-Rey)
