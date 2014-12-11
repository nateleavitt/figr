require "figr"
require "figr/command"

class FIGR::CLI

  def self.run(*args)
    command = args.shift.strip rescue "help"
    FIGR::Command.load
    FIGR::Command.run(command, args)
    puts "Here is the command: #{command} and opts: #{args.inspect}"
  end

end
