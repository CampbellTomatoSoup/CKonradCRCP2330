require_relative 'code'

class Parser 

	def initialize (assembly_instructions)
		@assembly_instructions = assembly_instructions
		@machine_instructions = []
		@mneumonics = Code.new();
	end
	
	def parse
		@assembly_instructions.each do |instruction|
			if command_type(instruction) == :a_command
				@machine_instructions << assemble_a_command(instruction)
			elsif command_type(instruction) == :c_command
			 	@machine_instructions << assemble_c_command(instruction)
			end
		end
		@machine_instructions
	end

	#need to look at specifics in comp bit
	def splitting_up_the_comp (instruction)
		if instruction.include?("=")
			instruction.split("=")[1]
		elsif instruction.include?(";")
			instruction.split(";")[0]
		end
	end

	#need to look at specifics for the jump
	def splitting_up_the_jump (instruction)
		instruction.split(";")[1]
	end

	#need to look at specifics for dest
	def splitting_up_the_dest (instruction)
		if instruction.include?("=")
			instruction.split("=")[0]
		end
	end

	def assemble_a_command(instruction)
		command ="0"
		command << constant(instruction[1..-1])
	end	

	def constant(value)
		"%015b" % value
	end

	def assemble_c_command(instruction)
	#commands start with 111 in order to be C instructions
		command = "111"

	#sendinh the value from splitting up the comp bit to the comp method in code.rb
		command << @mneumonics.comp(splitting_up_the_comp(instruction))

	#sending the value from splitting up the dest bit to the dest method in code.rb
		command << @mneumonics.dest(splitting_up_the_dest(instruction))

	#sending the value from splitting the jump bit up to the jump method in code.rb
		command << @mneumonics.jump(splitting_up_the_jump(instruction))
   	end	

	def command_type(instruction)
		if instruction.start_with?("@")
			:a_command
		else
			:c_command
		end
	end
end

