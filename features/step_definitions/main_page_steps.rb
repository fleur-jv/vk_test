Given(/^I am on the VK main page$/) do
  # Capybara.current_session.driver.visit "https://vk.com"
  visit "https://vk.com"
end

# When(/^I search for ([^"]*)$/) do |query|
#   page.find("input#lst-ib").send_keys("#{query}")
#   page.find(:xpath, "//span[@class='lsbb']//input[@value='Поиск в Google']").click
# end

Then(/^the page title should start with ([^"]*)$/) do |query|
  expect(page).to have_content("#{query} пожаловать | ВКонтакте")
  puts "Page title is \"#{page.title}\""
  Capybara.current_session.driver.quit
end
