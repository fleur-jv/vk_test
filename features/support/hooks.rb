Before do
  Capybara.default_driver = :chrome
  Capybara.default_max_wait_time = 5
  Capybara.ignore_hidden_elements = false

  @logger = Logger.new(STDOUT)
  @logger.level = Logger::INFO
end

After do |scenario|
  if scenario.failed?
    puts scenario.name
    puts scenario.exception.message
  end
  Capybara.current_session.driver.quit
end