# Compare Image tool
A tool to compare images from web elements. It is designed to work with Web elements from Capybara (from now on all the references to web elements will be relative to the web elments from capybara) and PNG images.


## What it does?
With this tool it is possible crop or hide web elements before perform the image comparison.
The crop operation is based on the web element location and in the crop operation already available in the chunky_png gem.
The hide feature, is basically, overlap the specific web elment with a black rectangule. It can be used to hide web elements that are always changing, like for example clocks.

## Usage
To use the compare image tool you just have to require the web image compare tool, create an object from WebImageCompare class and then, perform the image comparison calling the 'process_image' method.

The first argument of the 'process_image' method is to define one of two modes:
 true  - it will record the pattern that will be used in posterior comparisons and it desn't perform any comparison;
 false - it will perform the image comparison between the pattern image and the new image, both identified when the object was initialized;

The second argument is an hash than can have two keys (both of them should be symbols):
  crop - should be the element by which the image will be cropped
  hide - Should be an array with all the elements to hide

The result of the image comparison process, wil be the percentual difference between the two images.


###Example:

```ruby
require 'WebImageCompare'
require 'capybara' # as mentioned the gem works with web elements from capybara

# Inizialize the browser and navigate to the web page desired
# with capybara

elements = {
  crop: elem_to_crop'
  hide: [elem_to_hide_1, elem_to_hide_2]
}

compare_image = WebImageCompare.new(img_pattern_path, img_to_compare_path)
compare_image.process_image(record_mode, elements)
```

##Tests

There are a number of unit tests which are included as part of this project, please run:

```
rspec spec
```

Please note that a number of tests still need to be added so I don't currently have complete coverage, subject to workload these will be slowly added over the next few months.


## Limitations
It has the same limitations as the chunky_png, since it is based on it.
