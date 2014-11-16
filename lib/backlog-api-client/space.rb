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

      def image
        @client.get("#{RESOURCE_NAME}/image")
      end

      def notification
        @client.get("#{RESOURCE_NAME}/notification")
      end

      def update_notification(content)
        @client.put("#{RESOURCE_NAME}/notification", content)
      end

      def disk_usage
        @client.get("#{RESOURCE_NAME}/diskUsage")
      end

    end
  end
end
