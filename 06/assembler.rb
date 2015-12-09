
def args_valid?
	ARGV[0] && ARGV[0].end_with?(".asm") && ARGV.length == 1
end

def is_readable?(path)
	File.readable?(path)
end

unless args_valid?
	abort("Usage: ./assembler.rb Prog.asm")
end

asm_filename = ARGV[0]

unless is_readable?(asm_filename)
	abort("#{asm_filename} is not found or is unreadable.")
end

puts "The contents of #{asm_filename}"
asm_filename = FIle.open(asm_filename, 'r')

puts asm_filename.read

#puts asm_filename: just gives address in memory