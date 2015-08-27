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
end
