class Movie

  attr_reader :url, :name, :year ,:country, :full_date, :genre, :time, :rate, :director, :actor

  def initialize(load_list)
    movie = load_list.split('|')
    @url = movie[0]
    @name = movie[1]
    @year = movie[2]
    @country = movie[3]
    @full_date = movie[4]
    @genre = movie[5]
    @time = movie[6].to_i
    @rate = movie[7]
    @director = movie[8]
    @actor = movie[9].strip
  end

  def actors
    @actor.split(",")
  end

  def has_genre?(genre_name)
    @genre.split(",").include?(genre_name)
  end

  def has_name?(film_name)
    @name.include?(film_name)
  end

end