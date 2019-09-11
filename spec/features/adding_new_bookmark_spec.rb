feature 'adding a new bookmark' do
  scenario 'adding a bookmark from homepage' do
    visit '/'
    fill_in 'url', with: 'http://www.addedpage.com'
    fill_in 'title', with: 'Test Bookmark'
    click_on 'Add bookmark'
    expect(page).to have_link('Test Bookmark', href: 'http://www.addedpage.com')
  end

  scenario 'adding a bookmark from bookmarks view' do
    visit '/bookmarks'
    fill_in 'url', with: 'http://www.addedpage.com'
    fill_in 'title', with: 'Test Bookmark'
    click_on 'Add bookmark'
    expect(page).to have_link('Test Bookmark', href: 'http://www.addedpage.com')
  end

  scenario 'The bookmark must be a valid URL' do
    visit'/bookmarks'
    fill_in 'url', with: 'not a real bookmark'
    click_on 'Add bookmark'

    expect(page).not_to have_content('not a real bookmark')
    expect(page).to have_content('You must submit a valid URL.')
  end
end
