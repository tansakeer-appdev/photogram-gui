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
end
