class Site::SubscribersController < SiteController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to root_path }
        flash[:success] = t("admin.subscriber_added")
      else
        @subscriber.errors.full_messages.each do |e|
          flash[:error] = e
        end
        format.html { redirect_to root_path }
      end
    end
  end

  def unsubscribe
    subscriber = Subscriber.find_by(deactivation_code: params[:code])
    respond_to do |format|
      if subscriber.deactivate!
        format.html { redirect_to admin_subscribers_path }
      end
    end
  end

  def anonymize
    @subscribers = Subscriber.where(:email => params[:subscriber_email])
    @subscribers.each do |s|
      as = AnonymizeUserData.new
      as.anonymize_subscriber_only(s)
      if s.user_id
        @user = User.find_by_id(s.user_id)
        @user.skip_reconfirmation!
        au = AnonymizeUserData.new
        au.anonymize(@user)
      end
    end
    flash[:success] = t("admin.anonymized")
    redirect_to root_path
  end

  private

  def subscriber_params
    params[:subscriber][:domain_id] = @domain.id
    params[:subscriber][:active] = true
    params.require(:subscriber).permit(:name, :email, :active, :domain_id)
  end
end
