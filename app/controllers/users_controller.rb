class UsersController < ActionController::Base

  def index

    @list_of_users=User.all.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def user_details

    uname = params.fetch("name")

    matching_usernames= User.where({ :username => uname})

    @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/user_details.html.erb" })
    
  end

  def insert_user
    @uname = params.fetch("q_username")

    new_person = User.new
    new_person.username= @uname
    new_id = new_person.id

    new_person.save 

    redirect_to("/users/"+ new_person.username.to_s)
  end

  def update_user
    the_id = params.fetch("the_user_id")
    user_up = User.where({ :id => the_id}).at(0)

    user_up.username = params.fetch("q_username")

    user_up.save 

    redirect_to("/users/#{user_up.username}")
  end

end
