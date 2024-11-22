function freq = tone2freq(tone, scale, noctave, rising)
    % tone: 1-7
    % scale: 'A', 'B', 'C', 'D', 'E', 'F', 'G'
    % noctave: octave offset, +-8
    % rising: pitch adjustment, +-1
    % freq: output frequency
    
    scale_offsets = containers.Map({'A', 'B', 'C', 'D', 'E', 'F', 'G'}, [0, 1, -5, -4, -3, -2, -1]);
    offset = scale_offsets(scale);
    new_tone = mod(tone + offset - 1, 7) + 1; % 1-7
    octave_adjust = floor((tone + offset - 1) / 7);
    dic = [0, 2, 3, 5, 7, 8, 10];
    factor = (dic(new_tone) + (noctave + octave_adjust) * 12 + rising) / 12;
    freq = 440 * 2^factor;
end