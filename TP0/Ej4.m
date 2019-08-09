

marca = [ 30 60 90 120 150 180 210 240 270 300 ];
frecuencia = [ 6 28 88 180 247 260 133 42 11 5 ];

function percentileDatosAcumulado = pda(intervalo, fq, p)
    li = 0;
    n = sum(fq);
    value = p / 100 * n;
    fqa = cumsum(fq);
    for i = 1:(size(intervalo)(2) - 1)
        if( value > fqa(i))
            li = fqa(i);
        endif
    endfor



    percentileDatosAcumulado = li;
endfunction

intervalSize = 30;
minLim = 15;
maxLim = 315;
extendedMinLim = minLim - (intervalSize/2);
extendedMaxLim = maxLim + (intervalSize/2);

extendedFrencuencia = [0 frecuencia 0];
extendedMarca = [extendedMinLim marca extendedMaxLim];

subplot(3,1,1)
bar(marca, frecuencia, 'BarWidth', 1)
hold on
title('Frecuencia relativa')
plot(extendedMarca, extendedFrencuencia,extendedMarca, extendedFrencuencia,'o')
hold off

frecuenciaAcumulada = cumsum(frecuencia);
intervalo = minLim:intervalSize:maxLim;

extendedFrecuenciaACumulada = [ 0 frecuenciaAcumulada ];
extendedIntervaloAcumulado =  intervalo;


subplot(3,1,2)
bar(marca, frecuenciaAcumulada, 'BarWidth', 1)
title('Frecuencia acumulada')
hold on
plot(extendedIntervaloAcumulado, extendedFrecuenciaACumulada,extendedIntervaloAcumulado, extendedFrecuenciaACumulada,'o')
hold off

subplot(3,1,3)
boxplot(frecuencia)


media = sum(marca.*frecuencia./sum(frecuencia))
mediana = 135 + [500 - 302]*intervalSize/247

cantidad = sum(frecuencia);
y = (marca.-media).**2.*frecuencia;
varianza =  ( sum(y) / ( cantidad - 1)  );

desviacion = sqrt(varianza)
totalValues = intervalo(1);
for i = 1:(size(marca)(2))
    aux = intervalo(i):(intervalSize/frecuencia(i)):intervalo(i+1);
    aux(1) = [];
    totalValues = [ totalValues  aux ];
endfor

aux = 0;
s = desviacion;
for i = 1:size(totalValues)(2)
    if((media - s) < totalValues(i) && totalValues(i) < (media + s))
        aux++;
    endif
endfor

ps1 = aux/10

aux = 0;
s = 2*desviacion;
for i = 1:size(totalValues)(2)
    if((media - s) < totalValues(i) && totalValues(i) < (media + s))
        aux++;
    endif
endfor

ps2 = aux/10

aux = 0;
s = 3*desviacion;
for i = 1:size(totalValues)(2)
    if((media - s) < totalValues(i) && totalValues(i) < (media + s))
        aux++;
    endif
endfor

ps3 = aux/10

aux = 0;
for i = 1:size(totalValues)(2)
    if(180 < totalValues(i))
        aux++;
    endif
endfor

moreThan3 = aux/10





