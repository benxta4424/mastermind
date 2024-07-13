  require "./pick_colors_class"
  require "./guess_colors_class"


  available_colors=%w(Red Blue Green Yellow Orange Purple)
  random_colors=[]
  vector2=[]
  single_color=[]
  right_color_and_position=[]
  option=nil
  color_right_position=0
  color_wrong_position=0

  #building the objects
  chooser=Pick.new(available_colors)
  guesser=Guess.new(vector2)
    
  #we are choosing 4 random colors (the colors can repeat themselves)
  4.times do
    random_colors.push(chooser.colors.sample)
  end
  
  
  12.times do

    vector2.push(guesser.choose_colors(4))
    #checking whether my colors are included in the random colors vector.
    #we are also checking if i hit some colors that are on the same position as the random_colors
    random_colors.each_with_index do |rnd_items,rnd_index|
      vector2.each_with_index do |vct2_items,vct2_index|
        if rnd_items==vct2_items && rnd_index==vct2_index
          color_right_position+=1
          right_color_and_position.push(vct2_index)
        end
      end
    end

    #checks if current color is included in the random_colors array
    vector2.each do |items|
      if random_colors.include?(items) && !single_color.include?(items) && !right_color_and_position
        single_color.push(items)
        color_wrong_position+=1
      end
    end

    puts "Index counter:"
    puts color_right_position
    puts "Color counter:"
    puts color_wrong_position
    puts "Culorile random sunt:#{random_colors}"

    if color_right_position==4
      puts "Ai castigat!"
      break
    end

    color_right_position=0
    color_wrong_position=0
    vector2.clear
    right_color_and_position.clear
    single_color.clear

  end
