require_relative '../lib/web_image_compare'

describe WebImageCompare do
  describe '.new' do
    it 'is a WebImageCompare instance' do
      image_path = File.dirname(__FILE__) +  '/images/example_image.png'
      expect(WebImageCompare.new(image_path, image_path)).to be_a WebImageCompare
    end
  end

  describe '.process_image' do
    it 'is a perfect match' do
      image_path = File.dirname(__FILE__) +  '/images/example_image.png'
      compare_image = WebImageCompare.new(image_path, image_path)
      compare_image.process_image(false, {}).should eq(0.0)
    end
  end

  describe '.process_image' do
    it 'The images don\'t match' do
      image_path_1 = File.dirname(__FILE__) +  '/images/example_image.png'
      image_path_2 = File.dirname(__FILE__) +  '/images/example_image_2.png'
      compare_image = WebImageCompare.new(image_path_1, image_path_2)
      compare_image.process_image(false, {}).should_not eq(0.0)
    end
  end
end
