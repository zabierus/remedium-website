class Site::HomeController < SiteController
  def index
    @articles = Article.visible.decorate
    @news = Article.news.decorate
    # @media_files = Gallery.find_by_code("main") ? Gallery.find_by_code("main").media_files : nil
    # @tracks = Track.all.order(:album_id)
    # category = Category.find_by_code("zespol").nil? ? Category.find_by_code("band") : Category.find_by_code("zespol")
    # if category
    #   @band = Article.where(category_id: category.id)
    # end
  end

  def sitemap
    @articles = Article.visible
    @galleries = Gallery.all
    @banner_items = Banner.first.banner_items
    @menu_items = MenuItem.all
  end

  def privacy_policy
    @policy = PrivacyPolicy.where(is_visible: true).first
  end

  def download_policy
    html = render_to_string(partial: "site/home/pdf_policy.html.erb", layout: false)
    pdf = WickedPdf.new.pdf_from_string(html)
    send_data(pdf, :filename => "remedium_polityka_prywatnosci.pdf", :disposition => "attachment")
  end
end
