module UsersHelper
  def roles_list(roles)
    roles.map{|x| x.humanize }.join(', ')
  end
end
