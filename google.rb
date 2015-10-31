require 'watir-webdriver'
require 'pry'

#setup browser
browser = Watir::Browser.new :firefox
browser.goto "http://translate.google.com/"
 
language_button = browser.div(:id => "gt-sl-gms")
language_button.when_present.click
 
menu = browser.div(:id => "gt-sl-gms-menu")
menu.when_present.div(
  :class => /goog-menu/,
  :text => "norweski"
).div.click
 
puts language_button.text
 
browser.text_field(:id => "source").set("ost")
 
result_box = browser.span(:id => "result_box")
browser.wait_until { result_box.text.length > 0 }
 
puts result_box.text
browser.close