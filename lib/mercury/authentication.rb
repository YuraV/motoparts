module Mercury
  module Authentication

    def can_edit?
      flash[:error] = 'Access Deny' and return unless current_user
      true
    end
  end
end
