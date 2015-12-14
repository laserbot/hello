##
#Initial declaration of main variables
pl_options = {
  :status => 'Check your status.',
  :explore => 'Explore your environment.',
  :action => 'Do something!',
  :quit => 'Exit this game.'
}
pl_status = {
  :name => 'Default',
  :item => 'fishing rod',
  :storage => ''
}
pl_input = ''

#Method for status
def status(pl_status)
  puts
  pl_status.each do |st_key,st_val|
    puts "#{st_key}: #{st_val}"
  end
  puts
end

#Method for explore
def explore(pl_status)
  puts
  puts 'successfully explored'
  puts
end

#Method for action
def action(pl_status)
  puts
  puts 'successfully took action'
  puts
end

#Method for player option selection
def main_select(pl_options, pl_status)
  puts 'What would you like to do?'
  puts

  pl_options.each do |pl_opt,explanation|
    puts "  #{pl_opt.to_s.capitalize}: #{explanation}"
  end

  pl_input = gets.chomp

  if pl_options.has_key?(pl_input.downcase.to_sym)
    case
      when pl_input.downcase == 'status'
        status(pl_status)
      when pl_input.downcase == 'explore'
        explore(pl_status)
      when pl_input.downcase == 'action'
        action(pl_status)
    end
  else
    puts 'You must choose a valid option. Options are:'
    pl_options.each do |pl_opt,explanation|
      print "#{pl_opt.to_s.capitalize}" + ' '
    end
    puts
    puts
  end
  return pl_input
end

puts 'Welcome to an adventure.'

#Main game block, ends with 'quit'
while pl_input.downcase != 'quit' do
  pl_input = main_select(pl_options,pl_status)
end

#End game message
puts 'Thanks for playing!'