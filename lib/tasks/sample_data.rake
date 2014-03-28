namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_sermons
  end
end


def make_sermons
  150.times do
    book = ["Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy", 
            "Joshua", "Judges", "Ruth", "Samuel1", "Samuel2"].sample

    case book
      when "Genesis"
        color = "#59BA53"
      when "Exodus"
        color = "#9FE1E7"
      when "Leviticus"
        color = "#F8B0C8"
      when "Numbers"
        color = "#FCF0AD"
      when "Deuteronomy"
        color = "#9FC6E7"
      when "Joshua"
        color = "#4986E7"
      when "Judges"
        color = "#9A9CFF"
      when "Ruth"
        color = "#FFAD46"
      when "Samuel1"
        color = "#D06B64"
      else
        color = "#CABDBF"
    end

    sermon_date = rand(Date.new(2014, 1, 1)..Date.new(2014,12,31))
    first_chapter = rand(1..50)
    first_verse = rand(1..10)
    last_verse = rand(11..40)
    Sermon.create!(
      book: book,
      sermon_date: sermon_date,
      first_chapter: first_chapter,
      first_verse: first_verse,
      last_verse: last_verse,
      color: color
      )

  end
end
