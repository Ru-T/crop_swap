class CropDecorator < Draper::Decorator
  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?, :wishlisted?, :is_ripe?, :about_to_expire?, :user, :description

  def ripe_in
    h.distance_of_time_in_words_to_now(model.ripe_on)
  end

  def expires_in
    h.distance_of_time_in_words_to_now(model.expires_on)
  end

  def created_at
    h.distance_of_time_in_words_to_now(model.created_at)
  end

  def crop_pic
    if model.crop_pic.present?
      h.image_tag model.crop_pic.url
    else
      h.image_tag h.asset_url ("crop-default-image.png")
    end
  end

  def crop_type
    model.crop_type.name
  end

end
