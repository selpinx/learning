require 'spec_helper'

describe "Google translate" do
	it "Go to google translate page" do
		@browser.goto "http://translate.google.com/"		
	end
	it "Expand language switcher listbox" do
		$language_button = @browser.div(:id => "gt-sl-gms")
		$language_button.when_present.click
	end
	it "Choose language norweski" do
		menu = @browser.div(:id => "gt-sl-gms-menu")
		menu.when_present.div(
  		:class => /goog-menu/,
  		:text => "norweski"
		).div.click
	end
	it "Display text from language switcher" do
		puts $language_button.text
	end
	it "Set text 'ost' in source language text field" do
		@browser.textarea(:id => "source").set("ost")
	end
	it "Wait until translated text appears results box" do
		$result_box = @browser.span(:id => "result_box")
		@browser.wait_until { $result_box.text.length > 0 }
	end
	it "Display text from results box" do
		puts $result_box.text
	end
end