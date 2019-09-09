feature 'viewing bookmarks' do
  scenario 'clicking bookmarks link' do
    visit '/'
    click_on 'Bookmarks'
    expect(page).to have_content('www.fakepage.com', 'www.testpage.com')
  end
end
