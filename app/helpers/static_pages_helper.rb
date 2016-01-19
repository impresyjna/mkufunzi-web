module StaticPagesHelper

	#Return value of user body mass index.
	def bmi(height,weight)
		return height / (weight*weight)
	end

end
