# require 'matrix'
require_relative 'cell'
class Game
  def initialize
    @size = 4
    @board = [[0,1,1,0],
              [1,0,1,1],
              [1,0,1,1],
              [1,0,1,1]]
  end

  def build
    # Matrix.build(4){rand(0..1)}
    @board
  end

  def neighbours(row, column)
    neighbours = []
    neighbours.push(@board[row-1, column]) if inside_board?(row-1, column)
    neighbours.push(@board[row-1, column+1]) if inside_board?(row-1, column+1)
    neighbours.push(@board[row, column+1]) if inside_board?(row, column+1)
    neighbours.push(@board[row+1, column+1]) if inside_board?(row+1, column+1)
    neighbours.push(@board[row+1, column]) if inside_board?(row+1, column)
    neighbours.push(@board[row+1, column-1]) if inside_board?(row+1, column-1)
    neighbours.push(@board[row, column-1]) if inside_board?(row, column-1)
    neighbours.push(@board[row-1, column-1]) if inside_board?(row-1, column-1)
    neighbours.count(1)
  end
  
  def read
    temp_board = @board.dup
    (0..9).each do |row|
      (0..9).each do |column|
        cell = @board[row, column]
        status = Cell.new.alive?(cell)
        alive_neighbours = neighbours(row,column)
        if status && alive_neighbours >=4
          temp_board[row, column] = 0
        elsif status && alive_neighbours >=2
          temp_board[row, column] = 1
        elsif status && alive_neighbours <=1
          temp_board[row, column] = 0
        elsif status == false && alive_neighbours == 3
          temp_board[row, column] = 1
        end
      end
    end
    temp_board
  end

  def inside_board?(row, column)
    row < @size && row >= 0 && column < @size && column >= 0
  end

  def print_board
    # Esto nos ayuda para hacer la matrix en cuadrito
    @board.to_a.each {|r| puts r.inspect}
  end
end

game = Game.new
game.build
game.print_board
game.read
puts "= "*50
game.print_board
