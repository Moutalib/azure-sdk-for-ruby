# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::IotHub
  module Models
    #
    # The properties of the provisioned Event Hub-compatible endpoint used by
    # the IoT hub.
    #
    class EventHubProperties

      include MsRestAzure

      # @return [Integer] The retention time for device-to-cloud messages in
      # days. See:
      # https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#device-to-cloud-messages
      attr_accessor :retention_time_in_days

      # @return [Integer] The number of paritions for receiving device-to-cloud
      # messages in the Event Hub-compatible endpoint. See:
      # https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#device-to-cloud-messages.
      attr_accessor :partition_count

      # @return [Array<String>] The partition ids in the Event Hub-compatible
      # endpoint.
      attr_accessor :partition_ids

      # @return [String] The Event Hub-compatible name.
      attr_accessor :path

      # @return [String] The Event Hub-compatible endpoint.
      attr_accessor :endpoint


      #
      # Mapper for EventHubProperties class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'EventHubProperties',
          type: {
            name: 'Composite',
            class_name: 'EventHubProperties',
            model_properties: {
              retention_time_in_days: {
                required: false,
                serialized_name: 'retentionTimeInDays',
                type: {
                  name: 'Number'
                }
              },
              partition_count: {
                required: false,
                serialized_name: 'partitionCount',
                type: {
                  name: 'Number'
                }
              },
              partition_ids: {
                required: false,
                read_only: true,
                serialized_name: 'partitionIds',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              path: {
                required: false,
                read_only: true,
                serialized_name: 'path',
                type: {
                  name: 'String'
                }
              },
              endpoint: {
                required: false,
                read_only: true,
                serialized_name: 'endpoint',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
