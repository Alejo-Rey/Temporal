class Movie < ApplicationRecord
  has_many :functions
  def self.query_by_day(day)
    where(:day_function => day.to_datetime)
  end
end
