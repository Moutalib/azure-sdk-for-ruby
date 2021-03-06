# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::RecoveryServicesBackup
  module Models
    #
    # Base class for operation result info.
    #
    class OperationResultInfoBaseResource < OperationWorkerResponse

      include MsRestAzure

      include MsRest::JSONable
      # @return [OperationResultInfoBase] OperationResultInfoBaseResource
      # operation
      attr_accessor :operation


      #
      # Mapper for OperationResultInfoBaseResource class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'OperationResultInfoBaseResource',
          type: {
            name: 'Composite',
            class_name: 'OperationResultInfoBaseResource',
            model_properties: {
              status_code: {
                required: false,
                serialized_name: 'statusCode',
                type: {
                  name: 'Enum',
                  module: 'HttpStatusCode'
                }
              },
              headers: {
                required: false,
                serialized_name: 'Headers',
                type: {
                  name: 'Dictionary',
                  value: {
                      required: false,
                      serialized_name: 'ArrayElementType',
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
                  }
                }
              },
              operation: {
                required: false,
                serialized_name: 'operation',
                type: {
                  name: 'Composite',
                  polymorphic_discriminator: 'objectType',
                  uber_parent: 'OperationResultInfoBase',
                  class_name: 'OperationResultInfoBase'
                }
              }
            }
          }
        }
      end
    end
  end
end
