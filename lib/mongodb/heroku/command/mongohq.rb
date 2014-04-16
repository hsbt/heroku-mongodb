class Heroku::Command::Mongohq < Heroku::Command::Base
  def dump
    uri = config_vars
    if uri && args[0]
      cmd = MongoCmd.new(uri)
      system("#{cmd.mongodump} -o #{args[0]}")
    end
  end

  def restore
    uri = config_vars
    if uri && args[0]
      cmd = MongoCmd.new(uri)
      system("#{cmd.mongorestore} #{args[0]}")
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
