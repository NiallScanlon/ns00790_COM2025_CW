RailsAdmin.config do |config|
  config.parent_controller = "::ApplicationController"
  config.authorize_with do
    unless current_user && current_user.isAdmin?
      redirect_to(
          '/home',
          alert: "To access the admin panel, you must be logged into an admin account. "
      )
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
