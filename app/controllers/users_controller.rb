class UsersController < ActionController::Base

  def index

    @list_of_users=User.all.order({ :username => :asc })
    @uname = params.fetch("name")

    render({ :template => "user_templates/index.html.erb" })
  end

  def user_details

    @uname = params.fetch("name")

    render({ :template => "user_templates/user_details.html.erb" })

  end


end
