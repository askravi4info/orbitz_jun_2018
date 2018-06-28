class OrbitzHomePage
  require_relative '../modules/utilties'

  include PageObject
  include Utilities

  page_url 'www.orbitz.com'

  button(:select_flight_tab, :id => 'tab-flight-tab-hp')
  label(:select_round_trip, :id => 'flight-type-roundtrip-label-hp-flight')
  text_field(:dep_airport, :id => 'flight-origin-hp-flight')
  ul(:list_of_airports, :id => 'typeaheadDataPlain')
  text_field(:arr_airport, :id => 'flight-destination-hp-flight')
  button(:search, :class => 'btn-primary btn-action gcw-submit ')
  text_field(:dep_date, :id => 'flight-departing-hp-flight')
  text_field(:arr_date, :id => 'flight-returning-hp-flight')
  div(:warning_messages, :class => 'alert-message')

  def get_data_from_yml
    # @file = YAML.load_file 'C:\Users\Ravi\Desktop\May 2018\orbitz_flight_search_june2018\features\test_data.yml'
    # p @file.fetch('request')
    # p @file['content']['session']
    #
    # @file['request'] = 33333
    # @file['content']['session'] = 2 #Modify
    #
    # File.open('C:\Users\Ravi\Desktop\May 2018\orbitz_flight_search_june2018\features\test_data.yml', "w") {|f| f.write(@file.to_yaml) }
    #
    # p @file.fetch('request')
    # p @file['content']['session']

    @data = YAML.load_file('C:\Users\Ravi\Desktop\May 2018\orbitz_flight_search_june2018\features\test_data\orbitz_flight_search_data.yml')
    p @data['dep_city_name']
    p @data['personal_details']['name']


  end

  def search_for_flights dep_city_name, dep_airport_name, arr_city_name, arr_airport_name, future_past
    select_flight_tab_element.click
    select_round_trip_element.click
    select_dep_airport 'columbus', 'Columbus, OH'
    select_arr_airport 'cleveland', 'Cleveland'
    if future_past == 'future'
      select_dep_date 2
      select_arr_date 2
    else
      select_dep_date -2
      select_arr_date -2
    end
    search_element.click
  end

  def select_dep_airport city_name, airport_name
    dep_airport_element.set city_name
    select_requested_airport airport_name
  end

  def select_arr_airport city_name, airport_name
    arr_airport_element.set city_name
    select_requested_airport airport_name
  end

  def select_dep_date no_of_days
    dep_date_element.set change_date no_of_days
  end

  def select_arr_date no_of_days
    arr_date_element.set change_date no_of_days
  end


  def select_requested_airport airport_code
    list_of_airports_element.when_visible.list_item_elements.each do |each_airport|
      p each_airport.text

      if each_airport.text.include? airport_code
        each_airport.click
        break
      end
    end
  end
end
