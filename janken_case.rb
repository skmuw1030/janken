hands = ["グー","チョキ","パー","戦わない"]
directions = ["上","下","右","左"]
final_result = nil

loop do
  puts "じゃんけん..."
  puts "数字を入力してください。0:グー, 1:チョキ, 2:パー, 3:戦わない"
  input = gets.chomp

  unless ["0","1","2","3"].include?(input) 
    puts "不当な値です。もう一度入力してください。"
    next
  end
  user_hand = input.to_i
  
  if user_hand == 3
    puts "ゲームを終了します。"
    break
  end

  computer_hand = rand(3) 
  puts "ぽん"
  puts "-------------------------"
  puts "あなた：#{hands[user_hand]}"
  puts "相手：#{hands[computer_hand]}"
  puts "-------------------------"

  result = user_hand - computer_hand

  case 
  when result == 0
    puts "あいこです。もう一度じゃんけんしましょう。"
    next
  when [-1,2].include?(result)
    puts "あなたの勝ちです。あっち向いてホイで指さす方向を選んでください。"
  when [1,-2].include?(result)
    puts "あなたの負けです。あっち向いてホイで顔を向ける方向を選んでください。"
  end

  loop do
    puts "あっち向いて..."
    puts "0:上, 1:下, 2:右, 3:左"
    input = gets.chomp

    unless ["0","1","2","3"].include?(input)
    puts "不当な値です。もう一度入力してください。"
    next
    end
  
    user_direction = input.to_i

    computer_direction = rand(4)
    puts "ほい"
    puts "------------------------"
    puts "あなた：#{directions[user_direction]}"
    puts "相手：#{directions[computer_direction]}"
    puts "------------------------"

  case 
  when user_direction == computer_direction && [-1,2].include?(result)
    final_result = :win
    puts "あなたの勝ちです。ゲーム終了します。"
    exit
  when user_direction == computer_direction && [1,-2].include?(result)
    final_result = :lose
    puts "あなたの負けです。ゲーム終了します。"
    exit
  else
    break
  end
  end
end
