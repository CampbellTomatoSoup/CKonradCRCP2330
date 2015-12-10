class Assembler
	def initialize(asm_file, hack_file)
		@asm_file = asm_file
		@hack_file = hack_file

		@asm_instructions = instructions_from_file
		p @asm_instructions
		#@parser = Parser.new(@asm_instructions)
	end

	def assemble!
		# hack_instructions = Parser.parse_asm
		# @hack_file << hack_instructions
		
	end	

	def instructions_from_file
		lines = @asm_file.readlines
		lines.each do| line |
			line.gsub! /\/\/.*/,''
			line.strip!
		end
		lines.delete("")
		return lines
	end
end

def args_valid?
	ARGV[0] && ARGV[0].end_with?(".asm") && ARGV.length == 1
end

#defining what arguments are. / what valid arguments are

def is_readable?(path)
	File.readable?(path)
end

#defining if the file is readable. Reading from the file

def hack_filename(asm_filename)
	asm_basename = File.basename(asm_filename, '.asm')
	path = File.split(asm_filename)[0]
	"#{path}/{asm_basename}.hack"
end

unless args_valid?
	abort("Usage: ./assembler.rb Prog.asm")
end

#if the arguments aren't valid, then abort

asm_filename = ARGV[0]

unless is_readable?(asm_filename)
	abort("#{asm_filename} is not found or is unreadable.")
end

# is the file isn't readable: abort and output the string

#"best to keep it tight"

File.open(asm_filename) do |asm_file|
	File.open(hack_filename(asm_filename), 'w') do |hack_file|
		assembler = Assembler.new(asm_file, hack_file)
		assembler.assemble!
	end
end
# initial nest = opens the file and then it is automatically closed
# sub nest = open up the .hack file and pass it to the assembler to translate 
# reason for error: Assembler doesn't exist yet! This is our main. 
# now we focus on Assembler object. 

#overall, you check for the incoming arguments, see if they're readable, and then if they are
#give them to the assembler.


