class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    @the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => @the_id })
    @the_movie = matching_movies.at(0)
    @mtitle=@the_movie.title
    @myear=@the_movie.year
    @mduration=@the_movie.duration
    @mdescription=@the_movie.description
    @mimage=@the_movie.image
    @dID=@the_movie.director_id
    render({ :template => "movie_templates/show" })
  end
  def create
    c=Movie.new
    c.title=params.fetch("title")
    c.year=params.fetch("year")
    c.duration=params.fetch("duration")
    c.description=params.fetch("description")
    c.image=params.fetch("image")
    c.director_id=params.fetch("director_id")
    c.save
    redirect_to("/movies")
  end
  def edit
    the_id=params.fetch("path_id")
    matching_movies = Movie.where({ :id => the_id })
    the_movie = matching_movies.at(0)
    the_movie.title=params.fetch("query_title")
    the_movie.year=params.fetch("query_year")
    the_movie.duration=params.fetch("query_duration")
    the_movie.description=params.fetch("query_description")
    the_movie.image=params.fetch("query_image")
    the_movie.director_id=params.fetch("query_director_id")
    the_movie.save
    redirect_to("/movies/"+the_id.to_s)
  end
  def delete
    @the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => @the_id })
    @the_movie = matching_movies.at(0)
    @the_movie.destroy
    redirect_to("/movies")
  end
end
