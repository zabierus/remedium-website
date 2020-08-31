class Site::UsersController < SiteController
  before_action :authenticate_site_user!
  layout "site"

  def index
  end 
  
  def edit
    @user = current_site_user 
  end

  def password
    @user = current_site_user 
  end

  def update
    @ref = Rails.application.routes.recognize_path(request.referrer)[:action]
    @user = current_site_user
    if @ref == "password"
      if @user.update_with_password(params[:user].permit(:current_password, :password, :password_confirmation))
        bypass_sign_in @user
        toast :success, t('site.password_changed')
        redirect_to(edit_user_path(@user))
      else
        puts "==========ZJEBAŁEŚ"
        toast :error, "Niech hasło w obu polach będzie takie samo"
        render :password 
      end
    else
      if @user.update_attributes(params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :mobile_phone, :selected_orders_source_web))
        redirect_to :action => "edit" 
      else
        render :edit 
      end
    end
  end  

end
