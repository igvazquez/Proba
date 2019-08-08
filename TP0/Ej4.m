marca = [ 30 60 90 120 150 180 210 240 270 300 ];
frecuencia = [ 6 28 88 180 247 260 133 42 11 5 ];

intervalSize = 30;
minLim = 15;
maxLim = 315;
extendedMinLim = minLim - (intervalSize/2);
extendedMaxLim = maxLim + (intervalSize/2);

extendedFrencuencia = [0 frecuencia 0];
extendedMarca = [extendedMinLim marca extendedMaxLim];

subplot(2,1,1)
bar(marca, frecuencia, 'BarWidth', 1)
hold on
title('Frecuencia relativa')
plot(extendedMarca, extendedFrencuencia,extendedMarca, extendedFrencuencia,'o')
hold off

frecuenciaAcumulada = cumsum(frecuencia);
intervalo = minLim:intervalSize:maxLim;

extendedFrecuenciaACumulada = [ 0 frecuenciaAcumulada ];
extendedIntervaloAcumulado =  intervalo;


subplot(2,1,2)
bar(marca, frecuenciaAcumulada, 'BarWidth', 1)
title('Frecuencia acumulada')
hold on
plot(extendedIntervaloAcumulado, extendedFrecuenciaACumulada,extendedIntervaloAcumulado, extendedFrecuenciaACumulada,'o')
hold off

media = sum(marca.*frecuencia./sum(frecuencia))