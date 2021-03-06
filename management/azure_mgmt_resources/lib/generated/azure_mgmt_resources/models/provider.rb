# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Resources
  module Models
    #
    # Resource provider information.
    #
    class Provider

      include MsRestAzure

      include MsRest::JSONable
      # @return [String] The provider ID.
      attr_accessor :id

      # @return [String] The namespace of the resource provider.
      attr_accessor :namespace

      # @return [String] The registration state of the provider.
      attr_accessor :registration_state

      # @return [Array<ProviderResourceType>] The collection of provider
      # resource types.
      attr_accessor :resource_types


      #
      # Mapper for Provider class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'Provider',
          type: {
            name: 'Composite',
            class_name: 'Provider',
            model_properties: {
              id: {
                required: false,
                read_only: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              namespace: {
                required: false,
                serialized_name: 'namespace',
                type: {
                  name: 'String'
                }
              },
              registration_state: {
                required: false,
                read_only: true,
                serialized_name: 'registrationState',
                type: {
                  name: 'String'
                }
              },
              resource_types: {
                required: false,
                read_only: true,
                serialized_name: 'resourceTypes',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'ProviderResourceTypeElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ProviderResourceType'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
