require 'apa102_rbpi'

module SparkleShelf
  module Patterns
    class << self
      include Apa102Rbpi

      def seizure_mode(hz)
        strip = Apa102.new(120, {
          brightness: 5,
          led_frame_rgb_offsets: {
            red: 3,
            blue: 2,
            green: 1
          }
        })

        loop do
          [0xff0000, 0x00ff00, 0x0000ff].each do |color|
            (0..120).each do |pos|
              strip.set_pixel_color(pos, color)
            end
            strip.show!
            sleep 1.0/hz
          end
        end
      end
    end
  end
end
