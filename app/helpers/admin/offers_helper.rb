module Admin::OffersHelper
  def render_offer_status(offer)
    if offer.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end
end
