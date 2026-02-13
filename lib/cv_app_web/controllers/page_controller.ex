defmodule CvAppWeb.PageController do
  use CvAppWeb, :controller

  def home(conn, _params) do
    render(conn, "home.html",
      profile: CvApp.CVData.profile(),
      experience: CvApp.CVData.experience(),
      skills: CvApp.CVData.skills(),
      projects: CvApp.CVData.projects(),
      saas_projects: CvApp.CVData.saas_projects(),
      stats: CvApp.CVData.stats(),
      contact: CvApp.CVData.contact()
    )
  end

  def sitemap(conn, _params) do
    conn
    |> put_resp_content_type("application/xml")
    |> render("sitemap.xml")
  end
end
