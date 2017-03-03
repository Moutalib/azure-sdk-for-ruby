# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  #
  # Composite Swagger for Compute Client
  #
  class ContainerServices
    include Azure::ARM::Compute::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the ContainerServices class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [ComputeManagementClient] reference to the ComputeManagementClient
    attr_reader :client

    #
    # Gets a list of container services in the specified subscription.
    #
    # Gets a list of container services in the specified subscription. The
    # operation returns properties of each container service including state,
    # orchestrator, number of masters and agents, and FQDNs of masters and agents.
    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<ContainerService>] operation results.
    #
    def list(custom_headers = nil)
      first_page = list_as_lazy(custom_headers)
      first_page.get_all_items
    end

    #
    # Gets a list of container services in the specified subscription.
    #
    # Gets a list of container services in the specified subscription. The
    # operation returns properties of each container service including state,
    # orchestrator, number of masters and agents, and FQDNs of masters and agents.
    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(custom_headers = nil)
      list_async(custom_headers).value!
    end

    #
    # Gets a list of container services in the specified subscription.
    #
    # Gets a list of container services in the specified subscription. The
    # operation returns properties of each container service including state,
    # orchestrator, number of masters and agents, and FQDNs of masters and agents.
    #
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(custom_headers = nil)
      api_version = '2017-01-31'
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/providers/Microsoft.ContainerService/containerServices'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ContainerServiceListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Creates or updates a container service.
    #
    # Creates or updates a container service with the specified configuration of
    # orchestrator, masters, and agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param parameters [ContainerService] Parameters supplied to the Create or
    # Update a Container Service operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ContainerService] operation results.
    #
    def create_or_update(resource_group_name, container_service_name, parameters, custom_headers = nil)
      response = create_or_update_async(resource_group_name, container_service_name, parameters, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param parameters [ContainerService] Parameters supplied to the Create or
    # Update a Container Service operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def create_or_update_async(resource_group_name, container_service_name, parameters, custom_headers = nil)
      # Send request
      promise = begin_create_or_update_async(resource_group_name, container_service_name, parameters, custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
          result_mapper = ContainerService.mapper()
          parsed_response = @client.deserialize(result_mapper, parsed_response, 'parsed_response')
        end

        # Waiting for response.
        @client.get_long_running_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Gets the properties of the specified container service.
    #
    # Gets the properties of the specified container service in the specified
    # subscription and resource group. The operation returns the properties
    # including state, orchestrator, number of masters and agents, and FQDNs of
    # masters and agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ContainerService] operation results.
    #
    def get(resource_group_name, container_service_name, custom_headers = nil)
      response = get_async(resource_group_name, container_service_name, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets the properties of the specified container service.
    #
    # Gets the properties of the specified container service in the specified
    # subscription and resource group. The operation returns the properties
    # including state, orchestrator, number of masters and agents, and FQDNs of
    # masters and agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(resource_group_name, container_service_name, custom_headers = nil)
      get_async(resource_group_name, container_service_name, custom_headers).value!
    end

    #
    # Gets the properties of the specified container service.
    #
    # Gets the properties of the specified container service in the specified
    # subscription and resource group. The operation returns the properties
    # including state, orchestrator, number of masters and agents, and FQDNs of
    # masters and agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(resource_group_name, container_service_name, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'container_service_name is nil' if container_service_name.nil?
      api_version = '2017-01-31'
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ContainerService/containerServices/{containerServiceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'containerServiceName' => container_service_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ContainerService.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Deletes the specified container service.
    #
    # Deletes the specified container service in the specified subscription and
    # resource group. The operation does not delete other resources created as part
    # of creating a container service, including storage accounts, VMs, and
    # availability sets. All the other resources created with the container service
    # are part of the same resource group and can be deleted individually.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    def delete(resource_group_name, container_service_name, custom_headers = nil)
      response = delete_async(resource_group_name, container_service_name, custom_headers).value!
      nil
    end

    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def delete_async(resource_group_name, container_service_name, custom_headers = nil)
      # Send request
      promise = begin_delete_async(resource_group_name, container_service_name, custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
        end

        # Waiting for response.
        @client.get_long_running_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Gets a list of container services in the specified resource group.
    #
    # Gets a list of container services in the specified subscription and resource
    # group. The operation returns properties of each container service including
    # state, orchestrator, number of masters and agents, and FQDNs of masters and
    # agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<ContainerService>] operation results.
    #
    def list_by_resource_group(resource_group_name, custom_headers = nil)
      first_page = list_by_resource_group_as_lazy(resource_group_name, custom_headers)
      first_page.get_all_items
    end

    #
    # Gets a list of container services in the specified resource group.
    #
    # Gets a list of container services in the specified subscription and resource
    # group. The operation returns properties of each container service including
    # state, orchestrator, number of masters and agents, and FQDNs of masters and
    # agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_by_resource_group_with_http_info(resource_group_name, custom_headers = nil)
      list_by_resource_group_async(resource_group_name, custom_headers).value!
    end

    #
    # Gets a list of container services in the specified resource group.
    #
    # Gets a list of container services in the specified subscription and resource
    # group. The operation returns properties of each container service including
    # state, orchestrator, number of masters and agents, and FQDNs of masters and
    # agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_by_resource_group_async(resource_group_name, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      api_version = '2017-01-31'
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ContainerService/containerServices'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ContainerServiceListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Creates or updates a container service.
    #
    # Creates or updates a container service with the specified configuration of
    # orchestrator, masters, and agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param parameters [ContainerService] Parameters supplied to the Create or
    # Update a Container Service operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ContainerService] operation results.
    #
    def begin_create_or_update(resource_group_name, container_service_name, parameters, custom_headers = nil)
      response = begin_create_or_update_async(resource_group_name, container_service_name, parameters, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Creates or updates a container service.
    #
    # Creates or updates a container service with the specified configuration of
    # orchestrator, masters, and agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param parameters [ContainerService] Parameters supplied to the Create or
    # Update a Container Service operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def begin_create_or_update_with_http_info(resource_group_name, container_service_name, parameters, custom_headers = nil)
      begin_create_or_update_async(resource_group_name, container_service_name, parameters, custom_headers).value!
    end

    #
    # Creates or updates a container service.
    #
    # Creates or updates a container service with the specified configuration of
    # orchestrator, masters, and agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param parameters [ContainerService] Parameters supplied to the Create or
    # Update a Container Service operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def begin_create_or_update_async(resource_group_name, container_service_name, parameters, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'container_service_name is nil' if container_service_name.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      api_version = '2017-01-31'
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = ContainerService.mapper()
      request_content = @client.serialize(request_mapper,  parameters, 'parameters')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ContainerService/containerServices/{containerServiceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'containerServiceName' => container_service_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:put, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 201 || status_code == 202
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ContainerService.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ContainerService.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 202
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ContainerService.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Deletes the specified container service.
    #
    # Deletes the specified container service in the specified subscription and
    # resource group. The operation does not delete other resources created as part
    # of creating a container service, including storage accounts, VMs, and
    # availability sets. All the other resources created with the container service
    # are part of the same resource group and can be deleted individually.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def begin_delete(resource_group_name, container_service_name, custom_headers = nil)
      response = begin_delete_async(resource_group_name, container_service_name, custom_headers).value!
      nil
    end

    #
    # Deletes the specified container service.
    #
    # Deletes the specified container service in the specified subscription and
    # resource group. The operation does not delete other resources created as part
    # of creating a container service, including storage accounts, VMs, and
    # availability sets. All the other resources created with the container service
    # are part of the same resource group and can be deleted individually.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def begin_delete_with_http_info(resource_group_name, container_service_name, custom_headers = nil)
      begin_delete_async(resource_group_name, container_service_name, custom_headers).value!
    end

    #
    # Deletes the specified container service.
    #
    # Deletes the specified container service in the specified subscription and
    # resource group. The operation does not delete other resources created as part
    # of creating a container service, including storage accounts, VMs, and
    # availability sets. All the other resources created with the container service
    # are part of the same resource group and can be deleted individually.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param container_service_name [String] The name of the container service in
    # the specified subscription and resource group.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def begin_delete_async(resource_group_name, container_service_name, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'container_service_name is nil' if container_service_name.nil?
      api_version = '2017-01-31'
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ContainerService/containerServices/{containerServiceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'containerServiceName' => container_service_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:delete, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 202 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Gets a list of container services in the specified subscription.
    #
    # Gets a list of container services in the specified subscription. The
    # operation returns properties of each container service including state,
    # orchestrator, number of masters and agents, and FQDNs of masters and agents.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ContainerServiceListResult] operation results.
    #
    def list_next(next_page_link, custom_headers = nil)
      response = list_next_async(next_page_link, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets a list of container services in the specified subscription.
    #
    # Gets a list of container services in the specified subscription. The
    # operation returns properties of each container service including state,
    # orchestrator, number of masters and agents, and FQDNs of masters and agents.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_next_with_http_info(next_page_link, custom_headers = nil)
      list_next_async(next_page_link, custom_headers).value!
    end

    #
    # Gets a list of container services in the specified subscription.
    #
    # Gets a list of container services in the specified subscription. The
    # operation returns properties of each container service including state,
    # orchestrator, number of masters and agents, and FQDNs of masters and agents.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_next_async(next_page_link, custom_headers = nil)
      fail ArgumentError, 'next_page_link is nil' if next_page_link.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '{nextLink}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          skip_encoding_path_params: {'nextLink' => next_page_link},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ContainerServiceListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets a list of container services in the specified resource group.
    #
    # Gets a list of container services in the specified subscription and resource
    # group. The operation returns properties of each container service including
    # state, orchestrator, number of masters and agents, and FQDNs of masters and
    # agents.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ContainerServiceListResult] operation results.
    #
    def list_by_resource_group_next(next_page_link, custom_headers = nil)
      response = list_by_resource_group_next_async(next_page_link, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets a list of container services in the specified resource group.
    #
    # Gets a list of container services in the specified subscription and resource
    # group. The operation returns properties of each container service including
    # state, orchestrator, number of masters and agents, and FQDNs of masters and
    # agents.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_by_resource_group_next_with_http_info(next_page_link, custom_headers = nil)
      list_by_resource_group_next_async(next_page_link, custom_headers).value!
    end

    #
    # Gets a list of container services in the specified resource group.
    #
    # Gets a list of container services in the specified subscription and resource
    # group. The operation returns properties of each container service including
    # state, orchestrator, number of masters and agents, and FQDNs of masters and
    # agents.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_by_resource_group_next_async(next_page_link, custom_headers = nil)
      fail ArgumentError, 'next_page_link is nil' if next_page_link.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '{nextLink}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          skip_encoding_path_params: {'nextLink' => next_page_link},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ContainerServiceListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets a list of container services in the specified subscription.
    #
    # Gets a list of container services in the specified subscription. The
    # operation returns properties of each container service including state,
    # orchestrator, number of masters and agents, and FQDNs of masters and agents.
    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ContainerServiceListResult] which provide lazy access to pages of
    # the response.
    #
    def list_as_lazy(custom_headers = nil)
      response = list_async(custom_headers).value!
      unless response.nil?
        page = response.body
        page.next_method = Proc.new do |next_page_link|
          list_next_async(next_page_link, custom_headers)
        end
        page
      end
    end

    #
    # Gets a list of container services in the specified resource group.
    #
    # Gets a list of container services in the specified subscription and resource
    # group. The operation returns properties of each container service including
    # state, orchestrator, number of masters and agents, and FQDNs of masters and
    # agents.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ContainerServiceListResult] which provide lazy access to pages of
    # the response.
    #
    def list_by_resource_group_as_lazy(resource_group_name, custom_headers = nil)
      response = list_by_resource_group_async(resource_group_name, custom_headers).value!
      unless response.nil?
        page = response.body
        page.next_method = Proc.new do |next_page_link|
          list_by_resource_group_next_async(next_page_link, custom_headers)
        end
        page
      end
    end

  end
end
