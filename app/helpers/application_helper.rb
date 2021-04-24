module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
  
  def avatar_path(object, options = {})
    size = options[:size] || 180
    default_image = options[:default] || "mp"
    base_url =  "https://secure.gravatar.com/avatar"
    base_url_params = "?s=#{size}&d=#{default_image}"
    
    if object.respond_to?(:avatar) && object.avatar.attached? && object.avatar.variable?
      object.avatar.variant(resize_to_fill: [size, size, { gravity: 'Center' }])
    elsif object.respond_to?(:email) && object.email
      gravatar_id = Digest::MD5::hexdigest(object.email.downcase)
      "#{base_url}/#{gravatar_id}#{base_url_params}"
    else
      "#{base_url}/00000000000000000000000000000000#{base_url_params}"
    end
  end

  def main_image(model)
    if model.main_image.attached?
        image_tag model.main_image.variant(resize_to_limit: [380, nil])
    else
        image_tag "placeholder.jpg"
    end
  end   

  def round_nicely(number)
    if number.round(1) == number.to_i
      number.to_i
    else
      number.round(1)
    end
  end

  def nice_date(date)
    "#{date.strftime("%A %b")} #{date.day.ordinalize}"
    "#{date.strftime("%A")} #{date.day.ordinalize} #{date.strftime("%b")}"
  end


end


