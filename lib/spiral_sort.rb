# frozen_string_literal: true

# == Requirement ==
# - Your objective is to complete a function createSpiral(N)
# receives an integer N and returns a two--dimensional array where
# numbers from 1 to N should be represented as clockwise spiral.
# - Return an empty array if N < 1
class SpiralSort
  def createSpiral(num_of_elements)
    # Difine a @matrix with values initiated to 0
    @matrix = Array.new(num_of_elements) { Array.new(num_of_elements) { 0 } }

    # Set the boundaries, to control filling up and ending the loop
    #         min_col   max_col
    #  min_row [  0   0   0 ]
    #          [  0   0   0 ]
    #  max_row [  0   0   0 ]
    max_col = num_of_elements - 1
    max_row = num_of_elements - 1
    min_col = 0
    min_row = 0
    current_index = 0

    process_matrix(num_of_elements, max_col, max_row, min_col, min_row, current_index)
  end

  private

  def process_matrix(num_of_elements, max_col, max_row, min_col, min_row, current_index)
    # "divide and conquer" aka print one direction each time. Repeat until all cells are filled
    for i in 1..num_of_elements * num_of_elements do
      break if min_col > max_col

      # top row, going right
      for col in min_col..max_col do
        current_index += 1
        @matrix[min_row][col] = current_index;
      end
      # increase minRow since top row is done
      min_row += 1

      # right column, going down
      for row in min_row..max_row do
        current_index += 1
        @matrix[row][max_col] = current_index;
      end
      # deacrease maxCol since rightmost is done
      max_col -= 1;

      break if min_col > max_col

      # bottom row, going left
      for col in max_col.downto(min_col) do
        current_index += 1
        @matrix[max_row][col] = current_index;
      end
      # deacrease maxRow since bottom is done
      max_row -= 1;

      # going up
      for row in max_row.downto(min_row) do
        current_index += 1
        @matrix[row][min_col] = current_index;
      end
      # increase min_col since leftmost colum is done
      min_col += 1;
    end

    @matrix
  end
end
