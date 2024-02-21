# frozen_string_literal: true

require 'minitest/autorun'
require '../lib/spiral_sort'

# Test for SpiralSort class
class SpiralSortTest < Minitest::Test
  def setup
    spiral_sort = SpiralSort.new
    @spiral_sort = spiral_sort.method(:createSpiral)
  end

  # empty array
  def test_spiral_sort_empty_array
    assert_equal @spiral_sort.call(0), []
  end

  # inner array with three elements
  def test_spiral_sort_inner_array_with_tree_elements
    assert_equal @spiral_sort.call(3), [[1, 2, 3], [8, 9, 4], [7, 6, 5]]
  end

  # inner array with four elements
  def test_spiral_sort_inner_array_with_four_elements
    assert_equal @spiral_sort.call(4), [[1, 2, 3, 4], [12, 13, 14, 5], [11, 16, 15, 6], [10, 9, 8, 7]]
  end

  # inner array with five elements
  def test_spiral_sort_inner_array_with_five_elements
    assert_equal @spiral_sort.call(5), [[1, 2, 3, 4, 5], [16, 17, 18, 19, 6], [15, 24, 25, 20, 7],
                                        [14, 23, 22, 21, 8], [13, 12, 11, 10, 9]]
  end
end
