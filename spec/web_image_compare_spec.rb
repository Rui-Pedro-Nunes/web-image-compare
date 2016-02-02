require 'web_image_compare'

describe WebImageCompare do
  describe '.new' do
    it 'is a WebImageCompare instance' do
      image_path = File.dirname(__FILE__) +  '/images/example_image.png'
      expect(WebImageCompare.new(image_path, image_path)).to be_a WebImageCompare
    end
  end
end
