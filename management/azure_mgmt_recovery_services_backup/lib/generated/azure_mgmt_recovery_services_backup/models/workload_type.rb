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
    # Defines values for WorkloadType
    #
    module WorkloadType
      Invalid = "Invalid"
      VM = "VM"
      FileFolder = "FileFolder"
      AzureSqlDb = "AzureSqlDb"
      SQLDB = "SQLDB"
      Exchange = "Exchange"
      Sharepoint = "Sharepoint"
      VMwareVM = "VMwareVM"
      SystemState = "SystemState"
      Client = "Client"
      GenericDataSource = "GenericDataSource"
    end
  end
end
