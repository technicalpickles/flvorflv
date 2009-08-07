module Flvorflv
  extend self

  def version
    output = execute_binary("--help")
    if output =~ /FLVStreamer v(.*)\n/
      $1
    end
  end

  def execute_binary(args)
    `flvstreamer #{args} 2>&1`
  end

  def run(options)
    sorted_keys = options.keys.sort {|a, b| a.to_s <=> b.to_s }

    args = sorted_keys.collect do |key|
      value = options[key]
      "--#{key} #{value}"
    end.join(" ")

    execute_binary(args)
  end
end

