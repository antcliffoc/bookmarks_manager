require 'bookmarks'

describe Bookmarks do
  # describe'.add' do
  #   it 'adds a bookmark URL to our bookmarks' do
  #     bookmarks.add('www.testpage.com')
  #     expect(bookmarks.bookmarks).to include('www.testpage.com')
  #   end
  # end

  describe '.all' do
    it 'returns an array of webpage URLs' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('www.fakepage.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('www.testpage.com');")
      expect(Bookmarks.all).to include('www.fakepage.com', 'www.testpage.com')
    end
  end
end
