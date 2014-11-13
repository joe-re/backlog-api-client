module BacklogV2Client
  class Client
    class Space
      RESOURCE_NAME = 'space'

      def initialize(client)
        @client = client
      end

      def information
        @client.get(RESOURCE_NAME)
      end
    end
  end
end
