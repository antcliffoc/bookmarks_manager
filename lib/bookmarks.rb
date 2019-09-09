require 'pg'

class Bookmarks
  attr_reader :bookmarks

  def initialize
    @bookmarks = []
  end

  def add(url)
    @bookmarks << url
  end

  def all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end
end
