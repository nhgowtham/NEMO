function varargout = choice(varargin)
% CHOICE M-file for choice.fig
%      CHOICE, by itself, creates a new CHOICE or raises the existing
%      singleton*.
%
%      H = CHOICE returns the handle to a new CHOICE or the handle to
%      the existing singleton*.
%
%      CHOICE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOICE.M with the given input arguments.
%
%      CHOICE('Property','Value',...) creates a new CHOICE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before choice_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to choice_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help choice

% Last Modified by GUIDE v2.5 07-Nov-2011 12:31:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @choice_OpeningFcn, ...
                   'gui_OutputFcn',  @choice_OutputFcn, ...
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


% --- Executes just before choice is made visible.
function choice_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to choice (see VARARGIN)

% Choose default command line output for choice
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes choice wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = choice_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
global tipo;

varargout{1} = tipo;
varargout{1} = handles.output;



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%       contents{get(hObject,'Value')} returns selected item from popupmenu1

global tipo;

val = get(hObject,'Value');
str = get(hObject, 'String');
switch str{val};
    
case 'Analysis day-by-day' 
	tipo = 'g';
    save('tipo.mat', 'tipo', '-mat')
    
case 'Dynamic Analysis' 
	tipo = 't';
    save('tipo.mat', 'tipo', '-mat')
    
end;

guidata(hObject,handles)
uiwait

load datamatrix.mat
load numberofcells.mat
numberofcells = cat(1, 1, numberofcells);
numberofcells = cat(1, numberofcells, 1);

% for i = 1: size(numberofcells, 1)
%     
%     a = num2str(numberofcells (i));
%     f = num2str(numberofcells(i+1));
%     b = num2str(i);
%     c = 'Colture number ';
%     d = ' contains untill the ';
%     e = ' cell';
%     h = msgbox([c b d a e], 'information');
%     
% end; 

z = 1;

for i = 1:(size(numberofcells, 1)-2)
    
    a = num2str(numberofcells(i));
    g = num2str(numberofcells(i+1));
    b = num2str(i);
    c = 'Cell from ';
    d = ' are of the colture number ';
    e = ' cell';
    f = ' to ';
    z = z + str2num(g);
    h = msgbox([c a f num2str(z)-1 d b], 'information');
    uiwait(h)
    
end;   

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


