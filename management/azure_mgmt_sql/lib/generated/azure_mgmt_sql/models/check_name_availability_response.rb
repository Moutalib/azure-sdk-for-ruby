# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::SQL
  module Models
    #
    # A response indicating whether the specified name for a resource is
    # available.
    #
    class CheckNameAvailabilityResponse

      include MsRestAzure

      include MsRest::JSONable
      # @return [Boolean] True if the name is available, otherwise false.
      attr_accessor :available

      # @return [String] A message explaining why the name is unavailable. Will
      # be null if the name is available.
      attr_accessor :message

      # @return [String] The name whose availability was checked.
      attr_accessor :name

      # @return [CheckNameAvailabilityReason] The reason code explaining why
      # the name is unavailable. Will be null if the name is available.
      # Possible values include: 'Invalid', 'AlreadyExists'
      attr_accessor :reason


      #
      # Mapper for CheckNameAvailabilityResponse class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'CheckNameAvailabilityResponse',
          type: {
            name: 'Composite',
            class_name: 'CheckNameAvailabilityResponse',
            model_properties: {
              available: {
                required: false,
                read_only: true,
                serialized_name: 'available',
                type: {
                  name: 'Boolean'
                }
              },
              message: {
                required: false,
                read_only: true,
                serialized_name: 'message',
                type: {
                  name: 'String'
                }
              },
              name: {
                required: false,
                read_only: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              reason: {
                required: false,
                read_only: true,
                serialized_name: 'reason',
                type: {
                  name: 'Enum',
                  module: 'CheckNameAvailabilityReason'
                }
              }
            }
          }
        }
      end
    end
  end
end
