  require "./pick_colors_class"
  require "./guess_colors_class"

  available_colors=%w(Red Blue Green Yellow Orange Purple)
  random_colors=[]
  vector2=[]
  option=nil

  #building the objects
  chooser=Pick.new(available_colors)
  guesser=Guess.new(vector2)

  #we are choosing 4 random colors (the colors can repeat themselves)
  4.times do
    random_colors.push(chooser.colors.sample)
  end
  puts random_colors