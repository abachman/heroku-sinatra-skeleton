gem 'dm-core', '= 0.10.2'
require 'dm-core'
require 'models'

if ENV['RACK_ENV'] == 'cucumber'
  # local machine - test
  puts "using cucumber database"
  DataMapper.setup(:default, {
    :database => 'ideator_cuke',
    :adapter  => 'postgres'
  })
else
  # local machine - dev and production
  DataMapper.setup(:default, ENV['DATABASE_URL'] || {
    :database => 'ideator_dev',
    :adapter  => 'postgres'
  })
end
