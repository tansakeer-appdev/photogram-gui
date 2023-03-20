class PhotosController < ActionController::Base

  def photo_index

    @list_of_photos=Photo.all.order({ :created_at => :desc })

    render({ :template => "photo_templates/photo_index.html.erb" })
  end

  def photo_details

    uid = params.fetch("ph")
    matching_photos= Photo.where({ :id=> uid})

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

  def insert_photo
  input_image=params.fetch("q_image")
  input_caption=params.fetch("q_caption")
  input_owner_id=params.fetch("q_ownid")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption    
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save
        #render({ :template => "photo_templates/create_photo.html.erb" })

      redirect_to("/photos/"+a_new_photo.id.to_s)
  end

end
