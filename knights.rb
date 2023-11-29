class Knight 
  attr_accessor :position

  def initialize(position = nil)
    @position = position
  end

  def valid_moves
    moves = [ 
            [1, 2], [-1, 2], [1, -2], [-1, -2], 
            [2, 1], [-2, 1], [2, -1], [-2, -1] 
            ]
    moves.select { |move| move[0].between?(1, 8) && move[1].between?(1,8) }
  end

  def knight_moves(start, finish)
    return "Starting and ending positions are the same" if start == finish
    start = @position
    queue = []
    visited = []
    queue.push(start)
    until queue.empty?
      current_position = queue.shift
    end
  end
end

knight = Knight.new
knight.knight_moves