Given(/^user is on orbitz home page$/) do
  visit OrbitzHomePage
end

When(/^user selects flight icon$/) do
  on(OrbitzHomePage).select_flight_tab_element.click
end

And(/^user choose round trip flight search$/) do
  on(OrbitzHomePage).select_round_trip_element.click
end

And(/^user search for the city (.+) and select the departure airport (.+)$/) do |city_name, airport_name|
  on(OrbitzHomePage).select_dep_airport city_name, airport_name

  # @data = YAML.load_file('C:\Users\Ravi\Desktop\May 2018\orbitz_flight_search_june2018\features\test_data\orbitz_flight_search_data.yml')
  # on(OrbitzHomePage).select_dep_airport @data['qa']['dep_city_name'], airport_name
end

And(/^user search for the city (.+) and select the arrival airport (.+)$/) do |city_name, airport_name|
  on(OrbitzHomePage).select_arr_airport city_name, airport_name
end

And(/^select the (future|past) date as departing date$/) do |future_or_past|
  if future_or_past == 'future'
    on(OrbitzHomePage).select_dep_date 2
  else
    on(OrbitzHomePage).select_dep_date -2
  end
end

And(/^select the (future|past) as arrival date$/) do |future_or_past|
  if future_or_past == 'future'
    on(OrbitzHomePage).select_arr_date 2
  else
    on(OrbitzHomePage).select_arr_date -2
  end
end

And(/^click on the search button$/) do
  on(OrbitzHomePage).search_element.click
end

Then(/^user should see the results related to the (.+)$/) do |arr_airport|
  # sleep 5
  actual_title = on(OrbitzFlightResultsPage).search_results_title_element.when_visible(60).text
  expected_title = on(OrbitzFlightResultsPage).get_arr_results_are_correct arr_airport
  # fail "#{actual_title} is Not same as #{expected_title}" unless actual_title == expected_title
  expect(actual_title).should eq expected_title

end

And(/^user should see the following/) do |table|
  # table is a table.hashes.keys # => [:Dates must be between 6/11/2018 and 5/7/2019.]
  table.hashes.each do |x|
    # p x[:error_messages]
    on(OrbitzHomePage).warning_messages_element.text.match /Dates must be between \d\/\d{2}\/\d{4} and \d\/\d{2}\/\d{4}/
  end
end

When(/^user search for the future flights$/) do
  on(OrbitzHomePage).search_for_flights 'columbus', 'Columbus, OH', 'cleveland', 'Cleveland', 'future'

    # on(OrbitzHomePage) do |page|
    #   page.select_flight_tab_element.click
    #   page.select_round_trip_element.click
    #   page.select_dep_airport 'columbus', 'Columbus, OH'
    #   page.select_arr_airport 'cleveland', 'Cleveland'
    #   page.select_dep_date 2
    #   page.select_arr_date 2
    #   page.search_element.click
    # end

    # Step 'user selects flight icon'
    # Step 'user choose round trip flight search'
    # Step "user search for the city #{boston} and select the departure airport #{Boston}"
    # Step 'user search for the city cleveland and select the arrival airport Cleveland'
    # Step 'select the future date as departing date'
    # Step 'select the future as arrival date'
    # Step 'click on the search button'

    # Steps%Q {
    #   When user selects flight icon
    #   And user choose round trip flight search
    #   And user search for the city columbus and select the departure airport Columbus, OH
    #   And user search for the city cleveland and select the arrival airport Cleveland
    #   And select the future date as departing date
    #   And select the future as arrival date
    #   And click on the search button

    # }
end


Then(/^user should see the results flights related to the arrival airport$/) do
  actual_title = on(OrbitzFlightResultsPage).search_results_title_element.when_visible(60).text
  expected_title = on(OrbitzFlightResultsPage).get_arr_results_are_correct 'Cleveland'
  # fail "#{actual_title} is Not same as #{expected_title}" unless actual_title == expected_title
  expect(actual_title).should eq expected_title
end

Then(/^user should have access to the data in yml files$/) do
  on(OrbitzHomePage).get_data_from_yml
end

Then(/^verify the available flights are displayed by sort order of price$/) do
  actual_prices = on(OrbitzFlightResultsPage).get_price_details
  sorted_prices = actual_prices.sort
  fail "#{actual_prices} is not same as #{sorted_prices}" unless actual_prices == sorted_prices
end