# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::MobileEngagement
  module Models
    #
    # Send only to users who haven't used the app in the last {threshold} days.
    #
    class EngageIdleUsersFilter < Filter

      include MsRestAzure

      include MsRest::JSONable

      def initialize
        @type = "engage-idle-users"
      end

      attr_accessor :type

      # @return [Integer] An integer value representing the threshold to apply
      # on this filter.
      attr_accessor :threshold


      #
      # Mapper for EngageIdleUsersFilter class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'engage-idle-users',
          type: {
            name: 'Composite',
            class_name: 'EngageIdleUsersFilter',
            model_properties: {
              type: {
                required: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              threshold: {
                required: false,
                serialized_name: 'threshold',
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end
