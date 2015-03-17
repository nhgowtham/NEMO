function [mx,S,R,l,a,C,y,Y1_Y2,ellix,elliy] = pca(dataSet,probability)  %in dati e prob

x = dataSet(:,1:end-1);   %dati effettivi(dalla prima colonna alla penultima)
l = dataSet(:,end);   %classe di appatenenza dei soggetti.ultima colonna.
	
ds = [];     %inizializzazione a zero
numExamples = [];
numClasses = 0;

for cl=min(l):max(l)    %messa in ordine dei dati. prima riga:prima classe. seconda riga, seconda classe. cl=classi.
	rows = find(l==cl);    %l=vettore che mi dice la classe per ogni variabile
    if(length(rows) > 0)    %rows=righe del datamatrix originale, cn valore=cl
        numClasses = numClasses + 1;
    	ds = [ ds; x(rows,:) ];    %ds=righe corrispondenti alla prima classe
        numExamples = [ numExamples; length(rows)];   %num soggetti che app a una classe=lunghezza righe che hanno come classif rows
    end
end

numClasses   %num classi che ho nel datamatrix
numExamples    %numero soggetti

switch(numClasses)
    case 1
    [mx,S,R,l,a,C,y,Y1_Y2,ellix,elliy]=pca_ll(ds,probability,numClasses,0,0.05,numExamples(1));
    case 2
    [mx,S,R,l,a,C,y,Y1_Y2,ellix,elliy]=pca_ll(ds,probability,numClasses,1,0.05,numExamples(1),numExamples(2));
    case 3
    [mx,S,R,l,a,C,y,Y1_Y2,ellix,elliy]=pca_ll(ds,probability,numClasses,1,0.05,numExamples(1),numExamples(2),numExamples(3));    
    case 4
    [mx,S,R,l,a,C,y,Y1_Y2,ellix,elliy]=pca_ll(ds,probability,numClasses,1,0.05,numExamples(1),numExamples(2),numExamples(3),numExamples(4));
    case 5
    [mx,S,R,l,a,C,y,Y1_Y2,ellix,elliy]=pca_ll(ds,probability,numClasses,1,0.05,numExamples(1),numExamples(2),numExamples(3),numExamples(4),numExamples(5));
    case 6
    [mx,S,R,l,a,C,y,Y1_Y2,ellix,elliy]=pca_ll(ds,probability,numClasses,1,0.05,numExamples(1),numExamples(2),numExamples(3),numExamples(4),numExamples(5),numExamples(6));
    
    
end    %a seconda del numero di classi, eseguo la parte che voglio. 