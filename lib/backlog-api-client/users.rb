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

      def create(request)
        @client.post(RESOURCE_NAME, request)
      end

      def delete(user_id)
        @client.delete("#{RESOURCE_NAME}/#{user_id}")
      end

      def myself
        @client.get("#{RESOURCE_NAME}/myself")
      end

      def icon(user_id)
        @client.get("#{RESOURCE_NAME}/#{user_id}/icon")
      end

      def activities(user_id, request = {})
        @client.get("#{RESOURCE_NAME}/#{user_id}/activities", request)
      end
    end
  end
end
