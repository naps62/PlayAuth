Given /^I am signed out$/ do
	if !@user.nil?
		click_link 'Sign Out'
	true
end


#And /^I am on the '(.*)' page do
#end

Then /^I should print '(.*)'$/ do |output|
	print output
end