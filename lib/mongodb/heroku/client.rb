class Heroku::Client
  def mongohq_vars(app_name)
    config = config_vars(app_name)
    if config.has_key?('MONGOHQ_URL')
      config['MONGOHQ_URL']
    else
      nil
    end
  end

  def mongolab_vars(app_name)
    config = config_vars(app_name)
    if config.has_key?('MONGOLAB_URI')
      config['MONGOLAB_URI']
    else
      nil
    end
  end
end
