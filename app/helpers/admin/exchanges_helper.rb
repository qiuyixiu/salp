module Admin::ExchangesHelper
  def render_exchange_status(exchange)
    if exchange.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end
end
