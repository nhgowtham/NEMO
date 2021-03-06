function varargout = Image_processing(varargin)
% IMAGE_PROCESSING M-file for Image_processing.fig
%      IMAGE_PROCESSING, by itself, creates a new IMAGE_PROCESSING or raises the existing
%      singleton*.
%
%      H = IMAGE_PROCESSING returns the handle to a new IMAGE_PROCESSING or the handle to
%      the existing singleton*.
%
%      IMAGE_PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_PROCESSING.M with the given input arguments.
%
%      IMAGE_PROCESSING('Property','Value',...) creates a new IMAGE_PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Image_processing_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Image_processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Image_processing

% Last Modified by GUIDE v2.5 06-Oct-2009 18:04:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Image_processing_OpeningFcn, ...
                   'gui_OutputFcn',  @Image_processing_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Image_processing is made visible.
function Image_processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Image_processing (see VARARGIN)

global intermedio;
global mInputArgs;
global int;

% Choose default command line output for Image_processing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Image_processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);

mInputArgs = varargin;

%cd(mInputArgs{2})
intermedio = mInputArgs{1};

if isempty(lasterror) == 0   %c'� errore
    
    [mInputArgs{3}, mInputArgs{2}] = uigetfile({'*.jpg;*.tif;*.bmp;*.png;*.gif','All Image Files'}, 'Pick an image');
           
    str = strcat(mInputArgs{2}, mInputArgs{3});    %complete directory
    
    intermedio = imread(str);

    
end;

axes(handles.a_immagine)
imshow(intermedio)
axis image
axis off;  


cd(mInputArgs{2})

%a = mInputArgs{3};
int1 = strrep (mInputArgs{3}(1:13), 'p', 'i');   %cambiato 2010
int = strcat (int1, mInputArgs{3}(14:17));

imwrite(intermedio, int);

cd ..
cd ..
cd ..
cd ..




% --- Outputs from this function are returned to the command line.
function varargout = Image_processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global skel;
global im_binary;


%mOutputArgs = {};

varargout{1} = im_binary;
varargout{2} = skel;





% --- Executes on button press in b_grigio.
function b_grigio_Callback(hObject, eventdata, handles)
% hObject    handle to b_grigio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;

intermedio = rgb2gray (intermedio);

cd (mInputArgs{2});

imwrite (intermedio, int);

% cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');
cd ..
cd ..
cd ..
cd ..

axes (handles.a_immagine1);
imshow (intermedio);
axis image
axis off;

axes (handles.a_immagine);
imshow (intermedio);
impixelinfo (handles.a_immagine);
axis image
axis off;




function e_hsize_r_Callback(hObject, eventdata, handles)
% hObject    handle to e_hsize_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_hsize_r as text
%        str2double(get(hObject,'String')) returns contents of e_hsize_r as a double




% --- Executes during object creation, after setting all properties.
function e_hsize_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_hsize_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function e_sigma_Callback(hObject, eventdata, handles)
% hObject    handle to e_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_sigma as text
%        str2double(get(hObject,'String')) returns contents of e_sigma as a double




% --- Executes during object creation, after setting all properties.
function e_sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in b_gaussian.
function b_gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to b_gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;


I = im2double (intermedio);                 %for gamma-corrected file

sigma = str2num(get (handles.e_sigma, 'String'));

a = isempty(sigma);
if a == 1
    sigma = 0.5;
end;
    
hsize_r = str2num(get (handles.e_hsize_r, 'String') );

a = isempty(hsize_r);
if a == 1
    hsize_r = 3;
end;

hsize_c = str2num(get (handles.e_hsize_c, 'String') );

a = isempty(hsize_c);
if a == 1
    hsize_c = 3;
end;

imageycbcr = rgb2ycbcr (I);
lum = imageycbcr (:, :, 1); 

im_gaus = filter2 (fspecial ('gaussian', [hsize_r  hsize_c] , sigma), lum);

imageycbcr (:, :, 1) = im_gaus;
image_rgb = ycbcr2rgb (imageycbcr);

axes (handles.a_immagine1);
imshow (image_rgb);
impixelinfo(handles.a_immagine1);
axis image
axis off;

set (handles.e_hsize_r, 'String', ' ');
set (handles.e_hsize_c, 'String', ' ');
set (handles.e_sigma, 'String', ' ');


[x, y, but] = ginput(1);

if but == 3              %with right click, you can save
    
    intermedio = image_rgb;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio ) ) );

end;
    





function e_lin_Callback(hObject, eventdata, handles)
% hObject    handle to e_lin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_lin as text
%        str2double(get(hObject,'String')) returns contents of e_lin as a double




% --- Executes during object creation, after setting all properties.
function e_lin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_lin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function e_lout_Callback(hObject, eventdata, handles)
% hObject    handle to e_lout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_lout as text
%        str2double(get(hObject,'String')) returns contents of e_lout as a double




% --- Executes during object creation, after setting all properties.
function e_lout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_lout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function e_hin_Callback(hObject, eventdata, handles)
% hObject    handle to e_hin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_hin as text
%        str2double(get(hObject,'String')) returns contents of e_hin as a double




% --- Executes during object creation, after setting all properties.
function e_hin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_hin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function e_hout_Callback(hObject, eventdata, handles)
% hObject    handle to e_hout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_hout as text
%        str2double(get(hObject,'String')) returns contents of e_hout as a double




% --- Executes during object creation, after setting all properties.
function e_hout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_hout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function e_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to e_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_gamma as text
%        str2double(get(hObject,'String')) returns contents of e_gamma as a double




% --- Executes during object creation, after setting all properties.
function e_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in b_imadjust.
function b_imadjust_Callback(hObject, eventdata, handles)
% hObject    handle to b_imadjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;

low_in = str2num (get (handles.e_lin, 'String') );
low_out = str2num (get (handles.e_lout, 'String') );
high_in = str2num (get (handles.e_hin, 'String') );
high_out = str2num (get (handles.e_hout, 'String') );
gamma = str2num (get (handles.e_gamma, 'String') );

im_adjust = imadjust(intermedio, [low_in; high_in], [low_out; high_out], gamma);

axes (handles.a_immagine1)
imshow (im_adjust);
impixelinfo (handles.a_immagine1);
axis image
axis off;

set (handles.e_lin, 'String', ' ');
set (handles.e_lout, 'String', ' ');
set (handles.e_hin, 'String',  ' ');
set (handles.e_hout, 'String', ' ');
set (handles.e_gamma, 'String', ' ')

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = im_adjust;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );
    
end;




% --- Executes on button press in b_histeq.
function b_histeq_Callback(hObject, eventdata, handles)
% hObject    handle to b_histeq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;

im_eq = histeq (intermedio);

axes (handles.a_immagine1);
imshow (im_eq);
impixelinfo (handles.a_immagine1);
axis image
axis off;

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = im_eq;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );
    
end;




% --- Executes on button press in b_campitura.
function b_campitura_Callback(hObject, eventdata, handles)
% hObject    handle to b_campitura (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;

a = str2num (get (handles.e_disk, 'String') );

b = isempty(a);
if b == 1
    a = 15;
end;

background = imopen (intermedio, strel('disk', a) );
im = imsubtract (intermedio, background);

axes (handles.a_immagine1);
imshow (im);
impixelinfo (handles.a_immagine1);
axis image
axis off;

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = im;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd .. 
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );

end;
    
set (handles.e_disk, 'String', ' '); 




% --- Executes on button press in b_salvag.
function b_salvag_Callback(hObject, eventdata, handles)
% hObject    handle to b_salvag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function e_l1_Callback(hObject, eventdata, handles)
% hObject    handle to e_l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_l1 as text
%        str2double(get(hObject,'String')) returns contents of e_l1 as a double




% --- Executes during object creation, after setting all properties.
function e_l1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function e_l2_Callback(hObject, eventdata, handles)
% hObject    handle to e_l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_l2 as text
%        str2double(get(hObject,'String')) returns contents of e_l2 as a double




% --- Executes during object creation, after setting all properties.
function e_l2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function e_r_Callback(hObject, eventdata, handles)
% hObject    handle to e_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_r as text
%        str2double(get(hObject,'String')) returns contents of e_r as a double




% --- Executes during object creation, after setting all properties.
function e_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in b_dilata.
function b_dilata_Callback(hObject, eventdata, handles)
% hObject    handle to b_dilata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global kernel;
global int;
global mInputArgs;

im_dil = imdilate (intermedio, kernel);

axes (handles.a_immagine1);
imshow (im_dil);
impixelinfo (handles.a_immagine1);
axis image
axis off;

set (handles.e_l1, 'String', ' ');
set (handles.e_l2, 'String', ' ');
set(handles.e_r, 'String', ' ');

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = im_dil;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );

end;




% --- Executes on button press in b_erodi.
function b_erodi_Callback(hObject, eventdata, handles)
% hObject    handle to b_erodi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global kernel;
global int;
global mInputArgs;

im_er = imerode (intermedio, kernel);

axes (handles.a_immagine1);
imshow (im_er);
impixelinfo (handles.a_immagine1);
axis image
axis off;

set (handles.e_l1, 'String', ' ');
set (handles.e_l2, 'String', ' ');
set (handles.e_r, 'String', ' ');


[x, y, but] = ginput(1);

if but == 3
       
    intermedio = im_er;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );
    
end;




% --- Executes on button press in b_otsu.
function b_otsu_Callback(hObject, eventdata, handles)
% hObject    handle to b_otsu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;
global im_bw;

level = graythresh (intermedio);
im_bw = im2bw (intermedio, level);

axes (handles.a_immagine1);
imshow (im_bw);
impixelinfo (handles.a_immagine1);
axis image
axis off;

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = im_bw;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );

end;
    



function e_level_Callback(hObject, eventdata, handles)
% hObject    handle to e_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_level as text
%        str2double(get(hObject,'String')) returns contents of e_level as a double




% --- Executes during object creation, after setting all properties.
function e_level_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in b_threshold.
function b_threshold_Callback(hObject, eventdata, handles)
% hObject    handle to b_threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;
global im_bw;

level = str2num (get (handles.e_level, 'String') );

im_bw = intermedio > level;

axes (handles.a_immagine1);
imshow (im_bw);
impixelinfo (handles.a_immagine1);

set (handles.e_level, 'String', ' ');

[x, y, but] = ginput(1);

if but==3
    
    intermedio = im_bw;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');
cd ..
cd ..
cd ..
cd ..

    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );

end;




function e_a_Callback(hObject, eventdata, handles)
% hObject    handle to e_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_a as text
%        str2double(get(hObject,'String')) returns contents of e_a as a double




% --- Executes during object creation, after setting all properties.
function e_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in pop_kernel.
function pop_kernel_Callback(hObject, eventdata, handles)
% hObject    handle to pop_kernel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns pop_kernel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_kernel

global kernel;


%Inizializzo gli edit a zero
str = get (hObject, 'String');
val = get (hObject, 'Value');

switch str {val}    
    
    case 'Rectangle'
        
        l1 = str2num (get (handles.e_l1, 'String') );
        l2 = str2num (get (handles.e_l2, 'String') );
        kernel = strel ('rectangle', [l1, l2]);
        
    case 'Diamond'
        
        r = str2num (get (handles.e_r, 'String') );
        kernel = strel ('diamond', r);
        
end;


% --- Executes during object creation, after setting all properties.
function pop_kernel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_kernel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in b_contorni.
function b_contorni_Callback(hObject, eventdata, handles)
% hObject    handle to b_contorni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global kernel;
global int;
global mInputArgs;

rint = intermedio &~ (imerode (intermedio, kernel) );

axes (handles.a_immagine1);
imshow (rint)
impixelinfo (handles.a_immagine1);

set (handles.e_l1, 'String', ' ');
set (handles.e_l2, 'String', ' ');
set (handles.e_r, 'String', ' ');

[x, y, but] = ginput(1);

if but == 3
       
    intermedio = rint;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio,int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );

end;




function e_riga_Callback(hObject, eventdata, handles)
% hObject    handle to e_riga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_riga as text
%        str2double(get(hObject,'String')) returns contents of e_riga as a double




% --- Executes during object creation, after setting all properties.
function e_riga_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_riga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function e_colonna_Callback(hObject, eventdata, handles)
% hObject    handle to e_colonna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_colonna as text
%        str2double(get(hObject,'String')) returns contents of e_colonna as a double




% --- Executes during object creation, after setting all properties.
function e_colonna_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_colonna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in b_fill.
function b_fill_Callback(hObject, eventdata, handles)
% hObject    handle to b_fill (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;
global riga;
global colonna;

riga = str2num (get (handles.e_riga, 'String') );
colonna = str2num (get (handles.e_colonna, 'String') );

current = zeros (size (intermedio) );
last = zeros (size (intermedio) );
last (riga, colonna) = 1;
current = imdilate (last, ones(3) ) &~ intermedio;

while any (current(:) ~= last(:) ),
    
    last = current;
    current = imdilate (last, ones(3)) &~ intermedio;
    
end;

out = current;
out = out | intermedio;

axes (handles.a_immagine1)
imshow (out)
impixelinfo (handles.a_immagine1);

set (handles.e_riga, 'String', ' ');
set (handles.e_colonna, 'String', ' ');

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = out;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );

end;




% --- Executes on button press in b_salvabin.
function b_salvabin_Callback(hObject, eventdata, handles)
% hObject    handle to b_salvabin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global mInputArgs;
global im_binary;

im_binary = intermedio;

cd (mInputArgs{2});

bin1 = strrep (mInputArgs{3}(1:13), 'p', 'b');
bin = strcat (bin1, mInputArgs{3}(14:17));
imwrite (intermedio, bin);   

% cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..




% --- Executes during object creation, after setting all properties.
function pop_conta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_conta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function e_num_cellule_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_num_cellule (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function e_individuazione_Callback(hObject, eventdata, handles)
% hObject    handle to e_individuazione (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_individuazione as text
%        str2double(get(hObject,'String')) returns contents of e_individuazione as a double




% --- Executes during object creation, after setting all properties.
function e_individuazione_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_individuazione (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in b_selezionan.
function b_selezionan_Callback(hObject, eventdata, handles)
% hObject    handle to b_selezionan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;

im_indiv = bwlabel (intermedio, 8);

axes (handles.a_immagine);
im_indiv = bwselect (im_indiv, 8);

axes (handles.a_immagine1)
imshow (im_indiv);

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = im_indiv;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    imwrite (intermedio, 'intermedio.jpg');
%     
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );
    
end;




% --- Executes on button press in b_scheletro.
function b_scheletro_Callback(hObject, eventdata, handles)
% hObject    handle to b_scheletro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global string;
global mInputArgs;

cd (mInputArgs{2});

sch = strrep (string, 'f', 's');
imwrite (intermedio, sch);
% 
% cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');


cd ..
cd ..
cd ..
cd ..

function e_hsize_c_Callback(hObject, eventdata, handles)
% hObject    handle to e_hsize_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_hsize_c as text
%        str2double(get(hObject,'String')) returns contents of e_hsize_c as a double




% --- Executes during object creation, after setting all properties.
function e_hsize_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_hsize_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function e_disk_Callback(hObject, eventdata, handles)
% hObject    handle to e_disk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_disk as text
%        str2double(get(hObject,'String')) returns contents of e_disk as a double




% --- Executes during object creation, after setting all properties.
function e_disk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_disk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in b_imhist.
function b_imhist_Callback(hObject, eventdata, handles)
% hObject    handle to b_imhist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;

[counts, x] = imhist (intermedio);
axes (handles.a_immagine1)
stem (x, counts)

[x, y, but] = ginput(1);

if but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );
    
end;




function e_m_Callback(hObject, eventdata, handles)
% hObject    handle to e_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_m as text
%        str2double(get(hObject,'String')) returns contents of e_m as a double




% --- Executes during object creation, after setting all properties.
function e_m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in b_inverti.
function b_inverti_Callback(hObject, eventdata, handles)
% hObject    handle to b_inverti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global int;
global mInputArgs;

intermedio = ~intermedio;
        
axes (handles.a_immagine1)
imshow (intermedio);
axis image
axis off;

axes (handles.a_immagine)
imshow (intermedio);
impixelinfo (handles.a_immagine);
axis image
axis off;

cd (mInputArgs{2});

imwrite (intermedio, int); 

% cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..


% --- Executes on button press in b_apri.
function b_apri_Callback(hObject, eventdata, handles)
% hObject    handle to b_apri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global kernel;
global intermedio;
global mInputArgs;
global int;

im_apr = imopen (intermedio, kernel);

axes (handles.a_immagine1);
imshow (im_apr)
impixelinfo (handles.a_immagine1);
axis image
axis off;

set (handles.e_l1, 'String', ' ');
set (handles.e_l2, 'String', ' ');
set (handles.e_r, 'String', ' ');

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = im_apr;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
%     
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');


cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );

end;




% --- Executes on button press in b_chiudi.
function b_chiudi_Callback(hObject, eventdata, handles)
% hObject    handle to b_chiudi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global kernel;
global intermedio;
global mInputArgs;
global int;

im_ch = imclose (intermedio, kernel);

axes (handles.a_immagine1);
imshow (im_ch)
impixelinfo (handles.a_immagine1);
axis image
axis off;

set (handles.e_l1, 'String', ' ');
set (handles.e_l2, 'String', ' ');
set (handles.e_r, 'String', ' ');

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = im_ch;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..
    
    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );

end;



% --- Executes on button press in b_skell.
function b_skell_Callback(hObject, eventdata, handles)
% hObject    handle to b_skell (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global skel;
global mInputArgs;
global int;

skel = ~intermedio;

[x1, y1] = ginput(1);    %Seleziono orientativamente il centro del soma
[x2, y2] =ginput(1);   %Seleziono un punto in alto a sinistra che mi identifichi la fine del soma

x1 = uint32(x1);
y1 = uint32(y1);
x2 = uint32(x2);
y2 = uint32(y2);


for i = y2:(2*y1-y2)
    for j = (2*x1-x2):x2
        skel(i, j) = 0;
    end;
end;

skel = bwmorph(skel, 'thin', Inf);

skel = bwmorph(skel, 'bridge', 10);

skel = imdilate(skel, strel('line', 4, 1));

skel = bwareaopen(skel, 40);

skel = ~ skel;   %black skel

axes(handles.a_immagine1);
imshow(skel)

[x, y, but] = ginput(1);

if but == 3
    
    intermedio = skel;
    
    cd (mInputArgs{2});
    
    imwrite (intermedio, int);
    
%     cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');
    

cd ..
cd ..
cd ..
cd ..

    axes (handles.a_immagine);
    imshow (intermedio);
    impixelinfo (handles.a_immagine);
    axis image
    axis off;
    
elseif but == 1
    
    impixelinfo (handles.a_immagine);
    axes (handles.a_immagine1)
    imshow (zeros (size (intermedio) ) );

end;




% --- Executes on button press in b_saveskel.
function b_saveskel_Callback(hObject, eventdata, handles)
% hObject    handle to b_saveskel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global intermedio;
global mInputArgs;

cd (mInputArgs{2});



sch1 = strrep (mInputArgs{3}(1:13), 'p', 's');
sch = strcat (sch1, mInputArgs{3}(14:17));
imwrite (intermedio, sch);   

delete intermedio.jpg
delete ('i_*.jpg')

% cd ('C:\Documents and Settings\chiara\Documenti\tesi_triennale_mia\NEMO');

cd ..
cd ..
cd ..
cd ..

close;

