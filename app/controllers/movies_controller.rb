class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
    #  Parameters: {"title"=>"Finding Nemo", "year"=>"2003", "duration"=>"100", "desription"=>"After his son is captured in the Great Barrier Reef and taken to Sydey, a timid clownfish sets out on a journey to bring him home.", "image_url"=>"ttps://images-na.ssl-images-amazon.com/images/M/MV5BZTAzNWZlNmUtZDEzYi00ZjA5LWIYjEtZGM1NWE1MjE4YWRhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jp", "director_id"=>"475"}
  end

  def create_row
    @movie = Movie.new

    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save

    redirect_to("/movies/#{@movie.id.to_s}")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    render("show")
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
  end
end
