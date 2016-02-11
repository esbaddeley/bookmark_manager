require 'data_mapper'
require './app/app.rb'

namespace :database do

  desc "no destructire upgrade"
  task :auto_update do
    DataMapper.auto_upgrade!
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
  end

end
