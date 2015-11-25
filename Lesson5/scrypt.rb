
load 'Movie.rb'
load  'MoviesList.rb'


def print_long_films(long_films_method)
  puts "ТОП 5 самых долгих фильмов"
  long_films_method.each_with_index { |m, num | puts "#{num+1}: #{m.name} - #{m.time} минут"}
end

def print_by_genre(by_genre_method)
  puts "Список всех комедий"
  by_genre_method.each_with_index { |m,num | puts "#{num+1}: #{m.name}"}
end

def print_all_directors(film_director_method)
  puts "Список всех режисеров"
  film_director_method.each_with_index{|d, num| puts "#{num+1}: #{d}"}
end

def print_reject_genre_films(genre_reject_method)
  puts "Список фильмов кроме комедий"
  genre_reject_method.each_with_index { |m,num | puts "#{num+1}: #{m.name}"}
end

def print_sort_field(sort_field_method)
  puts "Сортировка по поллю"
  sort_field_method.each_with_index { |m, num | puts "#{num+1}:  #{m.name}"}
end

def print_dont_usa(dont_usa_method)
  puts "Количество фильмов снятых не в США #{dont_usa_method.count}"
end

def print_mov_director_count(mov_director_count_method)
  puts "Сколько фильмов снял каждый режиссер"
  mov_director_count_method.each_with_index { |(dir, films), num |
    puts "#{num+1}: #{dir} - снял #{films.count} фильма(ов)"
  }
end

def print_mov_actor_count(mov_actor_count_method)
  puts "Актеры снявшиеся в фильмах"
  mov_actor_count_method.each_with_index { |(actor, group), num |
    puts "#{num+1}: #{actor} - снялся в #{group.count} фильме(а, ах)"
  }
end




movie = MyMoviesList.new("movies.txt")


movie.selects_film("The Bourne Ultimatum", 5, "2007-02-19")
movie.selects_film("The Departed", 3, "2010-03-03")
movie.selects_film("Back to the Future", 5, "2000-06-15")
movie.selects_film("Alien", 5, "1999-05-07")
movie.selects_film("Once Upon a Time in America", 4, "2000-06-30")
movie.selects_film("For a Few Dollars More", 1, "1998-01-05")
movie.selects_film("Rashomon", 2, "2001-07-08")
movie.selects_film("Elite Squad: The Enemy Within", 1, "2001-07-09")

p movie.select_films_norate
puts
puts
p movie.select_film_views
puts
puts



