feature 'viewing bookmarks' do
  scenario 'clicking bookmarks link' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('www.fakepage.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('www.testpage.com');")
    visit '/'
    click_on 'Bookmarks'
    expect(page).to have_content('www.fakepage.com', 'www.testpage.com')
  end
end
