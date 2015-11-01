require 'spec_helper'

describe "Google translate" do
	before(:all) do
		@language = "niemiecki"
	end

	it "Go to google translate page" do
		visit(TranslateGooglePage)
	end
	it "Expand language switcher listbox" do
		on(TranslateGooglePage).language_switcher_element.when_present.click
	end
	it "Choose language" do
		puts "Select #{@language} language"
		on(TranslateGooglePage).select_language(@language)
	end
	it "Display text from language switcher" do
		puts on(TranslateGooglePage).language_switcher_element.text
	end
	it "Set text 'ost' in source language text field" do
		on(TranslateGooglePage).source_text_field = "ost"
	end
	it "Wait until translated text appears results box" do
		on(TranslateGooglePage).wait_until { on(TranslateGooglePage).result_box_element.text.length > 0 }
	end
	it "Display text from results box" do
		puts on(TranslateGooglePage).result_box_element.text
	end
end