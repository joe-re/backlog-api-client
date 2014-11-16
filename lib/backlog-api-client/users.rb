module BacklogApiClient
  class Client
    class Users
      RESOURCE_NAME = 'users'

      def initialize(client)
        @client = client
      end

      def list
        @client.get(RESOURCE_NAME)
      end
    end
  end
end
