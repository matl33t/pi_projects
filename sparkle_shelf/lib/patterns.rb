# Deprecated

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


require 'apa102_rbpi'
include Apa102Rbpi
Apa102Rbpi.configure do |c|
  c.num_leds = 10
  c.simulate = true
end

s1 = Strip.new([0,4])
s2 = Strip.new([5,9])
s1.mirror(s2)
s1.set_pixel(0, 0xff0000, 31)
s1.set_pixel(1, 0x00ff00, 31)
s1.set_pixel(2, 0x0000ff, 31)
s1.set_pixel(3, 0xffffff, 31)
loop { s1.show! }

s3 = Strip.new([0,4])
s4 = Strip.new([5,9])
s3.reverse
s3.mirror(s4)
s3.set_pixel(0, 0xff0000, 31)
s3.set_pixel(1, 0x00ff00, 31)
s4.set_pixel(2, 0x0000ff, 31)
s4.set_pixel(3, 0xffffff, 31)
s4.set_pixel(4, 0xffffff, 31)
loop { s3.show! }

maitai = [255,40,0]

s1 = Substrip.new([0, 9])
s2 = Substrip.new([10, 39])
s3 = Substrip.new([40, 49]).reverse
s4 = Substrip.new([50, 79]).reverse

s1 = strip.add_substrip([0, 9])


strip.configure do |c|

end


s1.mirror(s3)
s2.mirror(s4)
strip.add_substrip(s1)
strip.add_substrip(s2)
strip.add_substrip(s3)
strip.add_substrip(s4)

(0..30).each do |pos|
  if pos % 3 == 0
    s1.set_pixel(pos, 0xff)
  end
  s2.set_pixel(pos, 0xff)
  strip.show!
  s1.set_pixel(pos, 0x0)
  s2.set_pixel(pos, 0x0)
end
