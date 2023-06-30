if IsWriting() then
	Redirect(nil)
else
	Redirect(Paths.Resources .. "Save")
end