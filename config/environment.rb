# see domainfactory: supported RoR versions
# 2012-01-29 so we degrate from 3.1.x to 3.0.x
RAILS_GEM_VERSION = "3.0.9"

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
URM::Application.initialize!
