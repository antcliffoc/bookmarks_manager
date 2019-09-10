feature 'adding a new bookmark' do
  scenario 'adding a bookmark from homepage' do
    visit '/'
    fill_in 'url', with: 'http://addedpage.com'
    fill_in 'title', with: 'Test Bookmark'
    click_on 'Add bookmark'
    expect(page).to have_link('Test Bookmark', href: 'http://addedpage.com')
  end

  scenario 'adding a bookmark from bookmarks view' do
    visit '/bookmarks'
    fill_in 'url', with: 'http://addedpage.com'
    fill_in 'title', with: 'Test Bookmark'
    click_on 'Add bookmark'
    expect(page).to have_link('Test Bookmark', href: 'http://addedpage.com')
  end
end
