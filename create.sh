#!/bin/bash
rails generate scaffold movie name description url_img day_function:datetime
rails generate scaffold function movie day:datetime num_chairs:integer movie:references
rails generate scaffold user identification:integer name email cellphone
rails generate scaffold booking day:datetime user:references function:references
rake db:create
rake db:migrate
