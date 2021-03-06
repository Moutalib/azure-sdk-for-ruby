# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Logic
  module Models
    #
    # The integration account partner.
    #
    class IntegrationAccountPartner < MsRestAzure::Resource

      include MsRestAzure

      include MsRest::JSONable
      # @return [PartnerType] The partner type. Possible values include:
      # 'NotSpecified', 'B2B'
      attr_accessor :partner_type

      # @return [DateTime] The created time.
      attr_accessor :created_time

      # @return [DateTime] The changed time.
      attr_accessor :changed_time

      # @return The metadata.
      attr_accessor :metadata

      # @return [PartnerContent] The partner content.
      attr_accessor :content


      #
      # Mapper for IntegrationAccountPartner class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'IntegrationAccountPartner',
          type: {
            name: 'Composite',
            class_name: 'IntegrationAccountPartner',
            model_properties: {
              id: {
                required: false,
                read_only: true,
                serialized_name: 'id',
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
              type: {
                required: false,
                read_only: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              location: {
                required: false,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              tags: {
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              partner_type: {
                required: true,
                serialized_name: 'properties.partnerType',
                type: {
                  name: 'Enum',
                  module: 'PartnerType'
                }
              },
              created_time: {
                required: false,
                read_only: true,
                serialized_name: 'properties.createdTime',
                type: {
                  name: 'DateTime'
                }
              },
              changed_time: {
                required: false,
                read_only: true,
                serialized_name: 'properties.changedTime',
                type: {
                  name: 'DateTime'
                }
              },
              metadata: {
                required: false,
                serialized_name: 'properties.metadata',
                type: {
                  name: 'Object'
                }
              },
              content: {
                required: true,
                serialized_name: 'properties.content',
                type: {
                  name: 'Composite',
                  class_name: 'PartnerContent'
                }
              }
            }
          }
        }
      end
    end
  end
end
