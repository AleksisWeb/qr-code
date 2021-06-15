module ApplicationHelper
  def bootstrap_class_for(name)
    {
     notice: "alert-success",
     alert: "alert-danger"
    }[name.to_sym] || name
  end
end
