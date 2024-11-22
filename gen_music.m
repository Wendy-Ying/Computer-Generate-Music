function waves = gen_music(tones, scale, noctaves, risings, rhythms, fs)
    % tones: 1-7, list
    % scale: 'A', 'B', 'C', 'D', 'E', 'F', 'G'
    % noctaves: octave offset, +-8, list
    % risings: pitch adjustment, +-1, list
    % rhythms: time, 1 for normal, list
    % fs: sample rate

    waves = [];
    for i = 1:length(tones)
        new_wave = gen_wave(tones(i), scale, noctaves(i), risings(i), rhythms(i), fs);
        waves = [waves, new_wave];
    end
end