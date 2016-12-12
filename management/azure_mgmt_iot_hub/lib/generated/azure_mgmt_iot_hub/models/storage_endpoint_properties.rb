# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::IotHub
  module Models
    #
    # The properties of the Azure Storage endpoint for file upload.
    #
    class StorageEndpointProperties

      include MsRestAzure

      # @return [Duration] The period of time for which the the SAS URI
      # generated by IoT Hub for file upload is valid. See:
      # https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-file-upload#file-upload-notification-configuration-options.
      attr_accessor :sas_ttl_as_iso8601

      # @return [String] The connection string for the Azure Storage account to
      # which files are uploaded.
      attr_accessor :connection_string

      # @return [String] The name of the root container where you upload files.
      # The container need not exist but should be creatable using the
      # connectionString specified.
      attr_accessor :container_name


      #
      # Mapper for StorageEndpointProperties class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'StorageEndpointProperties',
          type: {
            name: 'Composite',
            class_name: 'StorageEndpointProperties',
            model_properties: {
              sas_ttl_as_iso8601: {
                required: false,
                serialized_name: 'sasTtlAsIso8601',
                type: {
                  name: 'TimeSpan'
                }
              },
              connection_string: {
                required: true,
                serialized_name: 'connectionString',
                type: {
                  name: 'String'
                }
              },
              container_name: {
                required: true,
                serialized_name: 'containerName',
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
