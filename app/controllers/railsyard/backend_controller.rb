require 'responders'
require 'railsyard/backend/controller'

module Railsyard
  class BackendController < Railsyard::ApplicationController

    include Railsyard::Backend::Controller::Filters
    include Railsyard::Backend::Controller::Resource
    include Railsyard::Backend::Controller::Authentication
    include Railsyard::Backend::Controller::Authorization
    include Railsyard::Backend::Controller::Urls

    helper_method :collection
    helper_method :editor_config
    helper_method :collection_name
    helper_method :resource
    helper_method :resource_class

    helper_method :create_resource_path
    helper_method :update_resource_path
    helper_method :reorder_resources_path

    layout "railsyard/admin"

    before_filter :ensure_model_existance!
    before_filter :ensure_editor_existance!
    before_filter :authenticate!
    before_filter :authorize_action!

    respond_to :html, except: :reorder
    respond_to :json, only: :reorder

    responders :flash

    def index
      respond_with collection
    end

    def reorder
      params[resource_name].each_with_index do |id, position|
        record = resource_class.find(id)
        record.update_attribute(
          editor_config.list.sorting_attribute,
          position
        )
      end
      render json: { success: true }
    end

    def new
      respond_with build_resource
    end

    def edit
      respond_with resource
    end

    def create
      build_resource
      resource.save
      respond_with resource, location: resources_path
    end

    def update
      resource.update_attributes(resource_params)
      respond_with resource, location: resources_path
    end

    def destroy
      resource.destroy
      respond_with resource, location: resources_path
    end

    protected

    def resource_id
      params[:id]
    end

    def resource_params
      params[resource_name]
    end

    def collection_name
      params[:resource_class]
    end

    def editor_config
      @editor_config ||= Railsyard.backend.editor_for(resource_class)
    end

    def member_action?
      [ :show, :edit, :destroy ].include? action_name
    end

  end
end
