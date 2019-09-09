class Bookmarks
  attr_reader :bookmarks

  def initialize
    @bookmarks = []
  end

  def add(url)
    @bookmarks << url
  end

  def all
    @bookmarks
  end
end
