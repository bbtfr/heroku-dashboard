module Heroku::Base
  extend ActiveSupport::Concern

  included do
    self.user = ""
    self.site = "https://api.heroku.com/"

    # remove url extension name suffix (eg: .json)
    self.include_format_in_path = false

    # caching
    cached_resource

  end

  module ClassMethods
    # Remove find(:one, options)
    def find(*arguments)
      scope   = arguments.slice!(0)
      options = arguments.slice!(0) || {}

      case scope
        when :all   then find_every(options)
        when :first then find_every(options).first
        when :last  then find_every(options).last
        else             find_single(scope, options)
      end
    end

    private
      # Remove option[:from]
      # Find every resource
      def find_every(options)
        begin
          
          prefix_options, query_options = split_options(options[:params])
          path = collection_path(prefix_options, query_options)

          password = connection.password
          apikeys = options[:apikeys] || [options[:apikey]]
          apikeys = Heroku::Account.pluck(:apikey) unless apikeys.any?
          Rails.logger.debug "Connect to Heroku with apikeys: #{apikeys}"

          every = apikeys.reduce([]) do |ret, apikey|
            connection.password = apikey
            ret += (format.decode(connection.get(path, headers).body) || [])
          end
          connection.password = password

          instantiate_collection(every, query_options, prefix_options )
        rescue ActiveResource::ResourceNotFound
          # Swallowing ResourceNotFound exceptions and return nil - as per
          # ActiveRecord.
          nil
        end
      end

      # Find a single resource from the default URL
      def find_single(scope, options)
        prefix_options, query_options = split_options(options[:params])
        path = element_path(scope, prefix_options, query_options)

        password = connection.password
        apikeys = options[:apikeys] || [options[:apikey]]
        apikeys = Heroku::Account.pluck(:apikey) unless apikeys.any?
        Rails.logger.debug "Connect to Heroku with apikeys: #{apikeys}"

        apikeys.each do |apikey|
          connection.password = apikey
          
          begin
            single = format.decode(connection.get(path, headers).body)
          rescue ActiveResource::ResourceNotFound
            next
          end

          connection.password = password
          return instantiate_record(single, prefix_options)
        end
        connection.password = password
          
        raise ActiveResource::ResourceNotFound
        ## TODO
      end
  end
end