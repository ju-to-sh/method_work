puts <<~TEXT
       旅行プランを選択してください
       1. 沖縄旅行(¥10,000)
       2. 北海道旅行(¥20,000)
       3. 九州旅行(¥15,000)
     TEXT

input_plan_number = gets.to_i

puts "プランを選択 > #{input_plan_number}"

def disp_plan(plan_number)
  plans = { okinawa: "沖縄旅行", hokkaido: "北海道旅行", kyuushuu: "九州旅行" }
  case plan_number
  when 1
    plan_name = plans[:okinawa]
  when 2
    plan_name = plans[:hokkaido]
  when 3
    plan_name = plans[:kyuushuu]
  else
    puts "1~3の数値を入力してください"
    exit
  end
  puts "#{plan_name}ですね、何人で行きますか？"
end

disp_plan(input_plan_number)

input_member = gets.to_i

def total_price(plan_number, number_of_people)
  case plan_number
  when 1
    total_price = number_of_people * 10000
  when 2
    total_price = number_of_people * 20000
  when 3
    total_price = number_of_people * 15000
  end

  number_of_people >= 5 ? (total_price * 0.9).to_i : total_price
end

def disp_total_price(price, number_of_people)
  puts number_of_people >= 5 ? "5人以上なので10%割引となります" : ""
  puts "合計料金：#{price}"
end

total_price = total_price(input_plan_number, input_member)
disp_total_price(total_price, input_member)
