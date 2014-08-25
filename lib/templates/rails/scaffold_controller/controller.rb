<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :build_<%= singular_table_name %>, only: [:create]
  load_and_authorize_resource

  # GET <%= route_url %>
  def index
  end

  # GET <%= route_url %>/1
  def show
  end

  # GET <%= route_url %>/new
  def new
  end

  # GET <%= route_url %>/1/edit
  def edit
  end

  # POST <%= route_url %>
  def create
    if @<%= orm_instance.save %>
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %>
    else
      render :new
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %>
    else
      render :edit
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= orm_instance.destroy %>
    redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %>
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[:<%= singular_table_name %>]
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end

    # sanitize search parameters, consider implementing the ransackable methods
    def <%= "#{singular_table_name}_search_params" %>
      params[:q].assert_valid_keys(<%= attributes_names.inject(["'s'"]) { |arr,name| arr << "'#{name}_cont'" }.join(', ') %>) unless params[:q].blank?
      params[:q]
    end
    
    def set_index
      @q = <%= singular_table_name.camelize %>.search(<%= "#{singular_table_name}_search_params" %>, auth_object: current_user)
      @<%= plural_table_name %> = @q.result(distinct: true).accessible_by(current_ability).page params[:page]
    end
    
    def build_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    end
end
<% end -%>
