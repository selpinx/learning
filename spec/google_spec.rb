require 'spec_helper'

describe "Check google translations from source language to Polish" do
	before(:all) do
		language = "niemiecki"
		words = ["ost", "wschód"]
		@language_translation = {language => words}
	end

	it "Go to google translate page" do
		visit(TranslateGooglePage)
	end
	it "Expand language switcher listbox" do
		on(TranslateGooglePage).language_switcher_element.when_present.click
	end
	it "Choose language" do
		puts "Select #{@language_translation.keys[0]} language"
		on(TranslateGooglePage).select_language(@language_translation.keys[0])
	end
	it "Display text from language switcher" do
		puts on(TranslateGooglePage).language_switcher_element.text
	end
	it "Set text in source language text field" do
		puts "text to translate: #{@language_translation.values[0][0]}"
		on(TranslateGooglePage).source_text_field = @language_translation.values[0][0]
	end
	it "Wait until translated text appears results box" do
		on(TranslateGooglePage).wait_until { on(TranslateGooglePage).result_box_element.text.length > 0 }
	end
	it "Check that text from results box is correctly translated" do
		current_translation = on(TranslateGooglePage).result_box_element.text
		expect(current_translation).to eq(@language_translation.values[0][1])
	end
end