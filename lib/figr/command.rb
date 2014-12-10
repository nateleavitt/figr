module Figr
  module Command

    def self.load
      Dir[File.join(File.dirname(__FILE__), "command", "*.rb")].each do |file|
        require file
      end
    end

    def self.run(cmd, arguments=[])
      object, method = prepare_run(cmd, arguments.dup)
      puts "Here is the object: #{object} and method: #{method}"
      # object.send(method)
    end

    def prepare_run(cmd, args=[])
      if command
        command_instance = command[:klass].new(args.dup, opts.dup)
        @normalized_command = [ARGV.first, @normalized_args.sort_by {|arg| arg.gsub('-', '')}].join(' ')
        [command_instance, command[:method]]
      end
  end

end
