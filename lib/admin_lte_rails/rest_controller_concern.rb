module AdminLteRails
  module RestControllerConcern
    extend ActiveSupport::Concern

    included do
      before_action :load_resource, only: [:show, :edit, :update, :destroy]
    end

    def index
      @collection = resource_scope
      set_collection @collection
    end

    def new
      @resource = resource_scope.new
      set_resource @resource
    end

    def create
      @resource = resource_scope.new(permitted_params)
      set_resource @resource
      if @resource.save
        redirect_to collection_path, notice: I18n.t('adminlte.notice.create', default: 'Created')
      else
        flash.alert = I18n.t('adminlte.notice.validation', default: 'Please fix errors in given data.')
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
        flash.alert = I18n.t('adminlte.notice.validation', default: 'Please fix errors in given data.')
        render :edit
      end
    end

    def destroy
      set_resource @resource
      if @resource.destroy
        flash.notice = I18n.t('adminlte.notice.destroy', default: 'Deleted')
      else
        flash.alert = I18n.t('adminlte.notice.destroy_failed', default: 'Item could not be deleted')
      end
      redirect_to collection_path
    end

    # TODO rethink if this might need to go to separate module
    def reorder
      load_resource params[:record_id]

      unless @resource.respond_to?(:position)
        raise StandardError, "#{@resource} does not have :position field"
      end

      @resource.insert_at(params[:position].to_i+1)
      render nothing: true
    end

    private

    # Returns model class name (e.g. Project)
    def resource_class
      controller_name.classify.constantize
    end

    # If you need to scope down you can override this in your controller
    # So instead of doing Project.all you could override this to use
    #   Product.with_translations(I18n.locale)
    def resource_scope
      if resource_class.respond_to? :friendly
        resource_class.friendly
      else
        resource_class.all
      end
    end

    def load_resource(lookup_field=params[:id])
      @resource = resource_scope.find lookup_field
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

    # Paths

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