load "Movie.rb"
load 'MoviesList.rb'

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

def print_film_name(selects_film, set_rate)
 p selects_film
 p set_rate
end


movies = MoviesList.new("movies.txt")
movie = MyMoviesList.new("movies.txt")

print_long_films(movies.long_films)
puts
print_by_genre(movies.by_genre("Comedy"))
puts
print_all_directors(movies.film_director)
puts
print_reject_genre_films(movies.genre_reject("Comedy"))
puts
print_sort_field(movies.sort_field("actor"))
puts
print_dont_usa(movies.dont_usa)
puts
print_mov_director_count(movies.mov_director_count)
puts
print_mov_actor_count(movies.mov_actor_count)
puts

print_film_name(movie.selects_film("The Bourne Ultimatum"), 3)