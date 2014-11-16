module BacklogApiClient
  class Client
    class Space
      RESOURCE_NAME = 'space'

      def initialize(client)
        @client = client
      end

      def information
        @client.get(RESOURCE_NAME)
      end

      def activities(request = {})
        @client.get("#{RESOURCE_NAME}/activities", request)
      end
    end
  end
end
