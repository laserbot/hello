##
#Initial declaration of main variables
pl_options = {
    :status => 'Check your status.',
    :fish => 'Fish at your location.',
    :action => 'Do something!',
    :quit => 'Exit this game.'
}
pl_status = {
    :name => 'Default',
    :item => 'fishing rod',
    :storage => '',
    :location => 'fishing hole'
}
fishing_hole = {
    1 => "shoe",
    2 => "mackerel",
    3 => "bass",
    4 => "salmon",
    5 => "albacore"
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

#Method for fish
def fish(pl_status,fishing_hole)
  puts
  puts 'You fish at the ' + pl_status[:location] + '.'
  i=1
  fish_load = '-'
  while i<7 do
    print fish_load
    sleep(0.33)
    i+=1
    fish_load.concat('-')
  end
  puts
  sleep(1)
  print 'You\'ve caught '
  sleep(1)
  print 'a '
  sleep(1)
  print '... '
  sleep(1)
  print fishing_hole[rand(5)]
  print '!!'
  sleep(1.5)
  #fishing_hole.each do |item,val|
  #  puts "#{item}: #{val}"
  #end
  puts
  puts
end

#Method for action
def action(pl_status)
  puts
  puts 'successfully took action'
  puts
end

#Method for player option selection
def main_select(pl_options, pl_status, fishing_hole)
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
      when pl_input.downcase == 'fish'

        fish(pl_status, fishing_hole)
      when pl_input.downcase == 'action'
        action(pl_status)
    end
  else
    puts 'You must choose a valid option. Options are:'
    pl_options.each do |pl_opt|
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
  pl_input = main_select(pl_options,pl_status,fishing_hole)
end

#End game message
puts 'Thanks for playing!'