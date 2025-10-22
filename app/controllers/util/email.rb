require 'rest-client'
require 'json'

module Util
    module Email
        def self.notificar(personaid, estanciaid, tipo)
               response = RestClient::Request.new(
                      :method => :post,
                      :url => 'localhost:4000/email/enviararp',
                      :payload => {persona_id: personaid, 
                                   estancia_id: estanciaid,
                                   tipo: tipo}
               ).execute
        end

        def self.validador(personaid, estanciaid, tipo)
               response = RestClient::Request.new(
                      :method => :post,
                      :url => 'localhost:4000/email/enviaraval',
                      :payload => {persona_id: personaid, 
                                   estancia_id: estanciaid,
                                   tipo: tipo}
               ).execute
        end

    end   
end