#
class Game
  COMBINATIONS = {
    'scissors' => 'paper',
    'rock' => 'scissors',
    'paper' => 'rock'
  }.freeze

  def call(first_move, second_move)
    if first_move == second_move
      'draw'
    else
      "#{first_move} beats #{COMBINATIONS[first_move]}"
    end
  end

  def get_user_input
    puts 'Please select rock paper or scissor'
    gets.chomp
  end

  def play
    puts call(get_user_input, rand_choice)
  end

  private

  def rand_choice
    COMBINATIONS.keys.sample
  end
end
