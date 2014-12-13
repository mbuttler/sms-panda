module ContactsHelper

  # def auth_with_fragment(id, salt_fragment)
  #   user = User.where(:id => id).first
  #   (user && user.salt[salt_fragment]) ? user : nil
  # end

  # def contact_id_with_phone(sub_phone)
  #   contact = Contact.includes(sub_phone)
  #   puts contact.id 
  # end

  def set_or_create_contact(sub_phone)
    @contact = Contact.find_or_create_by(phone: sub_phone)
  end

  def current_contact
    @current
  end

  def current_contact=(contact)
    @contact = contact
  end

end
