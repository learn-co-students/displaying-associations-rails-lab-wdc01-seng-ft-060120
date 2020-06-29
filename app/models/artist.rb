  
class Artist < ActiveRecord::Base
  has_many :songs

  def describe
    self.name + " - " + self.song_count.to_s + " " + "song".pluralize(self.song_count)
  end

  def song_count
    self.songs.size
  end
end