# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


require 'test_helper'
# find possible assertions in
# http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers

class ProjectsControllerTest < ActionController::TestCase

  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @project.to_param
    assert_response :success
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, :id => @project.to_param
    end

    assert_redirected_to projects_path
  end
  
  
  # by jf:
  # run:  "ruby -Itest test/functional/projects_controller_test.rb"
  # something like get(:show, {'id' => "12"}, {'user_id' => 5})
  # see: http://guides.rubyonrails.org/testing.html
  test "should show project in xml" do
    @request.env['HTTP_ACCEPT'] = "text/xml"
    get :show, {:id => @project.to_param, :format => :xml}
    assert_response :success
    #puts response.body
    assert_select 'project>title',@project.title
    # TODO: check resulting xml agains given schema definition (XSD)
  end
  
  


end
