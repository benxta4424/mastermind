class Guess
  attr_accessor :guess_array

  def initialize(guess_arr)
    self.guess_array = guess_arr
  end

  def choose_colors(how_many_times)
    how_many_times.times do
      guess_array.push(gets.chomp.to_s)
    end
  end
end
