require 'bookmarks'

describe Bookmarks do
  subject(:bookmarks) { described_class.new }
  before do
    bookmarks.add('www.fakepage.com')
  end

  describe'.add' do
    it 'adds a bookmark URL to our bookmarks' do
      bookmarks.add('www.testpage.com')
      expect(bookmarks.bookmarks).to include('www.testpage.com')
    end
  end

  describe '.all' do
    it 'returns an array of webpage URLs' do
      bookmarks.add('www.testpage.com')
      expect(subject.all).to include('www.fakepage.com', 'www.testpage.com')
    end
  end
end
