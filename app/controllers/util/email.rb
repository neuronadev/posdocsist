require 'rest-client'
require 'json'

module Util
    module Email

        def self.notificar(rp, pd, red, tipo)
               
               response = RestClient::Request.new(
                      :method => :post,
                      :url => 'localhost:4000/email/enviararp',
                      :payload => {rp: rp, pd: pd, red: red, tipo: tipo}
               ).execute
        end
    end   
end