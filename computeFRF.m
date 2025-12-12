function [f, H] = computeFRF(y, fs)

    y = y(:);                     % make column
    y = y - mean(y);              % remove DC / offset

    N = length(y);
    Y = fft(y);

    Y = Y(1:floor(N/2));          % one-sided spectrum
    H = abs(Y)/(N/2);             % normalize a bit

    f = (0:floor(N/2)-1)*(fs/N);  % frequency axis in Hz
end
