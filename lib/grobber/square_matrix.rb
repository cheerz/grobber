class SquareMatrix

  attr_reader :array

  def initialize _array
    check_square(_array)
    @array = _array
  end

  def each_with_coords
    array.each_with_index do |e, i|
      yield e, *coords_for(i)
    end
  end

  def coords_for index
    [x_coord(index), y_coord(index)]
  end

  def array_length
    array.length
  end

  def length
    length_for array
  end

  def x_coord index
    index % length
  end

  def y_coord index
    (index / length)
  end

  def index_for x, y
    length * y + x
  end

  def flop_array
    array_length.times.map do |i|
      array[index_for(length - 1 - x_coord(i), y_coord(i))]
    end
  end

  def flop
    SquareMatrix.new flop_array
  end

  def flip_flop
    SquareMatrix.new flip_flop_array
  end

  def flip_flop_array
    right_add_array(flop) + flip.right_add_array(flip.flop)
  end

  def flip_array
    array_length.times.map do |i|
      array[index_for x_coord(i), length - 1 - y_coord(i)]
    end
  end

  def flip
    SquareMatrix.new flip_array
  end

  def right_add_array square_matrix
    length.times.flat_map do |i|
      line(i) + square_matrix.line(i)
    end
  end

  def bottom_add square_matrix
  end

  def length_for array
    (array.length ** 0.5).to_i
  end

  def check_square array
    length = length_for array
    raise "Non Square Matrix" unless array.length == length ** 2
  end

  def line i
    s_index = length * i
    array[s_index..s_index + length - 1]
  end

  def display
    length.times do |i|
      puts line(i).to_s
    end
  end

end
