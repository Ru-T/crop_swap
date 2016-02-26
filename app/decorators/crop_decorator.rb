class CropDecorator < Draper::Decorator
  delegate :current_page,
           :total_pages,
           :limit_value,
           :entry_name,
           :total_count,
           :offset_value,
           :last_page?,
           :crop_type,
           :ripe_on,
           :expires_on,
           :user,
           :description,
           :id,
           :swap_types,
           :avatar

  include Draper::LazyHelpers

  def wishlisted?(user)
    if model.wishlists.present?
      model.wishlists.each { |wishlist| return true if wishlist.user == user }
    end
    false
  end

  def is_ripe?
    return true if Date.today >= model.ripe_on && Date.today < model.expires_on
  end

  def about_to_expire?
    return true if Date.today < model.expires_on && Date.today > model.expires_on - 3.days
  end

  def has_pic?
    model.avatar.present?
  end

  def ripe_time
    distance_of_time_in_words_to_now(model.ripe_on)
  end

  def expiry_time
    distance_of_time_in_words_to_now(model.expires_on)
  end

  def created_time
    distance_of_time_in_words_to_now(model.created_at)
  end
end
