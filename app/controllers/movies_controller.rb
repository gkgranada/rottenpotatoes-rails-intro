class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    sort = params[:sort] || session[:sort]    
    @all_ratings=Movie.all_ratings
    ratings = params[:ratings] || session[:ratings] || Hash[@all_ratings.map {|rating| [rating, 1]}]
    
    if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = sort
      session[:ratings] = ratings
      
      flash.keep
      redirect_to :sort => sort, :ratings => ratings and return      
    end
    
    @ratings = ratings.nil? ? @all_ratings : ratings.keys
    if sort.nil?
      @movies = Movie.order(sort).where('rating IN(?)',@ratings).all
      session[:sort] = sort
    else
      @movies = Movie.where('rating IN(?)',@ratings).all
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
