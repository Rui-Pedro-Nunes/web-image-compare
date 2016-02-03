module CmpImgTool
  # BW config api Version
  module Version
    # The current gem version
    VERSION = '0.0.1'
    # The date version was updated
    DATE    = '2016-02-03'
    # Debug output that will contain ruby information
    MSG     = 'Version %s %s (running on %s-%s)'

    module_function

    # Outputs the current gem version
    def version(debug = false)
      if debug
        format(MSG, VERSION, DATE, RUBY_ENGINE,
               RUBY_VERSION)
      else
        VERSION
      end
    end
  end
end
