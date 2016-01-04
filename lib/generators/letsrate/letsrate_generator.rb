require 'rails/generators/migration'
require 'rails/generators/active_record'
class LetsrateGenerator < ActiveRecord::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)

  desc "model is creating..."
  def create_model
    model_file = File.join('app/models', "#{file_path}.rb")
    raise "User model (#{model_file}) must exits." unless File.exists?(model_file)
    class_collisions 'Rate'
    template 'model.rb', File.join('app/models', "rate.rb")
    template 'cache_model.rb', File.join('app/models', "rating_cache.rb")
  end

  desc "cacheable rating average migration is creating ..."
  def create_cacheable_migration
    migration_template "cache_migration.rb", "db/migrate/create_rating_caches.rb"
  end

  desc "migration is creating ..."
  def create_rating_migration
    migration_template "migration.rb", "db/migrate/create_rates.rb"
  end
end
