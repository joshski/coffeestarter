def cake_build
  system("clear")
  puts "> [cake watch] @ #{Time.now.strftime('%H:%M:%S')}"
  
  system("cake watch")
end

cake_build
watch("(.*\.(coffee|rb|feature|jison)|Cakefile)") do |m|
  cake_build
end

@interrupted = false

# Ctrl-C
Signal.trap "INT" do
  if @interrupted
    abort("\n")
  else
    puts "Interrupt a second time to quit"
    @interrupted = true
    Kernel.sleep 1.5
    cake_build
    @interrupted = false
  end
end