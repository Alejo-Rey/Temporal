class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :function

  def self.bookings_resume(day)

    bookings = []

    bookings = where(:day => day.to_datetime) if day 
    bookings = all unless day

    bookings.map do |b| 
        {
          movie_name: b.function.movie.name,
          user: b.user.name,
          email: b.user.email,
          identification: b.user.identification,
          cellphone: b.user.cellphone,
          day: b.function.day
        }
    end
    
  end
end
