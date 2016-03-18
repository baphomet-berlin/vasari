class Vasari::InstallGenerator < Rails::Generators::Base

  def run_migrations
    say_status :running, "migrations"
    rake 'vasari:install:migrations'
  end

end
