class Song

  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    @lyrics.each {|line| puts line}
  end
end

happy_bday = Song.new(["Happy birthday to you",
  "I don't want to get sued",
  "So I'll stop right there"])

bulls_on_parade = Song.new(["They rally around tha family",
  "With pockets full of shells"])

primus_lyrics = ["A B C D E F G H I gotta gal wears her toenails long",
  "Drives a red Barracude, singin' meat packer songs",
  "And she ain't from Kalamazoo"]

kalamazoo = Song.new(primus_lyrics)

  jump_man = Song.new("Da do da do do da da do do DO")

kalamazoo.sing_me_a_song()
