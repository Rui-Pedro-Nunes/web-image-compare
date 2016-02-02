module ChunkyPNG
  # Class Canvas
  class Canvas
    # Module operations
    module Operations
      # Performs the image comparison pixel by pixel
      #
      # @param [String] result_img complete path to where is intended save the image
      # @return [Float] Percentual difference between the two images
      # @return [Array] Difference image
      def compare_imgs(pattern_img)
        fail('height doesn\'t match betwwen the two images') unless pattern_img.height == height
        fail('width doesn\'t match betwwen the two images') unless pattern_img.width == width

        output = ChunkyPNG::Image.new(pattern_img.width, pattern_img.height, WHITE)

        diff = [0]
        pattern_img.height.times do |y|
          pattern_img.row(y).each_with_index do |pixel, x|
            next if pixel == self[x, y]
            score = pixel_difference(pixel, self[x, y])
            output[x, y] = ChunkyPNG.grayscale(MAX - (score * MAX).round)
            diff << score
          end
        end

        # Returns percentage difference and difference image
        [diff.inject { |a, e| a + e } / pattern_img.pixels.length * 100, output]
      end
    end

    private

    def pixel_difference(pixel_1, pixel_2)
      Math.sqrt(
          (r(pixel_1) - r(pixel_2))**2 +
              (g(pixel_1) - g(pixel_2))**2 +
              (b(pixel_1) - b(pixel_2))**2
      ) / Math.sqrt(MAX**2 * 3)
    end
  end
end
