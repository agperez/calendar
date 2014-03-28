module SermonsHelper
	def sermon_title(sermon)
		book = sermon.book
		first_chapter = sermon.first_chapter.to_s
		first_verse = sermon.first_verse.to_s
		last_chapter = sermon.last_chapter
		last_verse = sermon.last_verse.to_s
		if last_chapter.nil?
			book + " " + first_chapter + ":" + first_verse + "-" + last_verse
		else
			book + " " + first_chapter + ":" + first_verse + "-" + last_chapter.to_s + ":" + last_verse
		end
	end

	def sermon_title?
		!@sermon.nil?
	end
end
