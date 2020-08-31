# frozen_string_literal: true

class CreateEmailTemplates

  def self.call
    I18n.locale = :en
    templates.each { |t| create_template(t) }
  end

  def create_template
    mt = EmailTemplate.find_or_create_by(code: template[:code])
    if (mt.body.blank? && mt.title.blank?)
      mt.body = template[:body]
      mt.title = template[:title]
      mt.send = template[:send]
      mt.save
    end
    template[:keywords].each do |keyword|
      mk = Keyword.find_or_create_by(key: keyword[:key])
      mk.value = keyword[:value]
      mk.url = keyword[:url]
      mk.save
      EmailTemplateKeyword.find_or_create_by(keyword_id: mk.id, email_template_id: mt.id)
    end
  end

  user_keywords = [
    { key: :full_name, value: '"#{user.first_name} #{user.last_name}"', url: 0 },
    { key: :first_name, value: "user.first_name", url: 0 },
    { key: :last_name, value: "user.last_name", url: 0 },
    { key: :email, value: "user.email", url: 0 },
    { key: :status, value: "user.status", url: 0 },
    { key: :company_name, value: "site_settings.company_name", url: 0 },
    { key: :domain_address, value: "site_settings.domain_address", url: 0 },
  ]

  templates = [
    {
      send: 1,
      code: "account_registration",
      title: "Registration successful, confirm your account",
      keywords: user_keywords + [{ key: :confirmation_url, value: "user_confirmation_url(confirmation_token: token)", url: 1 }],
      body: "<p>Hello [first_name],<br />
<p>Thank you for registration. We have got a request having the email address: [email], defined as a login.</p>
<p>Please activate your account by clicking this link: [confirmation_url], if you signed up on our web site.<br />
Otherwise discard this message.</p>
          
<p>Best regards,<br />
--<br />
Team of [domain_name]<br />
[domain_address]</p>",
    },
    {
      send: 1,
      code: "account_deactivation",
      title: "Your account has been deactivated",
      keywords: user_keywords + [{ key: :anonymization_url, value: "user_anonymization_url(deactivation_code: code)", url: 1 }],
      body: "<p>Hello [first_name],<br />
<p>Your account has been deactivated.</p>
<p>If you want to anonymize your data, enter this link: [anonymization_url]</p>
          
<p>Best regards,<br />
--<br />
Team of [domain_name]<br />
[domain_address]</p>",
    },
    {
      send: 1,
      code: "forgotten_password",
      title: "Forgot your password?",
      keywords: user_keywords + [{ key: :reset_password_url, value: "edit_user_password_url(reset_password_token: token)", url: 1 }],
      body: "<p>Hello [first_name],<br />
<p>We've noticed that you forgot your password.</p>
<p>Here's a link to set new one [reset_password_url]</p>
<p>If that was not your request, discard this message.</p>
          
<p>Best regards,<br />
--<br />
Team of [domain_name]<br />
[domain_address]</p>",
    }
  ]
end
