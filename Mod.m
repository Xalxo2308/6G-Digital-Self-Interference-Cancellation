function symbols = Mod(bits,k) %This is a function that accepts two parameters. 
% bits is the input binary bit stream, and k represents the number of binary bits carried by each symbol. 
% According to the difference of k, select the corresponding modulation mode for symbol generation.

BPSK = [ -1;    % 0
          1];   % 1

QPSK = [ -1;    % 0
          1;    % 1
       ]/sqrt(2);
     
QAM16 =[ -3;    % 00
         -1;    % 01
          3;    % 10
          1;    % 11
        ]/sqrt(10);

QAM64 =[ -7;    % 000
         -5;    % 001
         -1;    % 010
         -3;    % 011
          7;    % 100
          5;    % 101
          1;    % 110
          3;    % 111
        ]/sqrt(42);
    
QAM256 =[-15;   % 0000
         -13;   % 0001
          -9;   % 0010
         -11;   % 0011
          -1;   % 0100
          -3;   % 0101
          -7;   % 0110
          -5;   % 0111
          15;   % 1000
          13;   % 1001
           9;   % 1010
          11;   % 1011
           1;   % 1100
           3;   % 1101
           7;   % 1110
           5;   % 1111
         ]/sqrt(170);  

if k == 0.5
    symbolsLen = length(bits);
    bitsMatrix = bits;
else
    bitsLeft = mod(length(bits),2*k);

    if bitsLeft ~= 0
        bits = [bits,zeros(1,2*k-bitsLeft)];
    end

    symbolsLen = length(bits)/2/k;
    bitsMatrix = reshape(bits,2*k,symbolsLen);
end

symbols = zeros(1,symbolsLen);
for i = 1:symbolsLen
    index_I = bin2dec(num2str(bitsMatrix(1:floor(k+0.5),i)')) + 1;
    index_Q = bin2dec(num2str(bitsMatrix(floor(k)+1:2*k,i)')) + 1;
    
    if k == 0.5
        symbols(i) = BPSK(index_I);
    elseif k == 1
        symbols(i) = complex(QPSK(index_I),QPSK(index_Q));
    elseif k == 2
        symbols(i) = complex(QAM16(index_I),QAM16(index_Q));
    elseif k == 3
        symbols(i) = complex(QAM64(index_I),QAM64(index_Q));
    else
        symbols(i) = complex(QAM256(index_I),QAM256(index_Q));
    end
end
