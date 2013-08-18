# coding: utf-8
require 'redmine'
require_dependency 'yare/show_issues_listener'

Redmine::Plugin.register :redmine_yare do
  name 'redmine_yare'
  author 'pinzolo'
  description 'redmine_yare is plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/pinzolo/redmine_yare'
  author_url 'https://github.com/pinzolo'
end
