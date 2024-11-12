class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    @the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => @the_id })
    @the_actor = matching_actors.at(0)
    @aname=@the_actor.name
    @adob=@the_actor.dob
    @abio=@the_actor.bio
    @aimage=@the_actor.image
    render({ :template => "actor_templates/show" })
  end
  def create
    c=Actor.new
    c.name=params.fetch("name")
    c.dob=params.fetch("dob")
    c.bio=params.fetch("bio")
    c.image=params.fetch("image")
    c.save
    redirect_to("/actors")
  end
  def edit
    the_id=params.fetch("path_id")
    matching_actors = Actor.where({ :id => the_id })
    the_actor = matching_actors.at(0)
    the_actor.name=params.fetch("query_name")
    the_actor.dob=params.fetch("query_dob")
    the_actor.bio=params.fetch("query_bio")
    the_actor.image=params.fetch("query_image")
    the_actor.save
    link="/actors/"+the_id.to_s
    redirect_to(link)
  end
  def delete
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
    @the_actor.destroy
    redirect_to("/actors")
  end
    
end
