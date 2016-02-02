require 'bundler'
# This is the same as running 'bundle exec rake'
# All gems will be required at the correct version
Bundler.setup

require 'ava/rake_task'
Ava::RakeTask.gem

task :version do
  puts CompImgTool::Version.version(true)
end
