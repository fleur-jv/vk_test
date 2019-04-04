def check_title(title)
  expect(page).to have_content("#{title}")
end
