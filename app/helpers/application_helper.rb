module ApplicationHelper
  def full_title(page_title = "")
    base_title = "QuestIt"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  def nav_link(link_text, link_path)
    class_name = @current_page == link_text  ? "nav-link active" : "nav-link"
    content_tag(:li, class: "nav-item") do
      link_to link_text, link_path, class: class_name
    end
  end
  def set_current_page(title)
    @current_page = title
  end
end
