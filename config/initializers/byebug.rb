if Rails.env.development?
  require 'byebug/core'
  #Byebug.wait_connection = true
  Byebug.start_server 'localhost', ENV.fetch("BYEBUG_SERVER_PORT", 9876).to_i rescue nil
end
