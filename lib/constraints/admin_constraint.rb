class Constraints::AdminConstraint
  def matches?(request)
    user_id = request.session["warden.user.user.key"][0][0]
    return false unless user_id
    user = User.find(user_id)
    user&.admin?
  end
end