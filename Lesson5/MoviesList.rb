class MoviesList
  require "date"

  def initialize(file_name)
    @file_name = file_name
    @movies = File.readlines(@file_name).map{|x| film = Movie.new(x)}
  end

  def load_list
    @movies
  end

  def long_films
    @list = @movies.sort_by { |m| m.time }.last(5)
  end

  def film_director
    @movies.sort_by(&:director).map(&:director).uniq
  end

  def by_genre(genre_name)
    @movies.select{ |m| m.has_genre?(genre_name)}.sort_by(&:full_date)
  end

  def genre_reject(genre_name)
    @movies.reject{ |m| m.has_genre?(genre_name)}.sort_by(&:full_date)
  end

  def sort_field(sort_field)
    @movies.sort_by {|m| m.send(sort_field)}
  end

  def dont_usa
    @movies.reject { |m| m.country == "USA" }
  end

  def mov_director_count
    @movies.group_by(&:director).sort_by{|key, m| m.count}
  end

  def mov_actor_count
    act = @movies.sort_by(&:actor).map{|m| m.actors}
    act.flatten.sort_by {|a| a}.group_by{|a| a}
  end
end

class MyMoviesList < MoviesList
  def selects_film(film_name)
    @movies.select{ |m| m.has_name?(film_name)}
  end

  def set_rate(myrate)
    @myrate = myrate
  end
end