module PinsHelper

    def pin_image(pin)
        if pin.pin_image.attached?
            image_tag pin.pin_image.variant(resize_to_limit: [150, nil])
        else
            image_tag "placeholder.png"
        end
    end



end
