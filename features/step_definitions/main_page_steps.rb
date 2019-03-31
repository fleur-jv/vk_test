When(/^I am on the VK main page$/) do
  visit "https://vk.com"
end

And(/^The page title is ([^"]*)$/) do |query|
  expect(page).to have_content("#{query}")
  @logger.info "Open VK successfully: Page title is \"#{page.title}\""
end

Then(/^Click at change language link$/) do
  click_link 'Switch to English'
  expect(page).to have_content('Welcome! | VK')
  @logger.info "Switch language successfully: Page title is \"#{page.title}\""
end