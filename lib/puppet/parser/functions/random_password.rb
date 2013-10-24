require 'securerandom'

module Puppet::Parser::Functions
  newfunction(:random_password, :type => :rvalue) do |args|
    length = args[0] - 1
    store = args[1]

    if(args.length != 2)
      raise Puppet::ParsError, 'Usage: random_password(length, store)'
    end

    password = SecureRandom.hex[0..length]

    File.open(store, 'w') { |f| f.write(password) }

    return password
  end
end
