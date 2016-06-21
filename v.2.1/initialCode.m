function varargout = initialCode(varargin)
% INITIALCODE MATLAB code for initialCode.fig
%      INITIALCODE, by itself, creates a new INITIALCODE or raises the existing
%      singleton*.
%
%      H = INITIALCODE returns the handle to a new INITIALCODE or the handle to
%      the existing singleton*.
%
%      INITIALCODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INITIALCODE.M with the given input arguments.
%
%      INITIALCODE('Property','Value',...) creates a new INITIALCODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before initialCode_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to initialCode_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help initialCode

% Last Modified by GUIDE v2.5 21-Jun-2016 13:22:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @initialCode_OpeningFcn, ...
                   'gui_OutputFcn',  @initialCode_OutputFcn, ...
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


% --- Executes just before initialCode is made visible.
function initialCode_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to initialCode (see VARARGIN)
% Choose default command line output for processing
% Choose default command line output for processing
if isempty(varargin)
    return
end
handles.MainFig = varargin{1};

load('config.mat');
handles.config = config
%handles.currentExercise = config.processing.exercise.one
% Choose default command line output for initialCodehandles
%handles.InitialCodeBox.String = handles.config.processing.exercise.one.hintcode
%handles.InitialCodeText.String = handles.config.processing.exercise.one.hintcode
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes initialCode wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = initialCode_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in InitialCodeBox.
function InitialCodeBox_Callback(hObject, eventdata, handles)
% hObject    handle to InitialCodeBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns InitialCodeBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from InitialCodeBox


% --- Executes during object creation, after setting all properties.
function InitialCodeBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InitialCodeBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
