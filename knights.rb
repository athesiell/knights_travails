class Knight 
  attr_accessor :position

  def initialize(position = nil)
    @position = position
  end

  def valid_moves(position)
    moves = [ 
            [1, 2], [-1, 2], [1, -2], [-1, -2], 
            [2, 1], [-2, 1], [2, -1], [-2, -1] 
            ]
    possible_moves = moves.map { |move| [move[0] + position[0], move[1] + position[1]] }        
    possible_moves.select { |move| move[0].between?(1, 8) && move[1].between?(1,8) }
  end

  def knight_moves(start, finish)
    return puts "Starting and ending positions are the same" if start == finish

    queue = []
    visited = []
    queue.push(start)
    until queue.empty?
      queue.length.times do
        current_position = queue.shift
        visited.push(current_position)

        return display_path(visited, start, finish) if current_position == finish

        valid_moves(current_position).each do |move|
          if !visited.include?(move) || !queue.include?(move)
            queue.push(move)
          end
        end
      end
    end
    return 'No possible moves'
  end

  def display_path(visited_pos, start_pos, finish_pos)
    path = []
    position = finish_pos
    while position != start_pos
      path.unshift(position) # better to use unshift instead of push because of the order
      position = visited_pos.find { |move| valid_moves(move).include?(position) }
    end
    path.unshift(start_pos)
    
    puts "You made it in #{path.length - 1} moves. Here's your path"
    path.each { |pos| print "#{pos}\n" }
  end
end

knight = Knight.new
knight.knight_moves([0,0],[3,3])