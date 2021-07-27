module ApplicationHelper
    def menu_link_to(link_text, link_path)
        class_name = current_page?(link_path) ? 'nav-link active' : 'nav-link'
        link_to link_text, link_path, class: class_name
      end
end
