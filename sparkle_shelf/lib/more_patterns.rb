require 'apa102_rbpi'
include Apa102Rbpi
@strip = Apa102.new(120, {
  brightness: 25,
  led_frame_rgb_offsets: {
    red: 3,
    blue: 2,
    green: 1
  }
})

def rainbow(hz)
  sleep_time = 1.0/hz
  loop do
    (0..255).each do |c|
      @strip.num_leds.times do |l|
        @strip.set_pixel(l, color_wheel(c))
      end
      @strip.show!
      sleep sleep_time
    end
  end
end


def seizure_mode(hz)
  sleep_time = 1.0/hz
  loop do
    [0xff0000, 0x00ff00, 0x0000ff].each do |color|
      @strip.num_leds.times do |pos|
        @strip.set_pixel(pos, color)
      end
      @strip.show!
      sleep sleep_time
    end
  end
end

def pulse(hz, color)
  sleep_time = 1.0/hz
  (0..31).each do |brightness|
    @strip.num_leds.times do |pos|
      @strip.set_pixel(pos, color, brightness)
    end
    @strip.show!
    sleep sleep_time
  end
  (0..31).reverse_each do |brightness|
    @strip.num_leds.times do |pos|
      @strip.set_pixel(pos, color, brightness)
    end
    @strip.show!
    sleep sleep_time
  end
end

def pulse_loop(hz)
  loop { pulse(hz, color_wheel(rand(256))) }
end

def magic(hz, interval = 5)
  start_idx = rand(@strip.num_leds)
  sleep_time = 1.0/hz
  loop do
    (0..255).each do |c|
      @strip.num_leds.times do |p|
        @strip.set_pixel(p, color_wheel((c + p * interval) & 255))
      end
      @strip.show!
      sleep sleep_time
    end
  end
end

def magic_color(position, interval)
  color_wheel((position * interval) & 255)
end

def magic_snake(hz, length = 1, interval = 10)
  sleep_time = 1.0/hz
  @strip.num_leds.times do |offset|
    # blank all pixels out
    @strip.num_leds.times do |dark_pixel|
      @strip.set_pixel(dark_pixel, 0)
    end
    # draw the snake
    (0..(length - 1)).each do |snake_pos|
      lit_pixel = (offset + snake_pos) % @strip.num_leds
      @strip.set_pixel(lit_pixel,
                       color_wheel(((lit_pixel * interval) & 255) + offset),
                       [(31/(length - snake_pos)),1].max)
    end
    @strip.show!
    sleep sleep_time
  end
end

