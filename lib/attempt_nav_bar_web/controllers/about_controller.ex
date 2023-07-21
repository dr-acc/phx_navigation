defmodule AttemptNavBarWeb.AboutController do
  use AttemptNavBarWeb, :controller

  def about(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :about, layout: false)
  end
end
