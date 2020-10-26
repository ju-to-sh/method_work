require "csv"
require "./method"

plans = CSV.read("travel_plan.csv", headers: true).map do |row|
  { id: row["id"].to_i, place: row["place"], price: row["price"] }
end

disp_plan(plans)
selected_plan = disp_selected_plan(plans)
input_number_of_people = number_of_people
total_price = total_price(selected_plan, input_number_of_people)
disp_total_price(total_price, input_number_of_people)
