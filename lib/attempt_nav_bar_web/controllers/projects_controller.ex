defmodule AttemptNavBarWeb.ProjectsController do
  use AttemptNavBarWeb, :controller

  def projects(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :projects, layout: false)
  end
end
