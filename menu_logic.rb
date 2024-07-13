while option != 1 && option != 2
  puts "What do you wanna be?"
  puts "1.Guesser"
  puts "2.Chooser"

  option = gets.chomp.to_i
  case option
  when  1
    puts "TU ghicesti"
  when  2
    puts "TU alegi"
  else
    puts "Alege din nou"
  end

end
