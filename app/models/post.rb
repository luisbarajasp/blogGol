class Post < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "defaultImage.jpg"
		validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)
	else
		has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "defaultImage.jpg",:storage => :dropbox,
    	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    	:path => ":style/:id_:filename"
		validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)
	end

	extend FriendlyId
  	friendly_id :title, use: :slugged
end
