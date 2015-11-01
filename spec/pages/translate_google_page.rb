class TranslateGooglePage
	include PageObject

	page_url "http://translate.google.com/"

	div(:language_switcher, id: "gt-sl-gms")
	div(:choose_language, id: "gt-sl-gms-menu")
	text_area(:source_text_field, id: "source")
	span(:result_box, id: "result_box")

	def select_language(lang)
		div_element(:class => /goog-menu/, :text => lang).click
	end
end
