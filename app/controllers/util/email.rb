require 'rest-client'
require 'json'

module Util
    module Email
        def self.notificar(personaid, estanciaid, tipo)
               response = RestClient::Request.new(
                      :method => :post,
                      :url => 'localhost:5000/email/enviararp',
                      :payload => {persona_id: personaid, 
                                   estancia_id: estanciaid,
                                   tipo: tipo}
               ).execute
        end

        def self.validador(personaid, estanciaid, tipo)
               response = RestClient::Request.new(
                      :method => :post,
                      :url => 'localhost:5000/email/enviaraval',
                      :payload => {persona_id: personaid, 
                                   estancia_id: estanciaid,
                                   tipo: tipo}
               ).execute
         end

         def self.corregir(personaid, estanciaid, comentarioid )
                 response = RestClient::Request.new(
                      :method => :post,
                      :url => 'localhost:5000/email/enviarcorr',
                      :payload => {persona_id: personaid, 
                                   estancia_id: estanciaid,
                                   comentario_id: comentarioid}
                 ).execute
          end

          def self.firmaconv(comentarioid )
                 response = RestClient::Request.new(
                      :method => :post,
                      :url => 'localhost:5000/email/enviarfirma',
                      :payload => {comentario_id: comentarioid}
                 ).execute
          end

    end   
end