class UsersController < ActionController::Base

  def index

    @list_of_users=User.all.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def user_details

    uname = params.fetch("name")

    matching_usernames= User.where({ :username => uname})

    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
    render({ :template => "user_templates/user_details.html.erb" })
    end
  end

end
