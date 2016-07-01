require 'open-uri'
require 'JSON'
require 'pry'

# Longitude coordinates for each neighborhood
BORDER =
  {MIDTOWN: {
    BOTTOM: -73.995531,
    TOP: -73.989983
  },
  CHINATOWN: {
    TOP: -73.991452,
    BOTTOM: -74.002122
  },
  HARLEM: {
    TOP: -73.939523,
    BOTTOM: -73.949779
  },
  ALPHABET_CITY: {
    TOP: -73.984684,
    BOTTOM: -73.982562
  }
  }

class CrimeRecord

  attr_reader :file

  def initialize#(file)
  end

  def by_date(year, month, date)

    url = "https://data.cityofnewyork.us/resource/dvh8-u7es.json?borough=MANHATTAN&occurrence_year=" + year.to_s + "&occurrence_month=" + month + "&occurrence_day=" + date.to_s

      @file = JSON.parse(open(url).read)
     # @file
#    puts "There were #{file.count} cases of #{crime}"

  end

  def by_crime(crime)
    @file.select { |offense| offense["offense"] == crime }
  end



  def by_neighborhood(area)



    area_bottom = BORDER[area.to_sym][:BOTTOM]
    area_top = BORDER[area.to_sym][:TOP]
    neighbor_crimes = []



    file.select do |neighborhood|

      longitude = neighborhood["location_1"]["longitude"].to_f

      if longitude.round(6) <= area_bottom &&
        longitude.round(6) >= area_top
        neighbor_crimes << neighborhood
      end

      neighbor_crimes
    end
  end


end
