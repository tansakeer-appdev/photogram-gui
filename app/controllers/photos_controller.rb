class PhotosController < ActionController::Base

  def photo_index

    @list_of_photos=Photo.all.order({ :created_at => :desc })

    render({ :template => "photo_templates/photo_index.html.erb" })
  end

  def photo_details

    phid = params.fetch("ph")
    matching_photos= Photo.where({ :id=> phid})

    @the_photo = matching_photos.at(0)

    if @the_photo == nil
      redirect_to("/404")
    else
    render({ :template => "photo_templates/photo_details.html.erb" })
    end
  end

  def del_photo
    the_id = params.fetch("del_ph")
    matching_photos= Photo.where({ :id=> the_id})

    @the_photo = matching_photos.at(0)
    @the_photo.destroy 

    # @the_photo
    #render({ :template => "photo_templates/del_photo_details.html.erb" })
    redirect_to("/photos")
  end

  def add_photo
     phobj = Photo.new

      phobj.image = params.fetch("q_image")
      phobj.caption = params.fetch("q_caption") 
      phobj.owner_id = params.fetch("q_ownid")
      phobj.save
      
      if phobj.save 
        redirect_to("/photos/#{phobj.id}")
      else
      render plain: "check ya code bro"
      end

  end

  def update_photo
    
    input_photo_id = params.fetch("phoid")
    
    matching_photo = Photo.where({ :id => input_photo_id})
    a_new_photo = matching_photo.at(0)


    a_new_photo.image = params.fetch("q_image")
    a_new_photo.caption = params.fetch("q_caption")   
    a_new_photo.save

    redirect_to("/photos/#{a_new_photo.id}")
  end

  def add_comment
    @new_comm = Comment.new
    phot_id = params.fetch("photo_id")

   # @new_comm.photo_id = params.fetch("phoid")
    @new_comm.author_id = params.fetch("q_authid")
    @new_comm.body = params.fetch("q_newcomm", "fallback_Comm")
    
    @new_comm.save

    redirect_to("/photos/#{phot_id}")
  end

end
