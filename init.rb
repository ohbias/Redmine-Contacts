require 'redmine'

Redmine::Plugin.register :redmine_contacts do
  name 'Redmine Contacts plugin'
  author 'Kai Chang'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  project_module :redmine_contacts do
    permission :view_contacts, {:contacts => [:index]}
    permission :edit_contact, {:contacts => [:edit, :update, :new, :create, :destroy]}
  end

  menu :project_menu, :contacts, {:controller => 'contacts', :action => 'index'}, :caption => 'Contacts', :after => :activity, :param => :project_id
end
