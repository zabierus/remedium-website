class Site::SearchController < SiteController
  def index
    @recent = Article.where(:is_active => true, :is_archive => false).order(:created_at => :desc)

    unless params[:search].empty?
      @articles = articles_with_pagination(params)
    else
      @articles = []
    end
    respond_to do |format|
      format.html
    end
  end

  def articles_with_pagination(params)
    Article.search(params).order(:created_at => :desc).paginate(:page => params[:page], :per_page => 5)
  end

  def renderer
    Class.new(WillPaginate::ActionView::LinkRenderer) do
      def to_html
        html = []
        html << :previous_page
        tmp = pagination.map do |item|
          if item.is_a?(Integer)
            html << item
          end
        end
        html << :next_page
        html = html.map do |item|
          item.is_a?(Integer) ? page_number(item) : send(item)
        end.join(@options[:link_separator])
        @options[:container] ? html_container(html) : html
      end

      def html_container(html)
        tag :ul, html, :class => "pagination"
      end

      def page_number(page)
        if page == current_page
          tag :li, link(page, page, :rel => rel_value(page)), :class => "active_page"
        else
          tag :li, link(page, page, :rel => rel_value(page))
        end
      end

      def previous_or_next_page(page, text, classname)
        tag :li, link(text, page || "#"), :class => classname[0..3]
      end
    end
  end
end
