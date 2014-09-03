class BootstrapTablePresenter < Admino::Table::Presenter
  private

  def table_html_options
    { class: 'table table-striped table-hover table-admino' }
  end

  def resource_row(resource, view_context)
    ResourceRow.new(resource, view_context)
  end

  class ResourceRow < Admino::Table::ResourceRow
    def edit_action_url
      view_context.edit_resource_url(resource)
    end

    def destroy_action_url
      view_context.resource_url(resource)
    end

    def edit_action_html_options
      { class: 'btn btn-default btn-sm' }
    end

    def destroy_action_html_options
      {
        method: :delete,
        class: 'btn btn-danger btn-sm',
        data: {
          confirm: 'Are you sure?'
        }
      }
    end
  end
end

