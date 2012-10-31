
module PlayAuth
  puts 'Creating default Roles'

  ['Admin', 'User'].each do |role|
    Role.find_or_create_by_name(role)
  end

end
