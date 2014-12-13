module UsersHelper

  def gravatar_for(user, options = { :size => 75} )
    gravatar_image_tag(user.email.downcase, :alt => h(user.name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def auth_with_fragment(id, salt_fragment)
    user = User.where(:id => id).first
    (user && user.salt[salt_fragment]) ? user : nil
  end

  def email_fwd?
    current_user.email_fwd?
  end
end
