module BacklogApiClient
  class Client
    class Space
      RESOURCE_NAME = 'space'

      def initialize(client)
        @client = client
      end

      def get_information
        @client.get(RESOURCE_NAME)
      end
    end
  end
end
