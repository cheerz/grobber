module Grobber

  class Image

    attr_reader :base_color, :second_color, :signature

    def initialize string_base
      @signature = Digest::SHA1.hexdigest string_base
    end

    def base_color
      signature[9..14]
    end

    def second_color
      signature[15..20]
    end

    def to_rmagick size_px = 480
      new_base_image(size_px).tap do |magick|
        block_width = size_px / 6
        binary_matrix.each_with_coords do |b, x, y|
          next if b.zero?
          add_block magick, color_string(second_color), x, y, block_width
        end
      end
    end

    def write path
      magick = to_rmagick
      magick.write path
      magick.destroy!
      path
    end

    def binary_matrix
      @binary_matrix ||= SquareMatrix.new(binary_array).flip_flop
    end

    def color_matrix
      @color_matrix ||= generate_hexa_array
    end

    def generate_hexa_array
      binary_matrix.array.map do |b|
        b.zero? ? base_color : second_color
      end
    end

    def binary_array
      signature[0..8].split(//).map do |c|
        2 * c.hex / 16
      end
    end

    private

    def color_string hex_value
      "##{ hex_value }"
    end

    def add_block image, color, x, y, square_px
      origin_point = [x, y].map{ |c| c * square_px }
      end_point = [x, y].map{ |c| (c + 1) * square_px }
      draw_rectangle image, color, origin_point, end_point
    end

    def draw_rectangle image, color, origin_point, end_point
      p = Magick::Draw.new
      p.fill = color
      p.stroke_width(0)
      p.rectangle(*origin_point, *end_point)
      p.draw(image)
    end

    def new_base_image size_px
      _base_color = color_string(base_color)
      Magick::Image.new(size_px,size_px) do
        self.background_color = _base_color
      end.tap do |im|
        im.x_resolution = 300
        im.y_resolution = 300
      end
    end

  end

end
