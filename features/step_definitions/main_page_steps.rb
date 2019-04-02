When(/^I am on the VK main page$/) do
  visit "https://vk.com"
end

And(/^The page title is (.*)$/) do |title|
  expect(page).to have_content("#{title}")
  @logger.info "Open VK successfully: Page title is \"#{page.title}\""
end

And(/^Fill the (.*) and (.*)$/) do |first_name, last_name|
  fill_in 'ij_first_name', with: "#{first_name}"
  @first_name = first_name
  fill_in 'ij_last_name', with: "#{last_name}"
  @last_name = last_name
end

And(/^Select the (.*), (.*) and (.*)$/) do |birth_day, birth_month, birth_year|
  find(:xpath, '//div[@class="ij_bday"]').click
  find(:xpath, "//div[@class='ij_bday']//ul/li[@title='#{birth_day}']").click

  find(:xpath, '//div[@class="ij_bmonth"]').click
  find(:xpath, "//div[@class='ij_bmonth']//ul/li[@title='#{birth_month}']").click

  find(:xpath, '//div[@class="ij_byear"]').click
  find(:xpath, "//div[@class='ij_byear']//ul/li[@title='#{birth_year}']").click
end

Then(/^Try to register$/) do
  click_button 'ij_submit'
  expect(page).to have_content 'Регистрация | ВКонтакте'
  @logger.info "Open registration page successfully: Page title is \"#{page.title}\""
  @logger.info "You can confirm registration for #{@first_name} #{@last_name}"
end

Then(/^Try to invalid name registration$/) do
  click_button 'ij_submit'
  expect(page).to have_xpath '//b[contains(text(), "Пожалуйста, укажите Ваше имя и")]'
  @logger.info "Error is displayed!"
end

Then(/^Try to invalid date registration$/) do
  click_button 'ij_submit'
  expect(page).to have_xpath '//b[contains(text(), "Пожалуйста, укажите дату рождения.")]'
  @logger.info "Error is displayed!"
end

Then(/^Try to register with empty fields$/) do
  step('Try to invalid name registration')
end

And(/^Fill login and password$/) do
  fill_in 'index_email', with: 'email@gmail.com'
  fill_in 'index_pass', with: 'password'
end

Then(/^Try to login$/) do
  click_button 'index_login_button'
  expect(page).to have_content 'Новости'
  @logger.info "Successfull login: Page title is \"#{page.title}\""
end

Then(/^Click at (.*) and check (.*)$/) do |link, title|
  click_link "#{link}"
  expect(page).to have_content "#{title}"
  @logger.info "Switch language successfully: Page title is \"#{page.title}\""
end