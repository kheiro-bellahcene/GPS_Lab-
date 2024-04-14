function PRN = cacode(tap, satellite_number)
    init= [1 1 1 1 1 1 1 1 1 1];
    % Get the tap for the specified satellite

    P1= [0 0 1 0 0 0 0 0 0 1]; 
    P2= [0 1 1 0 0 1 0 1 1 1];
%
    G1 = lfsr(init, P1, 1023); 
    G2 = lfsr(init, P2, 1023);
    selector=tap(satellite_number, :);
    PRN=mod (G1 (:,10)+G2(:,selector (1))+G2(:, selector (2)), 2);

    %Selector= [00000000 0.0];
    %Selector (selected_tap)=1;
    %S2 = 1fsr (G2, Selector, 1023);
    %Calculate the PRN code using the lfsr function PRN = 1fsr (G1, 52, 1023);
end