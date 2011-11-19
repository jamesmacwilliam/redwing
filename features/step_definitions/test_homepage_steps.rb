Given /^I am an unauthenticated user$/ do
  
end

When /^I visit the homepage$/ do
  visit "/"
end

When /^I click the "([^\"]*)" link$/ do |link_text|
  click_link link_text
end  

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field,text|
  fill_in field, :with => text
end

When /^I click the "([^\"]*)" button$/ do |button|
  click_on button
end

Then /^the page should error with "([^\"]*)"$/ do |error_text|
  page.should have_content(error_text)
end

Then /^the page should succeed with "([^\"]*)"$/ do |text|
  page.should have_content(text)
end
