function M=lfsr(init, feedback, duration)
	n = length(init);
	M = zeros(duration, n); 
	M(1,:) = init;
	for i=2:duration
		M(i,:) = [mod(M(i-1,:)*feedback', 2), M(i-1,1:n-1)];
	end
end
% 
% 
% tap=[
% 
% 2 6;     % PRN 01
% 3 7;     % PRN 02 
% 4 8;     % PRN 03
% 5 9;     % PRN 04
% 1 9;     % PRN 05
% 2 10;    % PRN 06
% 1 8;     % PRN 07
% 2 9;     % PRN 08
% 3 10;    % PRN 09
% 2 3;     % PRN 10
% 3 4;     % PRN 11
% 5 6;     % PRN 12
% 6 7;     % PRN 13
% 7 8;     % PRN 14
% 8 9;     % PRN 15
% 9 10;    % PRN 16
% 1 4;     % PRN 17
% 2 5;     % PRN 18
% 3 6;     % PRN 19
% 4 7;     % PRN 20
% 5 8;     % PRN 21
% 6 9;     % PRN 22
% 1 3;     % PRN 23
% 4 6;     % PRN 24
% 5 7;     % PRN 25
% 6 8;     % PRN 26
% 7 9;     % PRN 27
% 8 10;    % PRN 28
% 1 6;     % PRN 29
% 2 7;     % PRN 30
% 3 8;     % PRN 31
% 4 9;     % PRN 32
% 5 10;    % PRN 33
% 4 10;    % PRN 34
% 1 7;     % PRN 35
% 2 8;     % PRN 36
% 4 10];   % PRN 37	