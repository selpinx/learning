require 'watir-webdriver'
require 'pry'
require 'require_all'
require 'page-object'
require 'watir-webdriver'

require_rel 'pages'

RSpec.configure do |config|
	config.include PageObject::PageFactory

	config.before do
		@browser = Watir::Browser.new :firefox
		@browser.window.resize_to 1200, 850
		@browser.windows.move_to 0, 0
	end

	config.after do
		@browser.close
	end
end




		 