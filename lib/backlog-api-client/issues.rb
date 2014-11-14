module BacklogApiClient
  class Client
    class Issues
      RESOURCE_NAME = 'issues'

      def initialize(client)
        @client = client
      end

      def get_information(isuue_id_or_key)
        @client.get("#{RESOURCE_NAME}/#{isuue_id_or_key}")
      end
    end
  end
end
