module SearchQueriesHelper
  def link_to_add_search_line(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("search_queries/search_line", f: builder)
    end
    link_to(name, '#', class: "btn btn-success fa fa-plus-circle add_fields", id: "add_condition", data: {id: id, fields: fields.gsub("\n", "")})
  end

  # def link_to_add_search_line1(name, p_o, p_f, render_lvl, association)
  #   puts "render_lvl: " + render_lvl.to_s
  #   if render_lvl < 2
  #     render_lvl += 1
  #     new_object = p_o.send(association).klass.new
  #     id = new_object.object_id
  #     fields = p_f.fields_for(association, new_object, child_index: id) do |builder|
  #       render("search_queries/search_line", f: builder, p_object: p_o, p_form: p_f, render_lvl: render_lvl)
  #     end
  #     link_to(name, '#', class: "btn btn-success fa fa-plus-circle add_fields", id: "add_condition", data: {id: id, fields: fields.gsub("\n", "")})
  #   end
  # end
end
