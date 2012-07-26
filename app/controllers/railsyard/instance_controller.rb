require 'responders'
require 'railsyard-backend/controller'

module Railsyard
  class InstanceController < Railsyard::ApplicationController

    include Railsyard::Backend::Controller::Instance
    include Railsyard::Backend::Controller::Authentication
    include Railsyard::Backend::Controller::Authorization

    helper_method :editor_config
    helper_method :instance
    helper_method :instance_class
    helper_method :authenticator

    layout "railsyard/admin"

    before_filter :authenticate!
    before_filter :authorize_action!

    respond_to :html, except: :reorder
    respond_to :json, only: :reorder

    responders :flash

    def edit
      respond_with instance
    end

    def update
      instance.update_attributes(params[instance_name])
      respond_with instance, location: edit_instance_path(underscore_class_name: instance_name)
    end

    protected

    def instance_name
      params[:underscore_class_name]
    end

    def member_action?
      true
    end

    def authorize_action!
      authorize!(action_name, instance)
    end

  end
end
