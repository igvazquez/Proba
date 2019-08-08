

x = [ 32.5 15.2 35.4 21.3 28.4 26.9 34.6 29.3 24.5 31.0 21.2 28.3 27.1 25.0 32.7 29.5 30.2 23.9 23.0 26.4 27.3 33.7 29.4 21.9 29.3 17.3 29.0 36.8 29.2 23.5 20.6 29.5 21.8 37.5 33.5 29.6 26.8 28.7 34.8 18.6 25.4 34.1 27.5 29.6 22.2 22.7 31.3 33.2 37.0 28.3 36.9 24.6 28.9 24.8 28.1 25.4 34.5 23.6 38.4 24.0 ];

intervalSize = 5;
minLim = 15;
maxLim = 40;
extendedMinLim = minLim - (intervalSize/2);
extendedMaxLim = maxLim + (intervalSize/2);
intervalo = minLim:intervalSize:maxLim;

frecuencia = histc(x, intervalo);
frecuencia(end) = [];
marca = 17.5:5:38.5;

extendedFrencuencia = [0 frecuencia 0];
extendedMarca = [extendedMinLim marca extendedMaxLim];

frecuenciaAcumulada = cumsum(frecuencia);

extendedFrecuenciaACumulada = [ 0 frecuenciaAcumulada ];
extendedIntervaloAcumulado =  intervalo;

subplot(3,1,1)
bar(marca, frecuencia, 'BarWidth', 1)
hold on
title('Frecuencia relativa')
plot(extendedMarca, extendedFrencuencia,extendedMarca, extendedFrencuencia,'o')
hold off

subplot(3,1,2)
bar(marca, frecuenciaAcumulada, 'BarWidth', 1)
title('Frecuencia acumulada')
hold on
plot(extendedIntervaloAcumulado, extendedFrecuenciaACumulada,extendedIntervaloAcumulado, extendedFrecuenciaACumulada,'o')
hold off

subplot(3,1,3)
boxplot(x)

media = mean(x)
mediana = median(x)
q1 = quantile(x,0.25)
q3 = quantile(x,0.75)
intercuantil = iqr(x)