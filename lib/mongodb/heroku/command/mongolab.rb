require 'uri'

class Heroku::Command::Mongolab < Heroku::Command::Base
  def dump
    uri = heroku.mongolab_vars(app)
    if uri && args[0]
      config = URI(uri)
      system("mongodump -h #{config.host} --port #{config.port} -u #{config.user} -p #{config.password} -d #{config.path.sub(/\A\//, '')} -o #{args[0]}")
    end
  end

  def restore
    uri = heroku.mongolab_vars(app)
    if uri && args[0]
      config = URI(uri)
      system("mongorestore -h #{config.host} --port #{config.port} -u #{config.user} -p #{config.password} -d #{config.path.sub(/\A\//, '')} #{args[0]}")
    end
  end
end
