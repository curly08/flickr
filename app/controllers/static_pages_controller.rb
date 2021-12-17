class StaticPagesController < ApplicationController
  def index
    begin
      flickr = Flickr.new
      @photos = flickr.people.getPublicPhotos(user_id: params[:flickr_id]) if params.key?(:flickr_id)
    rescue StandardError => e
      flash[:alert] = "#{e.class}: #{e.message}. Please try again..."
      redirect_to root_path
    end
  end
end
