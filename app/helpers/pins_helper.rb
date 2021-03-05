module PinsHelper

    def show_pin_image(pin)
        if pin.pin_image.attached?
            image_tag pin.pin_image.variant(resize_to_limit: [300, nil])
        else
            image_tag "placeholder.jpg"
        end
    end



end
