class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    @the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => @the_id })
    @the_director = matching_directors.at(0)
    @aname=@the_director.name
    @adob=@the_director.dob
    @abio=@the_director.bio
    @aimage=@the_director.image
    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
  def create
    c=Director.new
    c.name=params.fetch(:name)
    c.dob=params.fetch(:dob)
    c.bio=params.fetch(:bio)
    c.image=params.fetch(:image)
    c.save
    redirect_to("/directors")
  end
  def edit
    @the_id=params.fetch("path_id")
    matching_actors = Director.where({ :id => @the_id })
    the_actor = matching_actors.at(0)
    the_actor.name=params.fetch("query_name")
    the_actor.dob=params.fetch("query_dob")
    the_actor.bio=params.fetch("query_bio")
    the_actor.image=params.fetch("query_image")
    the_actor.save
    link="/directors/"+@the_id.to_s
    redirect_to(link)
  end
  def delete
    the_id = params.fetch("path_id")

    matching_actors = Director.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
    @the_actor.destroy
    redirect_to("/directors")
  end
end
