require "csv"
require "pry"

plans = CSV.read("travel_plan.csv", headers: true).map do |row|
  { id: row["id"], place: row["place"], price: row["price"] }
end

def disp_plan(plans)
  puts "旅行プランを選択してください"
  plans.each do |plan|
    puts "#{plan[:id]}. #{plan[:place]}旅行(¥#{plan[:price]})"
  end
  print "プランを選択 > "
end

def disp_choice_plan(plan_number, plans)
  while plan_number > plans.size || plan_number <= 0
    puts "1〜#{plans.size}の間で入力し直してください"
    plan_number = gets.to_i
  end
  plan_name = plans[plan_number - 1][:place]
  puts "#{plan_name}ですね、何人で行きますか？"
  plans[plan_number - 1]
end

def member(number_of_people)
  while number_of_people <= 0
    puts "人数は0人以上にして下さい"
    number_of_people = gets.to_i
  end
  number_of_people
end

def total_price(choice_plan, number_of_people)
  total_price = number_of_people * choice_plan[:price].to_i
  number_of_people >= 5 ? (total_price * 0.9).to_i : total_price
end

def disp_total_price(price, number_of_people)
  puts number_of_people >= 5 ? "5人以上なので10%割引となります" : ""
  puts "合計料金：#{price}"
end

disp_plan(plans)
plan_number = gets.to_i
choice_plan = disp_choice_plan(plan_number, plans)
number_of_people = gets.to_i
input_member = member(number_of_people)
total_price = total_price(choice_plan, input_member)
disp_total_price(total_price, input_member)
