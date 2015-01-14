require 'open-uri'

class ForecastsController < ApplicationController
  def display_form_to_user
  end

  def location

    # params = {"address"=>"5807+S+Woodlawn+Ave"}

    @url_safe_address = URI.encode(params[:address])

    geocoding_api_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}"

    raw_results = open(geocoding_api_url).read

    parsed_results = JSON.parse(raw_results)

    @latitude = parsed_results["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_results["results"][0]["geometry"]["location"]["lng"]

    forecast_api_url = "https://api.forecast.io/forecast/03cc290f7831236148648675effe2c52/#{@latitude},#{@longitude}"

    raw_results = open(forecast_api_url).read

    parsed_results = JSON.parse(raw_results)

    @forecast_results = parsed_results
  end
end
