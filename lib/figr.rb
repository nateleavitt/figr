require "figr/version"

module Figr

  module CLI


    extend self

    def run(*args)
      command = args.shift.strip rescue "help"
      FIGR::Command.load
      FIGR::Command.run(command, args)
      puts "Here is the command: #{command} and opts: #{args.inspect}"
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

    private
    # can't use flatten as it will flatten hashes
      def preparse(unparsed, args = [], opts = {})
        case unparsed
        when Hash  then opts.merge! unparsed
        when Array then unparsed.each { |e| preparse(e, args, opts) }
        else args << unparsed.to_s
        end
        [args, opts]
      end

  end

end
