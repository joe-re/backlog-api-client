module BacklogApiClient
  class Client
    class Projects
      RESOURCE_NAME = 'projects'

      def initialize(client)
        @client = client
      end

      def custom_fields
        CustomFields.new(@client, RESOURCE_NAME)
      end

      class CustomFields
        RESOURCE_NAME = 'customFields'

        def initialize(client, parent_resource_name)
          @client = client
          @parent_resource_name = parent_resource_name
        end

        def list(project_id_or_key)
          @client.get("#{@parent_resource_name}/#{project_id_or_key}/#{RESOURCE_NAME}")
        end
      end
    end
  end
end
