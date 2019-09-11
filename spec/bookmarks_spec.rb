require 'bookmarks'
require 'database_helpers'

describe Bookmarks do

  describe '.all' do
    it 'returns an array of webpage URLs' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmarks.create(url: 'www.fakepage.com', title: 'fake page')
      Bookmarks.create(url: 'www.testpage.com', title: 'test page')
      bookmarks = Bookmarks.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'it adds a new bookmark' do
      bookmark = Bookmarks.create(url: 'http://testcreate.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://testcreate.com'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmarks.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmarks.delete(id: bookmark.id)

      expect(Bookmarks.all.length).to eq(0)
    end
  end
end
