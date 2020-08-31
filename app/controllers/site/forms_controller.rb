class Site::FormsController < SiteController
  before_action :authenticate_site_user!

  def index
    @forms = FilledForm.where(:user_id => current_site_user.id, :visible_for_user => true)
  end

  def show
    @menu_item = MenuItem.find_by_code_and_is_active("main", "t")
    unless current_site_user
      toast :error, t("site.sign_in_to_continue")
    end
    @form = FormTemplate.unscoped.find_by_id(params[:id])
  end

  def edit
    @filled_form = FilledForm.find_by(:id => params[:id])
    @form = FormTemplate.unscoped.find_by_id(@filled_form.form_template_id)
    @form_file_uploads = FormFileUpload.where(:filled_form_id => @filled_form.id)
    unless @filled_form.visible_for_user
      redirect_to root_path
      toast :info, t("admin.form_accepted")
    end
  end

  def destroy
    user_form = FilledForm.find(params[:id])
    respond_to do |format|
      if user_form.destroy
        format.js
      else
        format.js
      end
    end
  end
end
