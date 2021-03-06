% Costruzione del DataMatrix per la 3-way PCA


dc = questdlg ('You must create the datamatrix to do the 3-way PCA. Did you create it?');

if dc(1:2) == 'No'

    creation;
    
end;


olddir = pwd;  %cos� sto in NE.MO.
mkdir(sprintf('%s\\PLOT', olddir'));
pathname1 = sprintf('%s\\PLOT', olddir');
mkdir(sprintf('%s\\P_PCA', pathname1));
pathname2 = sprintf('%s\\P_PCA', pathname1);


load datamatrix.mat

for i = 1:size(DMg, 1)
    
    for j = 1:size(DMg, 2)
        
        for k = 1:size(DMg, 3)
            
            if DMg (i, j,  k) == 0
                
                DMg(i, j, k) = NaN;
                
            end;
            
        end;
        
    end;
    
end;    %dove avevo zero, ho messo NaN


% cellule = [3 4 5 6 7 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25]; %righe di DMg corrispondenti alle cellule
cellule = zeros(1, size(DMg, 1));

variabili = [80 81 83 129 170 171 172 173]; %colonne di DMg corrispondenti alle variabili. Sono sempre quelle!!
a = length(variabili);

DMprovv1 = DMg (:, 80, :);
DMprovv2 = DMg (:, 81, :);
DMprovv3 = DMg (:, 83, :);
DMprovv4 = DMg (:, 129, :);
DMprovv5 = DMg (:, 170, :);
DMprovv6 = DMg (:, 171, :);
DMprovv7 = DMg (:, 172, :);
DMprovv8 = DMg (:, 173, :);
DMprovv = cat(2, DMprovv1, DMprovv2, DMprovv3, DMprovv4, DMprovv5, DMprovv6, DMprovv7, DMprovv8);

        
for i = 1:size(DMprovv, 3)
    
    if DMprovv(:, :, i ) == NaN(size(DMprovv, 1), size(DMprovv, 2), 1)
        break;
    end;
    
    varcom1 = i;
    
end;

for i = size(DMprovv, 3): -1: 1
    
    if DMprovv(:, :, i ) == NaN(size(DMprovv, 1), size(DMprovv, 2), 1)
        break;
    end;
    
    varcom2 = i;
    
end;

DMprovv = DMprovv(:, :, varcom2 : varcom1);
varcom = varcom1-varcom2+1;
DMp = zeros(length(cellule)*varcom, length(variabili));


for j = 1:length(cellule)
    
        for i = 1:varcom 
            
           for k = 1:a
               
                   DMp((length(cellule))*i-(length(cellule))+j, k) = DMprovv(j, k, i);
                   
           end;
           
        end;
        
end;

DMp(:, 7, :) = 360 - DMp(:, 7, :);

for i = 1:size(DMp, 1)
    
    for j = 1:size(DMp, 2)
         
            if isnan (DMp (i, j)) == 1
                
                DMp(i, j) = 0;
                
            end;
            
    end;
        
end;
    

save('datamatrixPCA.mat', 'DMp', '-mat')    

h = helpdlg('3-way PCA datamatrix is built and saved');
uiwait(h)

