module AdminLteRails
  module RestControllerConcern
    extend ActiveSupport::Concern

    included do
      before_action :load_resource, only: [:show, :edit, :update, :destroy]
    end

    def index
      @collection = resource_class.all
      set_collection @collection
    end

    def new
      @resource = resource_class.new
      set_resource @resource
    end

    def create
      @resource = resource_class.new(permitted_params)
      set_resource @resource
      if @resource.save
        redirect_to collection_path, notice: I18n.t('adminlte.notice.create', default: 'Created')
      else
        flash[:alert] = I18n.t('adminlte.notice.validation', default: 'Please fix errors in given data.')
        render :new
      end
    end

    def edit
      set_resource @resource
    end

    def update
      set_resource @resource
      if @resource.update_attributes(permitted_params)
        redirect_to collection_path, notice: I18n.t('adminlte.notice.update', default: 'Updated')
      else
        flash[:alert] = I18n.t('adminlte.notice.validation', default: 'Please fix errors in given data.')
        render :edit
      end
    end

    def destroy
      set_resource @resource
      @resource.destroy
      redirect_to collection_path, alert: I18n.t('adminlte.notice.destroy', default: 'Deleted')
    end

    #todo rethink if this might need to go to separate module
    def reorder
      @record = resource_class.find params[:record_id]

      unless @record.respond_to?(:position)
        raise StandardError, "#{@record} does not have :position field"
      end

      @record.insert_at(params[:position].to_i+1)
      render nothing: true
    end

    private

    def load_resource
      if resource_class.respond_to? :friendly
        @resource = resource_class.friendly.find params[:id]
      else
        @resource = resource_class.find params[:id]
      end
    end

    # TODO Have a look at InheritedResources for inspiration
    # https://github.com/josevalim/inherited_resources
    def set_resource(resource)
      resource_name = resource.class.name.singularize.underscore
      instance_variable_set "@#{resource_name}", resource
    end

    def set_collection(collection)
      collection_name = collection.klass.name.pluralize.underscore
      instance_variable_set "@#{collection_name}", collection
    end

    def resource_class
      controller_name.classify.constantize
    end

    def collection_path
      url_for(controller: controller_path, action: :index)
    end

    def resource_path(resource)
      url_for(controller: controller_path, action: :show, id: resource)
    end

    def new_resource_path
      url_for(controller: controller_path, action: :new)
    end

    def edit_resource_path(resource)
      url_for(controller: controller_path, action: :edit, id: resource)
    end

  end
end