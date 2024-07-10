% reading audio file
[track1, fs] = audioread('Intro_sound.mp3');
[track2, fc] = audioread('tank firing.mp3');
[track3, fl] = audioread('Tank moving.mp3');
[track4, fg] = audioread('crash.mp3');
[track5, fh] = audioread('Win_sound.mp3');
[track6, fj] = audioread('Barrier explosion.mp3');

sound_intro = audioplayer(track1, fs);
sound_move = audioplayer(track3, fl);
sound_fire = audioplayer(track2, fc);
sound_crash = audioplayer(track4, fg);
sound_others = audioplayer(track6, fj);
sound_victory = audioplayer(track5, fh);

save('musicalldata','sound_intro','sound_move','sound_crash','sound_fire', 'sound_others', 'sound_victory')

% playing the sound for different game event.
play(sound_intro);
play(sound_move);
play(sound_crash);
play(sound_fire);
play(sound_victory);
play(sound_others);
