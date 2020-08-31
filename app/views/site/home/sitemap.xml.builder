xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc "http://localhost:3000"
    xml.priority 1.0
  end

  @articles.each do |article|
    xml.url do
      xml.loc article_url(article)
      xml.lastmod article.updated_at
      xml.changefreq "always"
      xml.priority 0.7
    end
  end

  @menu_items.each do |item|
    xml.url do
      if item.children.length > 0
        item.children.each do |child|
          unless child.link.nil? && child.link == "/"
            xml.loc child.link
            xml.changefreq "always"
            xml.priority 0.5
          end
        end
      else
        unless item.link.nil? && item.link == "/"
          xml.loc item.link
          xml.changefreq "always"
          xml.priority 0.5 
        end
      end
    end
  end

  @galleries.each do |gallery|
    xml.url do
      xml.loc gallery_url(gallery)
      xml.changefreq "always"
      xml.priority 0.5
    end
  end

  @banner_items.each do |item|
    xml.url do
      next unless item.url.nil?
      xml.loc item.url
      xml.changefreq "always"
      xml.priority 0.5
    end
  end

end