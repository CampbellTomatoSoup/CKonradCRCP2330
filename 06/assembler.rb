
def args_valid?
	ARGV[0] && ARGV[0].end_with?(".asm") && ARGV.length == 1
end

#defining what arguments are. / what valid arguments are

def is_readable?(path)
	File.readable?(path)
end

#defining if the file is readable. Reading from the file

unless args_valid?
	abort("Usage: ./assembler.rb Prog.asm")
end

#if the arguments aren't valid, then abort

asm_filename = ARGV[0]

unless is_readable?(asm_filename)
	abort("#{asm_filename} is not found or is unreadable.")
end

# is the file isn't readable: abort and output the string

File.open(asm_filename) do |asm_file|
	asm_basename = File.basename(asm_filename, '.asm')
	path = File.split(asm_filename)
	hack_filename = "#{path}/#{asm_basename}.hack"
	File.open(hack_filename, 'w') do |hack_file|
		assmebler = Assember.new(asm_file, hack_file)
		assembler.assemble!
	end
end
# initial nest = opens the file and then it is automatically closed
# sub nest = open up the .hack file and pass it to the assembler to translate 
# reason for error: Assembler doesn't exist yet! This is our main. 
# now we focus on Assembler object. 
