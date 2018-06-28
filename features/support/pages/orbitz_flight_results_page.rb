class OrbitzFlightResultsPage

  require_relative '../../support/modules/utilties'
  include PageObject
  include Utilities

  div(:search_results_title, :class => 'title-departure')
  spans(:flight_price, :class => 'full-bold no-wrap')

  def get_arr_results_are_correct arr_airport
    arr_date_format = date_in_results_format 2
    actual_title = "Select your departure to #{arr_airport} #{arr_date_format}"
  end

  def get_price_details
    all_prices = []
    flight_price_elements.each do |each_flight_price|
      all_prices << each_flight_price.text.gsub('$', '').gsub(',', '').to_i
    end
    p all_prices
    return all_prices
  end

end