function varargout = SDS(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 01-Sep-2015 10:55:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @untitled_OpeningFcn, ...
    'gui_OutputFcn',  @untitled_OutputFcn, ...
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
end

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

axis([-0.6 0.6 -0.6 0.6]);
grid on;
setappdata(0,'target',[0 0 0]);
setappdata(0,'randIndex',1);
setappdata(0,'isRandom',-1);
load('./testSets/gSeqRecordData0','gseq_sub');
handles.testSet1=gseq_sub;
load('./testSets/gSeqRecordData20','gseq_sub2');
handles.testSet2=gseq_sub2;
% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end
% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.edit1.String=num2str(hObject.Value);
end
% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
hObject.Max=275;
hObject.Min=-25;
hObject.Value=getdefValue(3,1);
end
% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.edit2.String=num2str(hObject.Value);
end
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
hObject.Max=0.7;
hObject.Min=-0.1;
hObject.Value=getdefValue(3,2);
end
% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.edit3.String=num2str(hObject.Value);
end
% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
hObject.Max=175;
hObject.Min=0.15;
hObject.Value=getdefValue(3,3);
end
% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.edit4.String=num2str(hObject.Value);
end
% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
hObject.Max=0.5;
hObject.Min=0.03;
hObject.Value=getdefValue(3,4);
end
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.slider1.Value=str2num(hObject.String);
end
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String=num2str(getdefValue(3,1));
end
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
handles.slider2.Value=str2num(hObject.String);
end
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String=num2str(getdefValue(3,2));
end
function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
handles.slider3.Value=str2num(hObject.String);
end
% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String=num2str(getdefValue(3,3));
end
function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
handles.slider4.Value=str2num(hObject.String);
end
% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String=num2str(getdefValue(3,4));
end

% --- Executes on slider movement.
function st1_Callback(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.ste1.String=num2str(hObject.Value);
end
% --- Executes during object creation, after setting all properties.
function st1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
hObject.Value=getdefValue(1,1);
end
% --- Executes on slider movement.
function st2_Callback(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.ste2.String=num2str(hObject.Value);
end
% --- Executes during object creation, after setting all properties.
function st2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
hObject.Value=getdefValue(1,2);
end
% --- Executes on slider movement.
function st3_Callback(hObject, eventdata, handles)
% hObject    handle to st3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.ste3.String=num2str(hObject.Value);
end
% --- Executes during object creation, after setting all properties.
function st3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to st3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
hObject.Value=getdefValue(1,3);
end
% --- Executes on slider movement.
function st4_Callback(hObject, eventdata, handles)
% hObject    handle to st4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.ste4.String=num2str(hObject.Value);
end
% --- Executes during object creation, after setting all properties.
function st4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to st4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
hObject.Value=getdefValue(1,4);
end


function ste1_Callback(hObject, eventdata, handles)
% hObject    handle to ste1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ste1 as text
%        str2double(get(hObject,'String')) returns contents of ste1 as a double
handles.st1.Value=str2double(hObject.String);
end
% --- Executes during object creation, after setting all properties.
function ste1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ste1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String=num2str(getdefValue(1,1));
end
function ste2_Callback(hObject, eventdata, handles)
% hObject    handle to ste2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ste2 as text
%        str2double(get(hObject,'String')) returns contents of ste2 as a double
handles.st2.Value=str2double(hObject.String);
end
% --- Executes during object creation, after setting all properties.
function ste2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ste2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String=num2str(getdefValue(1,2));
end
function ste3_Callback(hObject, eventdata, handles)
% hObject    handle to ste3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ste3 as text
%        str2double(get(hObject,'String')) returns contents of ste3 as a double
handles.st3.Value=str2double(hObject.String);
end
% --- Executes during object creation, after setting all properties.
function ste3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ste3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String=num2str(getdefValue(1,3));
end
function ste4_Callback(hObject, eventdata, handles)
% hObject    handle to ste4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ste4 as text
%        str2double(get(hObject,'String')) returns contents of ste4 as a double
handles.st4.Value=str2double(hObject.String);
end
% --- Executes during object creation, after setting all properties.
function ste4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ste4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String=num2str(getdefValue(1,4));
end

function cb1_Callback(hObject, eventdata, handles)
% hObject    handle to cb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cb1 as text
%        str2double(get(hObject,'String')) returns contents of cb1 as a double
end
% --- Executes during object creation, after setting all properties.
function cb1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function cb2_Callback(hObject, eventdata, handles)
% hObject    handle to cb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cb2 as text
%        str2double(get(hObject,'String')) returns contents of cb2 as a double
end
% -- Executes during object creation, after setting all properties.
function cb2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
function cb3_Callback(hObject, eventdata, handles)
% hObject    handle to cb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cb3 as text
%        str2double(get(hObject,'String')) returns contents of cb3 as a double
end
% --- Executes during object creation, after setting all properties.
function cb3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function cb4_Callback(hObject, eventdata, handles)
% hObject    handle to cb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cb4 as text
%        str2double(get(hObject,'String')) returns contents of cb4 as a double
end
% --- Executes during object creation, after setting all properties.
function cb4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
% --- Executes on button press in guessFeaturesCheckbox.
function guessFeaturesCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to guessFeaturesCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of guessFeaturesCheckbox
end
function showTrajectoryCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to showTrajectoryCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of showTrajectoryCheckbox
end
function trajectoryCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to guessFeaturesCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of guessFeaturesCheckbox
end
function randomi_Callback(hObject, eventdata, handles)
% hObject    handle to randomi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of randomi as text
%        str2double(get(hObject,'String')) returns contents of randomi as a double
setappdata(0,'randIndex',int64(str2num(hObject.String)));
end
% --- Executes during object creation, after setting all properties.
function randomi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to randomi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
% --- Executes on button press in randomTargetButton.
function ts_Callback(hObject, eventdata, handles)
% hObject    handle to ts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ts as text
%        str2double(get(hObject,'String')) returns contents of ts as a double

end
% --- Executes during object creation, after setting all properties.
function ts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String='0';
end
function dir_Callback(hObject, eventdata, handles)
% hObject    handle to dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dir as text
%        str2double(get(hObject,'String')) returns contents of dir as a double
end
% --- Executes during object creation, after setting all properties.
function dir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
hObject.String='1';
end
function randomTargetButton_Callback(hObject, eventdata, handles)
% hObject    handle to randomTargetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'isRandom',1);
if handles.trajectoryCheckbox.Value
i=floor(rand()*size(handles.testSet2,2))+1;
else
i=floor(rand()*size(handles.testSet1,2))+1;
end
setappdata(0,'randIndex',i);
handles.randomi.String=num2str(i);
animateRandomTestSeq(handles);
end
% --- Executes on button press in repeatButton.
function repeatButton_Callback(hObject, eventdata, handles)
% hObject    handle to repeatButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if getappdata(0,'isRandom')
    animateRandomTestSeq(handles);
else
    hold off
    anim.drawDestination(getappdata(0,'target'),'k');
    axis([-0.6 0.6 -0.6 0.6]);
    grid on;
    guessAndDraw(handles);
end

end
% --- Executes on button press in choose.
function select_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'isRandom',0);
hold off;
[x,y]=getPoint(1);
scatter(x,y);
[x2,y2]=getPoint(0);
setappdata(0,'target',rtools.vec2ang([x,y,x2-x,y2-y]));
anim.drawDestination(getappdata(0,'target'),'k');
axis([-0.6 0.6 -0.6 0.6]);
grid on;
hold on;
guessAndDraw(handles);
end

function [x,y]=getPoint(withCheck) %withCheck is to use the function without interval check for the second point selection, which is basically selects the direction and no interval requirement needed.
notInside = 1;
while notInside
    rectangle('Position',[-0.4 -0.4 0.8 0.8]);
    axis([-0.6 0.6 -0.6 0.6]);
    grid on;
    [x,y]=ginput(1);
    notInside = withCheck&&~checkPoint(x,y);
end
end
function isInside=checkPoint(x,y)
       rpolyx=[-0.4 -0.4 0.4 0.4];
       rpolyy=[-0.4 0.4 0.4 -0.4];
       isInside=inpolygon(x,y,rpolyx,rpolyy);
    if ~isInside
        h=errordlg('You should choose a point from the inside of the square!','Error');
        set(h, 'WindowStyle', 'modal');
        uiwait(h);
    end
end
function guessAndDraw(handles)
[charStruct,startingFoot]=getCharStructAndStartingFoot(handles);
gseq=getseq.generateSteps(getappdata(0,'target'),charStruct,startingFoot,handles.trajectoryCheckbox.Value);
draw_gSeq(handles,gseq,'m');
end
function draw_gSeq(handles,gseq,clr)
if strcmp(handles.footImageButtongroup2.SelectedObject.Tag,'t')
    drawFun=@anim.drawDestination;
else
    drawFun=@anim.drawFoot;
end
hold on;
  anim.drawGseqWithTra(gseq,drawFun,clr,handles.trajectoryCheckbox.Value,handles.showTrajectoryCheckbox.Value);  
end
function animateRandomTestSeq(handles)
%ADD IF HERE FOR SELECTING THE OTHER DAR
if handles.trajectoryCheckbox.Value
testSeq=handles.testSet2(getappdata(0,'randIndex'));
else
testSeq=handles.testSet1(getappdata(0,'randIndex'));    
end
setappdata(0,'target',testSeq.gSeq.target);
setFeaturesAndBias(testSeq.seqFeatures,testSeq.charBias,handles);
setStartingFoot(testSeq.gSeq.stepOrder(1),handles);
hold off
anim.drawDestination(getappdata(0,'target'),'k');
axis([-0.6 0.6 -0.6 0.6]);
grid on;
hold on;
draw_gSeq(handles,testSeq.gSeq,'m');
pause(1);
hold off
anim.drawDestination(getappdata(0,'target'),'k');
axis([-0.6 0.6 -0.6 0.6]);
grid on;
guessAndDraw(handles);
end
function setFeaturesAndBias(ftrs,cBias,handles)
%ftrs=1x4
handles.slider1.Value=ftrs(1);
handles.slider2.Value=ftrs(2);
handles.slider3.Value=ftrs(3);
handles.slider4.Value=ftrs(4);
handles.edit1.String=num2str(ftrs(1));
handles.edit2.String=num2str(ftrs(2));
handles.edit3.String=num2str(ftrs(3));
handles.edit4.String=num2str(ftrs(4));
handles.dir.String=num2str(ftrs(9));
handles.ts.String=num2str(ftrs(10));
%Stance
handles.st1.Value=ftrs(5);
handles.st2.Value=ftrs(6);
handles.st3.Value=ftrs(7);
handles.st4.Value=ftrs(8);
handles.ste1.String=num2str(ftrs(5));
handles.ste2.String=num2str(ftrs(6));
handles.ste3.String=num2str(ftrs(7));
handles.ste4.String=num2str(ftrs(8));
%Bias
handles.cb1.String=num2str(cBias(1));
handles.cb2.String=num2str(cBias(2));
handles.cb3.String=num2str(cBias(3));
handles.cb4.String=num2str(cBias(4));

end
function setStartingFoot(isRT,handles)
if isRT
    handles.rt.Value=1;
else
    handles.lt.Value=1;
end
end
function [charStruct,startingFoot]=getCharStructAndStartingFoot(handles)
%Bias
charStruct.bias=zeros(4,1);
charStruct.bias(1)=str2double(handles.cb1.String);
charStruct.bias(2)=str2double(handles.cb2.String);
charStruct.bias(3)=str2double(handles.cb3.String);
charStruct.bias(4)=str2double(handles.cb4.String);
%Stance
charStruct.stance=zeros(4,1);
charStruct.stance(1)=handles.st1.Value;
charStruct.stance(2)=handles.st2.Value;
charStruct.stance(3)=handles.st3.Value;
charStruct.stance(4)=handles.st4.Value;
if handles.guessFeaturesCheckbox.Value
    source=rtools.ang2vec(rtools.transformToSourceRepr(getappdata(0,'target')))';
    x_stance=[source;charStruct.stance(1:2,1)]; %x_stance->6x1
    x=nnfun.nnStance1(x_stance);
    charStruct.strategy=nnfun.nnStrategy(x);
    setGuessedFeatures(charStruct.strategy,handles);
    startingFoot=-1;
    handles.ni.Value=1;
else
    %Starting Foot
    if strcmp(handles.startingFootButtongroup1.SelectedObject.Tag,'rt')
        startingFoot=1;
    elseif strcmp(handles.startingFootButtongroup1.SelectedObject.Tag,'lt')
        startingFoot=0;
    else
        startingFoot=-1;
    end
    %Strategy
    charStruct.strategy=zeros(4,1);
    charStruct.strategy(1)=handles.slider1.Value;
    charStruct.strategy(2)=handles.slider2.Value;
    charStruct.strategy(3)=handles.slider3.Value;
    charStruct.strategy(4)=handles.slider4.Value;
    charStruct.strategy(5)=str2double(handles.dir.String);
    charStruct.strategy(6)=str2double(handles.ts.String);
    
end
end
function setGuessedFeatures(ftrs,handles)
%ftrs=6x1
handles.slider1.Value=ftrs(1);
handles.slider2.Value=ftrs(2);
handles.slider3.Value=ftrs(3);
handles.slider4.Value=ftrs(4);
handles.edit1.String=num2str(ftrs(1));
handles.edit2.String=num2str(ftrs(2));
handles.edit3.String=num2str(ftrs(3));
handles.edit4.String=num2str(ftrs(4));
handles.dir.String=num2str(ftrs(5));
handles.ts.String=num2str(ftrs(6));
end