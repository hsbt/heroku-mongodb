require 'uri'

class Heroku::Command::Mongohq < Heroku::Command::Base
  def dump
    uri = config_vars
    if uri && args[0]
      config = URI(uri)
      system("mongodump -h #{config.host} --port #{config.port} -u #{config.user} -p #{config.password} -d #{config.path.sub(/\A\//, '')} -o #{args[0]}")
    end
  end

  def restore
    uri = config_vars
    if uri && args[0]
      config = URI(uri)
      system("mongorestore --drop -h #{config.host} --port #{config.port} -u #{config.user} -p #{config.password} -d #{config.path.sub(/\A\//, '')} #{args[0]}")
    end
  end

  private

  def config_vars
    config = api.get_config_vars(app).body
    if config.has_key?('MONGOHQ_URL')
      config['MONGOHQ_URL']
    else
      nil
    end
  end
end
