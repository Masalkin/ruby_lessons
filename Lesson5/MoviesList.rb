class MoviesList
  require "date"

  def initialize(file_name)
     @file_name = file_name
     @movies = File.readlines(@file_name).map{ |m| film_fields = m.split("|")
      a_years = 1900..1945
      c_years = 1945..1968
      m_years = 1968..2000
      n_years = 2000..2015

      a_years = a_years.include?(film_fields[2].to_i)
      c_years = c_years.include?(film_fields[2].to_i)
      m_years = m_years.include?(film_fields[2].to_i)
      n_years = n_years.include?(film_fields[2].to_i)
      if a_years
        @movies = MyMoviesList::AncientMovie.new(m)
      elsif c_years
        @movies = MyMoviesList::ClassicMovie.new(m)
      elsif m_years
        @movies = MyMoviesList::ModernMovie.new(m)
      elsif n_years
        @movies = MyMoviesList::NewMovie.new(m)
      end
    }

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
  def selects_film(film_name, myrat, indate)
    film = @movies.detect{ |m| m.has_name?(film_name); }
    film.my_rating(myrat)
    film.view_date(indate)
  end

  def select_films_norate
    @movies.select{ |m| m.has_myrate?}.sort_by{|m| m.rate*rand}.last(5)
  end

  def select_film_views
    @movies.reject{ |m| m.has_myrate?}.sort_by{ |m| m.get_view_date}.reverse.last(5).sort_by{ |m| m.get_myrate*rand}
  end

  def select_ancient
    @movies.select{ |m| m.get_ancient}.sort_by{ |m| m.get_rating_imdb}.last(1)
  end

  class AncientMovie < Movie
    select_ancient - "Самый интересный фильм" - get_year
  end

  class ClassicMovie < Movie

  end

  class ModernMovie < Movie

  end

  class NewMovie < Movie

  end


end