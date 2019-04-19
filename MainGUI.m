function varargout = MainGUI(varargin)
% MAINGUI MATLAB code for MainGUI.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainGUI

% Last Modified by GUIDE v2.5 18-Apr-2019 12:57:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MainGUI_OutputFcn, ...
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


% --- Executes just before MainGUI is made visible.
function MainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainGUI (see VARARGIN)

% Choose default command line output for MainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function dimA_Callback(hObject, eventdata, handles)
% hObject    handle to dimA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dimensioneA = str2double(get(hObject,'String'));

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function dimA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dimA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function dimB_Callback(hObject, eventdata, handles)
% hObject    handle to dimB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dimB as text
%        str2double(get(hObject,'String')) returns contents of dimB as a double
handles.dimensioneB = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function dimB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dimB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function fieldInf_Callback(hObject, eventdata, handles)
% hObject    handle to fieldInf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fieldInf as text
%        str2double(get(hObject,'String')) returns contents of fieldInf as a double
handles.campoInf = get(hObject,'String');
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function fieldInf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fieldInf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fieldSup_Callback(hObject, eventdata, handles)
% hObject    handle to fieldSup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fieldSup as text
%        str2double(get(hObject,'String')) returns contents of fieldSup as a double
handles.campoSup = get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function fieldSup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fieldSup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fieldFull_Callback(hObject, eventdata, handles)
% hObject    handle to fieldFull (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fieldFull as text
%        str2double(get(hObject,'String')) returns contents of fieldFull as a double
handles.campoFull = get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function fieldFull_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fieldFull (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in getSol.
function getSol_Callback(hObject, eventdata, handles)
% hObject    handle to getSol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%format longe
finaltext = '';
dimensioneA = str2double(get(handles.dimA, 'String'));
if(~isnumeric(dimensioneA) || dimensioneA<=1 || isempty(dimensioneA))
     errordlg('Inserire un valore numerico che sia maggiore o uguale a 2');
     error('Inserire un valore numerico che sia maggiore o uguale a 2');
end
dimensioneB = str2double(get(handles.dimB, 'String'));
if(~isnumeric(dimensioneB) || dimensioneB~=dimensioneA || isempty(dimensioneB))
     errordlg('Inserire un valore numerico uguale alla dimensione di A'); 
     error('Inserire un valore numerico uguale alla dimensione di A');
end
campoInf = get(handles.fieldInf,'String');
campoSup = get(handles.fieldSup,'String');
campoFull = get(handles.fieldFull,'String');
if(isempty(campoInf) || isempty(campoSup) || isempty(campoFull))
    errordlg('Inserire tutti e tre i campi come valori booleani');
    error('Inserire tutti e tre i campi come valori booleani');
end
if(~strcmp(campoInf,'true') && ~strcmp(campoInf,'false'))
    errordlg('Inserire un valore booleano true o false');
     error('Inserire un valore booleano true o false');
end
if(~strcmp(campoSup,'true') && ~strcmp(campoSup,'false'))
    errordlg('Inserire un valore booleano true o false');
     error('Inserire un valore booleano true o false');
end
if(~strcmp(campoFull,'true') && ~strcmp(campoFull,'false'))
    errordlg('Inserire un valore booleano true o false');
     error('Inserire un valore booleano true o false');
end
if(strcmp(campoInf,'true'))
    campoInf = true;
else
    campoInf = false;
end
if(strcmp(campoSup,'true'))
    campoSup = true;
else
    campoSup = false;
end
if(strcmp(campoFull,'true'))
    campoFull = true;
else
    campoFull = false;
end
if((campoSup && campoInf) || (campoFull && campoInf) || (campoSup && campoFull))
    errordlg('Solo uno dei campi di Opt deve essere true','Errore');
 error('Err:MutuaEsclusioneCampi','Solo uno dei campi di opt devono assumere true');
end
A = rand(dimensioneA,dimensioneA);
answer = questdlg('Generare Matrice Ben Condizionata?','Genera Matrice','Si','No','No');
switch answer
    case 'Si'
        A = A + 2*diag(ones(dimensioneA,1));
end
if(campoInf && ~campoSup && ~campoFull)
    A = tril(A);
elseif(~campoInf && campoSup && ~campoFull)
    A = triu(A);
elseif(~campoInf && ~campoSup && campoFull)
    A = full(A);
end
b = rand(dimensioneB,1);
opt.inf = campoInf;
opt.sup = campoSup;
opt.full = campoFull;
x = risolve(A,b,opt);
for i=1:length(x)
testo = sprintf('x =  %.5e',x(i));
end
finaltext = [finaltext,' ',testo];
set(handles.ris,'String',sprintf('Soluzioni del Sistema \n %s',finaltext));


% --- Executes on button press in btnCheckAccuracy.
function btnCheckAccuracy_Callback(hObject, eventdata, handles)
% hObject    handle to btnCheckAccuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%format longe
dimensioneA = str2double(get(handles.dimA, 'String'));
if(~isnumeric(dimensioneA) || dimensioneA<=1 || isempty(dimensioneA))
     errordlg('Inserire un valore numerico che sia maggiore o uguale a 2');
     error('Inserire un valore numerico che sia maggiore o uguale a 2');
end
dimensioneB = str2double(get(handles.dimB, 'String'));
if(~isnumeric(dimensioneB) || dimensioneB~=dimensioneA || isempty(dimensioneB))
     errordlg('Inserire un valore numerico uguale alla dimensione di A'); 
     error('Inserire un valore numerico uguale alla dimensione di A');
end
campoInf = get(handles.fieldInf,'String');
campoSup = get(handles.fieldSup,'String');
campoFull = get(handles.fieldFull,'String');
if(isempty(campoInf) || isempty(campoSup) || isempty(campoFull))
    errordlg('Inserire tutti e tre i campi come valori booleani');
    error('Inserire tutti e tre i campi come valori booleani');
end
if(~strcmp(campoInf,'true') && ~strcmp(campoInf,'false'))
    errordlg('Inserire un valore booleano true o false');
     error('Inserire un valore booleano true o false');
end
if(~strcmp(campoSup,'true') && ~strcmp(campoSup,'false'))
    errordlg('Inserire un valore booleano true o false');
     error('Inserire un valore booleano true o false');
end
if(~strcmp(campoFull,'true') && ~strcmp(campoFull,'false'))
    errordlg('Inserire un valore booleano true o false');
     error('Inserire un valore booleano true o false');
end
if(strcmp(campoInf,'true'))
    campoInf = true;
else
    campoInf = false;
end
if(strcmp(campoSup,'true'))
    campoSup = true;
else
    campoSup = false;
end
if(strcmp(campoFull,'true'))
    campoFull = true;
else
    campoFull = false;
end
A = rand(dimensioneA,dimensioneA);
answer = questdlg('Generare Matrice Ben Condizionata?','Genera Matrice','Si','No','No');
switch answer
    case 'Si'
        A = A + 2*diag(ones(dimensioneA,1));
end
if(campoInf && ~campoSup && ~campoFull)
    A = tril(A);
elseif(~campoInf && campoSup && ~campoFull)
    A = triu(A);
elseif(~campoInf && ~campoSup && campoFull)
    A = full(A);
end
x = ones(dimensioneB,1);
b = A*x;
opt.inf = campoInf;
opt.sup = campoSup;
opt.full = campoFull;
if(opt.inf)
    [indice_cond,err,residuo] = Calcolo_Accuratezza(A,x,b,'inf');
    set(handles.ris,'String',sprintf('Indice di Accuratezza = %.16e \n Errore Relativo = %.16e \n Residuo = %.16e \n',indice_cond,err,residuo));
end
if(opt.sup)
    [indice_cond,err,residuo] = Calcolo_Accuratezza(A,x,b,'sup');
    set(handles.ris,'String',sprintf('Indice di Accuratezza = %.16e \n Errore Relativo = %.16e \n Residuo = %.16e \n',indice_cond,err,residuo));
end
if(opt.full)
    [indice_cond,err,residuo] = Calcolo_Accuratezza(A,x,b,'full');
    set(handles.ris,'String',sprintf('Indice di Accuratezza = %.16e \n Errore Relativo = %.16e \n Residuo = %.16e \n',indice_cond,err,residuo));
end


% --- Executes on button press in btnInfo.
function btnInfo_Callback(hObject, eventdata, handles)
% hObject    handle to btnInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Risolve_doc.pdf');


% --- Executes on button press in btnCasiTest.
function btnCasiTest_Callback(hObject, eventdata, handles)
% hObject    handle to btnCasiTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Test_Algoritmo_Risolve.pdf');


% --- Executes on button press in btnValutaPerformance.
function btnValutaPerformance_Callback(hObject, eventdata, handles)
% hObject    handle to btnValutaPerformance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Valuta_Performance(2,100,1,'full')