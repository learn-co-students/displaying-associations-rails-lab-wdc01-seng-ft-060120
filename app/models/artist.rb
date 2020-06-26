class Artist < ActiveRecord::Base
    has_many :songs

    def song_count
        return self.songs.count
    end
end
