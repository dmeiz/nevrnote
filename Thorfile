require 'fileutils'

class Nevrnote < Thor
  include FileUtils

  desc 'vim', 'Start vim with nevrnote initialized for developement'
  def vim
    system %q(vim -c 'let g:nevrnote_home_path = "/Users/dan/src/nevrnote/nevrnote_dev"' -S nevrnote.vim)
  end

  desc 'populate', 'Create and populate a nevrnote installation for development'
  def populate
    `rm -rf nevrnote_dev`
    `mkdir nevrnote_dev`
    `cd nevrnote_dev && git init`

    time = Time.local(2012, 4, 1, 0, 0, 0)

    3.times do
      time = time + ONE_DAY
      puts "Generating files for #{time.strftime("%Y/%m/%d")}"
      3.times do |i|
        dir = "nevrnote_dev/#{time.strftime("%Y/%m/%d")}"
        mkdir_p(dir)
        path = "#{dir}/#{i + 1}"
        File.open(path, 'w') do |f|
          f.write(TEXTS[i + 1])
          `cd nevrnote_dev && git add .`
          `cd nevrnote_dev && git commit -m 'Add note'`
        end
      end
    end
  end
end

ONE_DAY = 24 * 60 * 60
TEXTS = {
  1 => "You think water moves fast? You should see ice. It moves like it has a mind.
Like it knows it killed the world once and got a taste for murder. After the
avalanche, it took us a week to climb out. Now, I don't know exactly when we
turned on each other, but I know that seven of us survived the slide... and
only five made it out. Now we took an oath, that I'm breaking now. We said
we'd say it was the snow that killed the other two, but it wasn't. Nature is
lethal but it doesn't hold a candle to man.",
  2 => "Look, just because I don't be givin' no man a foot massage don't make it right
for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the
way the nigger talks. Motherfucker do that shit to me, he better paralyze my
ass, 'cause I'll kill the motherfucker, know what I'm sayin'?",
  3 => "Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to
my shirt with my name printed on it? Do you see a little Asian child with a
blank expression on his face sitting outside on a mechanical helicopter that
shakes when you put quarters in it? No? Well, that's what you see at a toy
store. And you must think you're in a toy store, because you're here shopping
for an infant named Jeb."
}
