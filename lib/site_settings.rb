module SiteSettings
  def site_settings
    @site = SiteSetting.first
  end

  def front_page_content
    @menu = MenuItem.find_by(code: "main")
    @footer_menu = MenuItem.find_by(code: "footer")
    @socials = MenuItem.find_by(code: "social")
    @info_footer = Article.find_by(code: "info_footer")
    @cookies = Article.find_by(code: "cookies")
    @banners = Banner.find_by(code: "main")
  end
end
