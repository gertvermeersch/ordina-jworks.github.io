require 'blur_image'


Jekyll::Hooks.register :site, :post_write do |site|
    puts 'Blur posts background images'

    @base = site.config['destination']

    site.posts.docs.each { |post|
        @image = post.data['image']
        original_image = File.read(File.join(@base, @image))
        blurred_image = BlurImage.blur(original_image, 5)

        @image.insert(@image.rindex('.'), '_blur')
        blurred_image.write(@image)
    }
end