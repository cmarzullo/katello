require 'chefspec'
require 'chefspec/berkshelf'

# http://betterspecs.org/#expect
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.color_enabled = true
end

at_exit { ChefSpec::Coverage.report! }
