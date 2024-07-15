require "./pick_colors_class"
require "./guess_colors_class"

available_colors = %w[Red Blue Green Yellow Orange Purple]
random_colors = []
random_computer_colors = []
vector2 = []
indexes=[]
option = nil
color_right_position = 0
color_wrong_position = 0
turn = 0
# building the objects
chooser = Pick.new(available_colors)
guesser = Guess.new(vector2)

# generating an array of random colorsss
4.times do
  random_colors.push(chooser.colors.sample)
end
#guess the right color in the right position
def color_in_the_right_position(random_colors,vector2)

  color_right_position=0

  random_colors.each_with_index do |rnd_items, rnd_index|
    vector2.each_with_index do |vct2_items, vct2_index|
      if rnd_items == vct2_items && rnd_index == vct2_index
        color_right_position += 1
      end
    end
  end
  
  color_right_position

end
#guess the right color in the wrong position
def colors_wrong_position(random_colors,vector2)
  color_wrong_pos=0

  vector2.each_with_index do |items,index|
    if random_colors.include?(items) && random_colors[index] != items
      color_wrong_pos+=1
    end
  end

  color_wrong_pos
end
  #take the index where the computer got the position right
def get_index(random_colors,vector2)

  index_positions=[]
  random_colors.each_with_index do |rnd_items, rnd_index|
    vector2.each_with_index do |vct2_items, vct2_index|
      if rnd_items == vct2_items && rnd_index == vct2_index
        index_positions.push(rnd_index)
      end
    end
  end
  
  index_positions
end
while option != 1 && option != 2
  puts "What do you wanna be?"
  puts "1.Guesser"
  puts "2.Chooser"
  print "Your option is:"
  option = gets.chomp.to_i
  case option
  when 1
    puts "Tu ghicesti!"
    12.times do
      puts "Introdu 4 culori:"
      vector2.push(guesser.choose_colors(4))
      # checking whether my colors are included in the random colors vector.
      # we are also checking if i hit some colors that are on the same position as the random_colors
      puts "The computer chose: #{random_colors}"
      color_right_position=color_in_the_right_position(random_colors,vector2)
      color_wrong_position=colors_wrong_position(random_colors,vector2)
      puts "Colors in the right position:#{color_right_position} "
      puts "Colors in the wrong position: #{color_wrong_position}"
    end

  when 2
    # the human choosing the colors
    puts "Choose 4 colors:"
    4.times do
      vector2.push(gets.chomp)
    end

    while turn <= 12
      4.times do
          random_computer_colors.push(chooser.colors.sample)
     end

     indexes=get_index(random_computer_colors,vector2)
     color_right_position=color_in_the_right_position(random_computer_colors,vector2)
     color_wrong_position=colors_wrong_position(random_computer_colors,vector2)

      puts "Computerul a ales urmatoarele culori:#{random_computer_colors}"
     
      if color_right_position==4 && turn <= 12
        puts "A ghicit computerul!"
        break
      end

      turn += 1
      random_computer_colors.clear
      puts "Ai castigat! Computerul nu a reusit sa iti ghiceasca selectia!" if turn > 12

    end
  end
end
