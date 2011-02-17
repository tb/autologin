require 'rails/generators/migration'

class AutologinGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_model_file
    template "autologin.rb", "app/models/autologin.rb"
    migration_template "create_autologins.rb", "db/migrate/create_autologins.rb"
  end
end
