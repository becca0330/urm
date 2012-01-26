# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup
    @proj1=Project.new( :title => "Demo Project 1")
    @proj2=Project.new( :title => "Demo Project 1", 
                        :description => "A demo project for tests")
  end
  
  test "the summary" do
    assert_equal( "Demo Project 1: ...", 
                  @proj1.summary, 
                  "The summary should be the first part of title"+
                  " and the first part of the description...")
    assert_equal( "Demo Project 1: A demo project for tests...", 
                  @proj2.summary, 
                  "The summary should be the first part of title"+
                  " and the first part of the description...")
  end
end
