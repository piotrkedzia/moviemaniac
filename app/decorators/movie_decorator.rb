class MovieDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def format_total_gross
    if object.flop?
      h.content_tag(:strong, 'Flop!')
    else
      h.number_to_currency(object.total_gross)
    end
  end

  def image_for(size)
      if object.image.exists?
        h.image_tag(object.image.url(size))
      else
        h.image_tag('placeholder.png')
      end
  end

  def format_average_stars
    if object.average_stars.nil?
      h.content_tag(:strong, 'No reviews')
    else
      '*' * object.average_stars.round
    end
  end

  def reviews_link
    h.link_to(h.pluralize(object.reviews.size, "review"), h.movie_reviews_path(object))
  end

  def toggle_favorite_link
    if object.users.include?(h.current_user)
      h.link_to("unlike it", h.toggle_favorite_path(object), id: "like it too")
    else
      h.link_to("like it", h.toggle_favorite_path(object), id: "like it too")
    end
  end

  def fans_count
    "#{h.pluralize(object.users.count, 'user')} liked it" if object.users.count > 0
  end

  def fans
     object.users.map { |user| h.link_to("<#{user.email.split('@').first}>", h.user_favorites_path(user)) }
  end
end
