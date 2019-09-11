feature 'viewing bookmarks' do
  scenario 'clicking bookmarks link' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmarks.create(url: 'http://www.fakepage.com', title: 'fake page')
    Bookmarks.create(url: 'http://www.testpage.com', title: 'test page')
    visit '/'
    click_on 'Bookmarks'
    expect(page).to have_link('fake page', href: 'http://www.fakepage.com')
    expect(page).to have_link('test page', href: 'http://www.testpage.com')
  end
end
