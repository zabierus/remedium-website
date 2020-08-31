class ArticleDecorator < ApplicationDecorator
  delegate_all

  def short_description(length)
    unless model.body.nil?
      html = model.body.split("<!--more-->")
      if html.size.positive?
        Nokogiri::HTML::DocumentFragment.parse(html.first).to_html
      else
        "#{model.body.truncate(length)}"
      end
    end
  end
end