setbpm(120)

# Arrays that hold each verse - treble only
treble12 = [:g5, :f5, :e5, :d5, :c5, :d5, :e5, :c5, :d5, :e5, :f5, :d5, :e5, :d5, :c5, :b4, :c5]
durations12 = [0.5, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 0.5]

treble3 = [:d5, :e5, :f5, :d5, :e5, :f5, :g5, :d5, :e5, :f5, :g5, :a5, :b5, :c6, :b5, :a5, :g5]
durations3 = [0.5, 0.25, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5]

treble4 = [:g5, :f5, :e5, :d5, :c5, :d5, :e5, :c5, :a5, :a5, :a5, :a5, :g5, :f5, :e5, :d5, :c5]
durations4 = [0.5, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 1, 0.25, 0.5, 0.5, 1]

# Arrays that hold each verse - clef only 
clef = [:c4, :g4, :e4, :g4, :c4, :g4, :e4, :g4, :g3, :d4, :b3, :d4, :c4, :g4, :e4, :g4, :f3, :c4, :a3, :c4, :c4, :g4, :e4, :g4]
duration_clef = [0.25]*24

clef2 = [:g3, :d4, :b3, :d4, :g3, :d4, :b3, :c4, :g4, :e4, :g4, :c4, :g4, :e4, :g4, :c4, :g4, :e4, :a3, :e4, :c4, :e4, :d3, :a3, :gb4, :a3, :g3, :d4, :b3, :d4]
duration_clef2 = [0.25]*30

clef3 = [:c4, :g4, :e4, :g4, :c4, :g4, :e4, :g4, :c4, :g4, :e4, :g4, :c4, :g4, :e4, :g4, :f3, :c4, :a3, :c4, :c4, :g4, :e4, :g4]
durations_clef3 = [0.25]*24

ending = [:g3, :g3, :c4]
duration_ending = [0.5, 0.5, 1]

# Sonic Pi does not have trumpet - but this synth sounded the most Christmas
use_synth :sine

define :song do |notes, durations, vol = 0.8|
  """
  Song method takes two arrays that hold the duration of each 
  note and the note. Loops through them together and plays each note
  for the proper duration and volume. 
  """
  sleep 0.25
  notes.zip(durations).each do |note,dur|
    play note, sustain: 0.8 * dur, release: 0.1 * dur, amp: vol
    sleep dur
    
  end
end

# Verse 1 and 2, remove or add comments when you do not or want this verse played
##| in_thread do
##|   song(treble12, durations12, 0.8)
##| end
##| in_thread do
##|   song(clef, duration_clef, 0.8)
##| end

# Verse 3, remove or add comments when you do not or want this verse played
##| in_thread do
##|   song(treble3, durations3, 0.8)
##| end
##| in_thread do
##|   song(clef2, duration_clef2, 0.8)
##| end

# Verse 4, remove or add comments when you do not or want this verse played
sleep 0.25
in_thread do
  song(treble4, durations4, 0.8)
end
in_thread do
  song(clef3, durations_clef3, 0.8)
  song(ending, duration_ending, 0.8)
end



