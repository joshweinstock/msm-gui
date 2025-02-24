class ActorsController < ApplicationController
  
  def create
    m=Actor.new
    m.name=params.fetch("the_name")
    m.dob=params.fetch("the_dob")
    m.bio=params.fetch("the_bio")
    m.image=params.fetch("the_image")

    m.save
    redirect_to("/actors")
    end
  
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
