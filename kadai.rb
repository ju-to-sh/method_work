require "csv"

def travel_plan(place)
  list = CSV.read("travel_plan.csv", headers: true).map do |row|
    { place: row["place"], price: row["price"] }
  end
  list.find { |data| data[:place] == place }
end

def disp_plan
  puts <<~TEXT
         旅行プランを選択してください
         1. 沖縄旅行(¥10,000)
         2. 北海道旅行(¥20,000)
         3. 九州旅行(¥15,000)
       TEXT
  print "プランを選択 > "
end

def disp_choice_plan(plan_number)
  case plan_number
  when 1
    plan_name = travel_plan("沖縄")[:place]
  when 2
    plan_name = travel_plan("北海道")[:place]
  when 3
    plan_name = travel_plan("九州")[:place]
  else
    puts "1~3の数値を入力してください"
    exit
  end
  puts "#{plan_name}ですね、何人で行きますか？"
end

def total_price(plan_number, number_of_people)
  case plan_number
  when 1
    total_price = number_of_people * travel_plan("沖縄")[:price].to_i
  when 2
    total_price = number_of_people * travel_plan("北海道")[:price].to_i
  when 3
    total_price = number_of_people * travel_plan("九州")[:price].to_i
  end

  number_of_people >= 5 ? (total_price * 0.9).to_i : total_price
end

def disp_total_price(price, number_of_people)
  puts number_of_people >= 5 ? "5人以上なので10%割引となります" : ""
  puts "合計料金：#{price}"
end

disp_plan
plan_number = gets.to_i
disp_choice_plan(plan_number)
number_of_people = gets.to_i
total_price = total_price(plan_number, number_of_people)
disp_total_price(total_price, number_of_people)
