# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Persontype.create(:name => 'user' , :description => 'User performing a usability test')
Persontype.create(:name => 'staff' , :description => 'Usability testing staff')
Persontype.create(:name => 'heexpert' , :description => 'Reviewer') # HE-Expert = called "Reviewer" for end-users

# Now perform (only ONCE) a 
# rake db:seed