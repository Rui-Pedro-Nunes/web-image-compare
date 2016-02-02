require 'chunky_png'
require_relative 'chunky_png/operations'

# Compare image class
class WebImageCompare
  include ChunkyPNG::Color

  # inizialize the object with the path for the two images
  #
  # @param pattern_file_path [String] Path for the pattern image
  # @param img_to_compare_path [String] Path for the image that it is to compare
  def initialize(pattern_file_path, img_to_compare_path)
    @img_to_compare_path  = img_to_compare_path
    @pattern_img_path     = pattern_file_path
    @pattern_img          = ChunkyPNG::Image.from_file(pattern_file_path) if File.file?(pattern_file_path)
    @img_to_compare       = ChunkyPNG::Image.from_file(img_to_compare_path) if File.file?(img_to_compare_path)
  end

  # Performs the actions to obtain the final image and then
  # perfoms the image comparison
  #
  # @param record_mode [Boolean] true - saves the pattern image, false - performs the image comparison
  # @param elements [Hash] Elements to hide or?and crop
  # @return [Float] Percentual difference between the two images
  def process_image(record_mode, elements = {})
    # hide the elements if necessary
    hide_all_elements(elements[:hide], @img_to_compare) if elements[:hide]

    # crop the element if necessary
    crop_element(elements[:crop]) if elements[:crop]

    diff_perc = nil
    if record_mode
      @img_to_compare.save(@pattern_img_path)
      return 0
    else
      diff_perc, result_img = @img_to_compare.compare_imgs(@pattern_img)
      @img_to_compare.save("#{@img_to_compare_path}")
      result_img.save("#{@img_to_compare_path}_result")
    end
    diff_perc
  end

  private

  def hide_all_elements(elements, image)
    elements.each do |element|
      x1, y1, x2, y2 = coordinates(element)
      image = image.rect(x1, y1, x1 + x2, y1 + y2, ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)
    end
  end

  def crop_element(element_to_crop)
    x1, y1, x2, y2 = coordinates(element_to_crop)
    @img_to_compare.crop!(x1, y1, x2, y2)
  end

  def coordinates(element)
    coordinates = []
    coordinates[0] = element.native.location.x.round
    coordinates[1] = element.native.location.y.round
    coordinates[2] = element.native.size.width.round
    coordinates[3] = element.native.size.height.round
    coordinates
  end
end
