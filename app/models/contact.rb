class Contact < ApplicationRecord

  def pretty_time
    return created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def full_name
    return "#{first_name} #{last_name}"
  end

end
