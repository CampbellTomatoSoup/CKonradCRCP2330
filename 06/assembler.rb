

if (ARGV[0] && ARGV[0].end_with?(".asm") && ARGV.length == 1)
	asm_filename = ARGV[0]
	puts asm_filename
else
	abort("Usage: ./assembler.rb Prog.asm")
end

if (&& File.exist?(ARGV[0]) && File.readable?(ARGV[0]))
	puts "The contents of #{asm_filename}"
else
	abort("#{asm_filename} is not found or is unreadable.")
end

