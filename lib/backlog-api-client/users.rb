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

      def information(user_id)
        @client.get("#{RESOURCE_NAME}/#{user_id}")
      end
    end
  end
end
