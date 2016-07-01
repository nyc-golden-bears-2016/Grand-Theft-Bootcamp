class Views

  def welcome
      welcome_message = <<-'MESSAGE'
---------------------------------------------------------------------
*********************************************************************
---------------------------------------------------------------------
 __  __           ___  __                  __           __   __   __
/   |__) |  |\/| |__  /__   | |\ |    \ / /  \    |__| /  \ /  \ |  \
\__ |  \ |  | || |___ __/   | | \|     |  \__/    |  | \__/ \__/ |__/
---------------------------------------------------------------------
*********************************************************************
---------------------------------------------------------------------

MESSAGE

  puts welcome_message

  end

  def prompt_for_neighborhood
    location_list = <<-'LOCLIST'
 ____________________________________________________________________
|                                                                    |
|    ******************     Neighborhoods     *******************    |
|                                                                    |
|--> 1.Midtown  --> 2.Chinatown  --> 3.Alphabet City --> 4.Harlem    |
|____________________________________________________________________|
LOCLIST


    puts "What hood you reppin?"
    puts location_list
    gets.chomp
  end

  def prompt_for_crime
    crime_list = <<-'CRIMELIST'

 ____________________________________________________________________
|                                                                    |
|    ******************  Criminal Activities  *******************    |
|                                                                    |
| ---> 1. Felony Assault   ---> 2. Grand Larceny  ---> 3. Robbery    |
|____________________________________________________________________|

CRIMELIST

    puts "Pick a crime, playa!"
    puts crime_list
    gets.chomp

  end

  def prompt_for_search
    searches = <<-'SEARCH'
 ____________________________________________________________________
|                                                                    |
|    ******************    Search Methods    *******************     |
|                                                                    |
|      ----> 1. By Crime                ----> 2. By Hood             |
|____________________________________________________________________|
SEARCH
  puts "How we lookin it up?"
  puts searches
  gets.chomp

  end

  def prompt_for_day
    puts "And how about the day?"
    gets.chomp
  end

  def prompt_for_month
    puts "What month we talkin?"
    gets.chomp
  end

  def prompt_for_year
    puts "How about the year?"
    gets.chomp
  end


  def print_results(number)
    puts "Yo dawg! There were a total of #{number} crimes"
    # puts "The overall crime score of #{location} is #{score}"
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def keep_going
    puts "type 'exit' when you are finished, otherwise search again my man!"
    gets.chomp
  end
end

