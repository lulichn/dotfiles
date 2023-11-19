define :defaults, domain: nil, value: nil, type: :int, action: :write do
  domain, name = params[:name]

  type = params[:type]
  value = params[:value]
  action = params[:action]

  case action
  when :write
    read_value = run_command("defaults read #{domain} #{name}", error: false)
    if read_value.success?
      current_value = read_value.stdout.chomp

      case type
      when :int
        next if value.to_i == current_value.to_i
      when :string
        next if value == current_value
      when :bool
        next if (current_value.to_i == 1) == value
      end
    end
    
    execute "defaults write #{domain} #{name} -#{type} #{value}" {}
  when :delete
    read_value = run_command("defaults read #{domain} #{name}", error: false)
    next if read_value.failure? && read_value.stderr.chomp.end_with?('does not exist')
    
    execute "defaults delete #{domain} #{name}" {}
  end
end
