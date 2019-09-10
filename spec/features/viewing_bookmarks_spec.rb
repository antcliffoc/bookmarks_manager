feature 'viewing bookmarks' do
  scenario 'clicking bookmarks link' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmarks.create(url: 'www.fakepage.com', title: 'fake page')
    Bookmarks.create(url: 'www.testpage.com', title: 'test page')
    visit '/'
    click_on 'Bookmarks'
    expect(page).to have_link('fake page', href: 'www.fakepage.com')
    expect(page).to have_link('test page', href: 'www.testpage.com')
  end
end
