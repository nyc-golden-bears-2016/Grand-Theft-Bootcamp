require_relative 'views'
require_relative 'crime_record_model'

class Controller

  attr_reader :view, :number_of_crimes, :model

  def initialize
    @number_of_crimes = 0
    @location = ""
    @month = ""
    @year = ""
    @view = Views.new
    @model = CrimeRecord.new
  end


  def run
    response = ""
    while response.downcase !=  "exit"
      view.welcome
      sleep(1)
      search = view.prompt_for_search
      sleep(0.5)
      month = view.prompt_for_month
      date = view.prompt_for_day
      year = view.prompt_for_year
      view.clear_screen
      case search
        when "1"
          crime = view.prompt_for_crime
          case crime
            when "1"
              model.by_date(year, month, date)
              number_of_crimes = model.by_crime("FELONY ASSAULT").count
              view.print_results(number_of_crimes)
              response = view.keep_going
              view.clear_screen
            when "2"
              model.by_date(year, month, date)
              number_of_crimes = model.by_crime("GRAND LARCENY").count
              view.print_results(number_of_crimes)
              response = view.keep_going
              view.clear_screen
            when "3"
              model.by_date(year, month, date)
              number_of_crimes = model.by_crime("ROBBERY").count
              view.print_results(number_of_crimes)
              response = view.keep_going
              view.clear_screen

          end
        when "2"
          location = view.prompt_for_neighborhood
          case location
            when "1"
              model.by_date(year, month, date)
              number_of_crimes = model.by_neighborhood("MIDTOWN").count
              response = view.keep_going
              view.clear_screen
            when "2"
              model.by_date(year, month, date)
              number_of_crimes = model.by_neighborhood("CHINATOWN").count
              response = view.keep_going
              view.clear_screen
            when "3"
              model.by_date(year, month, date)
              number_of_crimes = model.by_neighborhood("ALPHABET CITY").count
              response = view.keep_going
              view.clear_screen
            when "4"
              model.by_date(year, month, date)
              number_of_crimes = model.by_neighborhood("HARLEM").count
              response = view.keep_going
              view.clear_screen
          end
      end
    end
  end
end
