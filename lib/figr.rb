require "figr/version"

module Figr

  class APIChatter
    def initialize

    end

    def login
      puts "We need your GitHub login to identify you. \n
            This information will not be sent to Figr, only to GitHub. \n
            The password will not be displayed."
    end

    def say_hello
      puts "This is figr. Coming in lour and clear. Over."
    end

    def test(opts)
      opts.each do |o|
        puts o
      end
    end

    def set_val(val)
      puts "Your value of #{val} has been set"
    end

    def get_val(val)
      puts "Here is your value: #{val}"
    end

  end

end
