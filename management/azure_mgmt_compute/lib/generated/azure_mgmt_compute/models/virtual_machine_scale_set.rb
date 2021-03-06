# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.1.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Describes a Virtual Machine Scale Set.
    #
    class VirtualMachineScaleSet < MsRestAzure::Resource

      include MsRestAzure

      include MsRest::JSONable
      # @return [Sku] The virtual machine scale set sku.
      attr_accessor :sku

      # @return [Plan] The purchase plan when deploying a virtual machine scale
      # set from VM Marketplace images.
      attr_accessor :plan

      # @return [UpgradePolicy] The upgrade policy.
      attr_accessor :upgrade_policy

      # @return [RecoveryPolicy] The recovery policy.
      attr_accessor :recovery_policy

      # @return [VirtualMachineScaleSetVMProfile] The virtual machine profile.
      attr_accessor :virtual_machine_profile

      # @return [String] The provisioning state, which only appears in the
      # response.
      attr_accessor :provisioning_state

      # @return [Boolean] Specifies whether the Virtual Machine Scale Set
      # should be overprovisioned.
      attr_accessor :overprovision

      # @return [String] Specifies the ID which uniquely identifies a Virtual
      # Machine Scale Set.
      attr_accessor :unique_id

      # @return [Boolean] When true this limits the scale set to a single
      # placement group, of max size 100 virtual machines.
      attr_accessor :single_placement_group

      # @return [VirtualMachineScaleSetIdentity] The identity of the virtual
      # machine scale set, if configured.
      attr_accessor :identity


      #
      # Mapper for VirtualMachineScaleSet class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'VirtualMachineScaleSet',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineScaleSet',
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
                required: true,
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
              sku: {
                required: false,
                serialized_name: 'sku',
                type: {
                  name: 'Composite',
                  class_name: 'Sku'
                }
              },
              plan: {
                required: false,
                serialized_name: 'plan',
                type: {
                  name: 'Composite',
                  class_name: 'Plan'
                }
              },
              upgrade_policy: {
                required: false,
                serialized_name: 'properties.upgradePolicy',
                type: {
                  name: 'Composite',
                  class_name: 'UpgradePolicy'
                }
              },
              recovery_policy: {
                required: false,
                serialized_name: 'properties.recoveryPolicy',
                type: {
                  name: 'Composite',
                  class_name: 'RecoveryPolicy'
                }
              },
              virtual_machine_profile: {
                required: false,
                serialized_name: 'properties.virtualMachineProfile',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualMachineScaleSetVMProfile'
                }
              },
              provisioning_state: {
                required: false,
                read_only: true,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              overprovision: {
                required: false,
                serialized_name: 'properties.overprovision',
                type: {
                  name: 'Boolean'
                }
              },
              unique_id: {
                required: false,
                read_only: true,
                serialized_name: 'properties.uniqueId',
                type: {
                  name: 'String'
                }
              },
              single_placement_group: {
                required: false,
                serialized_name: 'properties.singlePlacementGroup',
                type: {
                  name: 'Boolean'
                }
              },
              identity: {
                required: false,
                serialized_name: 'identity',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualMachineScaleSetIdentity'
                }
              }
            }
          }
        }
      end
    end
  end
end
