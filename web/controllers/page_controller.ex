defmodule Wheelie.PageController do
  use Wheelie.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
