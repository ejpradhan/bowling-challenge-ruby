require 'frame'

class Game
  attr_reader :frames

  def initialize
    @frames = []
  end

  def calculate_current_score
    score = 0
    spare, strike, consecutive_strike = false
    @frames.each { |frame|
    score += frame.first_roll if spare
    score += (frame.first_roll + frame.second_roll) if strike
    score += (frame.first_roll) if consecutive_strike
    score += (frame.first_roll + frame.second_roll)
    consecutive_strike = strike && frame.strike
    spare, strike = frame.spare, frame.strike
    }
    return score
  end

  def add_frame(first_roll, second_roll)
    @frames << Frame.new(first_roll, second_roll) if @frames.length < 10
  end
end

  