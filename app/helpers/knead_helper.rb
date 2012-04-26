module KneadHelper
  def knead_user
    if current_user
      name = current_user.respond_to?(:name) ? current_user.name : ""
      id = current_user.respond_to?(:id) ? current_user.id : ""

      "<script type=\"text/javascript\">this._kneadUser = { \"name\": #{name.to_json}, \"id\": #{id.to_json} };</script>".html_safe
    end
  rescue
    nil
  end
end