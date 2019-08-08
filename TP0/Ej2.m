x = [ 9 8 3 18 4 5 6 7 7 6 7 5 4 3 15 3 8 6 11 10 9 8 7 13 3 4 5 5 6 4 3 6 7 9 8 7 4 5 6 7 8 10 11 3 2 1 7 6 17 7 9 8 6 11 0 20 1 4 5 12 2 2 1 4 5 6 7 8 10 9 8 7 7 6 5 2 7 7 10 6 6 14 2 4 5 12 10 9 8 7 ];

cantidad = size(x)(2);

intervalSize = 1;
minLim = min(x);
maxLim = max(x);
extendedMinLim = minLim - (intervalSize/2);
extendedMaxLim = maxLim + (intervalSize/2);
intervalo = minLim:intervalSize:maxLim;

[frecuencia, marca] = hist( x, intervalo); #frecuencia centrada en los intervalos

frequency = histc( x, intervalo); #frecuencia entre los intervalos

extendedFrencuencia = [0 frecuencia 0];
extendedMarca = [extendedMinLim marca extendedMaxLim];

subplot(2,1,1)
bar(intervalo, frecuencia)
hold on
title('Frecuencia relativa')
plot(extendedMarca, extendedFrencuencia,extendedMarca, extendedFrencuencia,'o')
hold off
