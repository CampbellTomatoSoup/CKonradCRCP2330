class Code

	DEST = {
		nil => '',
		'M' => '001',
		'D' => '010',
		'MD' => '011',
		'A' => '100',
		'AM' => '101',
		'AD' => '110',
		'AMD' => '111',
	}

	def dest(mneuomic)
		DEST (mneuomic)
	end

	def comp(mneuomic)
		"CCCCCCC"
	end

	def jump (mneuomic)
		"JJJ"
	end
end  