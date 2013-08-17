# coding: utf-8
require File.expand_path('../../test_helper', __FILE__)

class ProjectsControllerTest < ActionController::TestCase
  fixtures :projects, :issues, :issue_statuses, :users

  test "show issues" do
    @request.session[:user_id] = 1
    get :show, :id => Project.find(1)
    assert_select "div#yare"
  end

  test "show 2 items" do
    @request.session[:user_id] = 1
    get :settings, :id => Project.find(1)
    assert_select "li.yare_issue", 2
  end
end
