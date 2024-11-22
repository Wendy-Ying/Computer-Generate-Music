function waves = gen_wave(tone, scale, noctave, rising, rhythm, fs)
    % tone: 1-7
    % scale: 'A', 'B', 'C', 'D', 'E', 'F', 'G'
    % noctave: octave offset, +-8
    % rising: pitch adjustment, +-1
    % rhythm: time, 1 for normal
    % fs: sample rate

    if tone == 0
        t = linspace(0, rhythm, fs*rhythm);
        waves = zeros(size(t));
    elseif (1 <= tone) && (tone <= 7)
        f = tone2freq(tone, scale, noctave, rising);
        t = linspace(0, rhythm, fs*rhythm);
        waves = 0.7*sin(2*pi*f*t)+0.2*sin(2*pi*2*f*t)+0.05*sin(2*pi*3*f*t)+0.05*sin(2*pi*4*f*t);
        waves = waves .* max(0, (1-0.25*t/rhythm).^2);
    end
end