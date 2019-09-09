feature "infrastructure" do
  scenario 'Loading the home page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end
