# see domainfactory: supported RoR versions
RAILS_GEM_VERSION = "3.0.9"

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
URM::Application.initialize!
