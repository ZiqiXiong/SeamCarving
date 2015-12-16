function varargout = SCGUI(varargin)
% SCGUI MATLAB code for SCGUI.fig
%      SCGUI, by itself, creates a new SCGUI or raises the existing
%      singleton*.
%
%      H = SCGUI returns the handle to a new SCGUI or the handle to
%      the existing singleton*.
%
%      SCGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCGUI.M with the given input arguments.
%
%      SCGUI('Property','Value',...) creates a new SCGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SCGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SCGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SCGUI

% Last Modified by GUIDE v2.5 15-Dec-2015 20:39:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SCGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SCGUI_OutputFcn, ...
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


% --- Executes just before SCGUI is made visible.
function SCGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SCGUI (see VARARGIN)
image = [0,0,0;0,0,0;0,0,0];
handles.image = image;
handles.hasImage = false;
width = 0;
height = 0;
handles.width = width;
handles.height = height;
handles.inputWidth = 0;
handles.inputHeight = 0;
handles.ORSelection = 'h';

% Choose default command line output for SCGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SCGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SCGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in resizeButton.
function resizeButton_Callback(hObject, eventdata, handles)
% hObject    handle to resizeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wd = handles.width;
ht = handles.height;
iwd = handles.inputWidth;
iht = handles.inputHeight;
if wd ~= 0 && ht ~= 0
    img = handles.image;
    vseams = iwd - wd;
    hseams = iht - ht;
    if hseams < 0 && vseams < 0
        I = attachPositionToImage(img);        
        I = resizeImage(I,vseams, hseams, 1, handles);
    end
    axes(handles.imageDisp);
    imshow(I(:,:,1:3))
end

% --- Executes on button press in ObjectRemovalButton.
function ObjectRemovalButton_Callback(hObject, eventdata, handles)
% hObject    handle to ObjectRemovalButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wd1 = handles.width;
ht1 = handles.height;
if wd1 ~= 0 && ht1 ~= 0
    img1 = handles.image;
    I1 = attachPositionToImage(img1);
    I1 = removeObject(I1,handles.ORSelection,1,handles);
    axes(handles.imageDisp);
    imshow(I1(:,:,1:3))
end


function widthInput_Callback(hObject, eventdata, handles)
% hObject    handle to widthInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wiwidth = str2double(get(hObject, 'String'));
handles.inputWidth = wiwidth;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of widthInput as text
%        str2double(get(hObject,'String')) returns contents of widthInput as a double


% --- Executes during object creation, after setting all properties.
function widthInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function HeightInput_Callback(hObject, eventdata, handles)
% hObject    handle to HeightInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hiheight = str2double(get(hObject, 'String'));
handles.inputHeight = hiheight;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of HeightInput as text
%        str2double(get(hObject,'String')) returns contents of HeightInput as a double


% --- Executes during object creation, after setting all properties.
function HeightInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HeightInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loadButton.
function loadButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[File_Name, Path_Name] = uigetfile('User/Desktop');
if File_Name ~= 0
image = im2double(imread([Path_Name File_Name]));
[ht,wd,~] = size(image);
handles.image = image;
handles.hasImage = true;
handles.width = wd;
handles.height = ht;
set(handles.imageWidthText, 'String', num2str(wd));
set(handles.imageHeightText, 'String', num2str(ht));
axes(handles.imageDisp);
imshow(handles.image)

guidata(hObject, handles);
end


% --- Executes on button press in ORVerButton.
function ORVerButton_Callback(hObject, eventdata, handles)
% hObject    handle to ORVerButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ORSelection = 'v';
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of ORVerButton


% --- Executes on button press in ORHorButton.
function ORHorButton_Callback(hObject, eventdata, handles)
% hObject    handle to ORHorButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ORSelection = 'h';
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of ORHorButton


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% if strcmp(get(eventdata.NewValue, 'Tag'), 'ORVerButton') == 1
%     handles.ORSelection = 'v';
% end
% if strcmp(get(eventdata.NewValue, 'Tag'), 'ORHorButton') == 1
%     handles.ORSelection = 'h';
% end