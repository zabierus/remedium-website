class Site::GalleryController < SiteController
  def show
    @gallery = Gallery.friendly.find(params[:id])
    @media_files = @gallery.media_files.paginate(:page => params[:page], :per_page => 12)
    @renderer = renderer()
  end

  def show_category
    @gallery = Gallery.find(params[:gallery_id])
    mf = Categorization.where(category_id: params[:category_id])
    @media_files = mf.collect { |i| i.media_file if i.media_file.gallery_id == @gallery.id }.compact.paginate(:page => params[:page], :per_page => 12) #wybieram zdjecia dla konkretnej galerii i kategorii
    @renderer = renderer()
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
