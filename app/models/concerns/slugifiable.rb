module Slug
	module InstanceMethods
		def slug
			self.name.downcase.gsub(" ", "-")
		end
	end

	module ClassMethods
		def find_by_slug(slug_phrase)
			new_name = slug_phrase.gsub("-", " ")
			self.all.find{|object| object.name.downcase == new_name}
		end
	end
end
