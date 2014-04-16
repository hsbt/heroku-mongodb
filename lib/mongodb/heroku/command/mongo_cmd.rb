class MongoCmd
  SCHEME = /(mongodb:\/\/)/
  USER = /([-.\w:]+)/
  PASS = /([^@,]+)/
  NODES = /((([-.\w]+)(?::(\w+))?,?)+)/
  DATABASE = /(?:\/([-\w]+))?/
  URI = /#{SCHEME}(#{USER}:#{PASS}@)?#{NODES}#{DATABASE}/

  attr_accessor :user, :password, :hosts, :db
  def initialize(string)
    _,_,_,@user,@password,@hosts,_,_,_,@db = string.match(URI).to_a
  end

  def host
    @hosts.split(',').first
  end

  def mongodump
    "mongodump -h #{self.host} -u #{@user} -p #{@password} -d #{@db}"
  end

  def mongorestore
    "mongorestore --drop -h #{self.host} -u #{@user} -p #{@password} -d #{@db}"
  end

end
