require 'responders'
require 'railsyard-backend/controller'

module Railsyard
  class ResourcesController < Railsyard::ApplicationController

    include Railsyard::Backend::Controller::Resource
    include Railsyard::Backend::Controller::Authentication
    include Railsyard::Backend::Controller::Authorization

    helper_method :collection
    helper_method :editor_config
    helper_method :collection_name
    helper_method :resource
    helper_method :resource_class

    layout "railsyard/admin"

    before_filter :authenticate!
    before_filter :authorize_action!

    respond_to :html, except: :reorder
    respond_to :json, only: :reorder

    responders :flash

    def index
      if params[:format].blank? || params[:format] == "html"
        respond_with collection
      else
        exporter = Railsyard::Backend.export_manager.exporter_for(params[:format])
        if exporter.present? && editor_config.exportable_as?(params[:format])
          send_data exporter.data_for(collection.all), exporter.send_data_options
        else
          raise ActionController::RoutingError.new("Export not available.")
        end
      end
    end

    def reorder
      records = params[resource_name].map { |id| resource_class.find(id) }
      min_position = ((params[:page].to_i || 1) - 1) * editor_config.list.page_size
      records.each_with_index do |record, position|
        record.update_attribute(
          editor_config.list.sorting_attribute,
          min_position + position
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
      respond_with resource, location: resources_path(tableized_class_name: collection_name)
    end

    def update
      resource.update_attributes(resource_params)
      respond_with resource, location: resources_path(tableized_class_name: collection_name)
    end

    def destroy
      resource.destroy
      respond_with resource, location: resources_path(tableized_class_name: collection_name)
    end

    protected

    def resource_id
      params[:id]
    end

    def resource_params
      params[resource_name]
    end

    def collection_name
      params[:tableized_class_name]
    end

    def member_action?
      [ :show, :edit, :destroy ].include? action_name
    end

    def authorize_action!
      resource_to_authorize = member_action? ? resource : resource_class
      authorize!(action_name, resource_to_authorize)
    end

  end
end
