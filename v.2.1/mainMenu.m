

function varargout = mainMenu(varargin)
% MAINMENU MATLAB code for mainMenu.fig
%      MAINMENU, by itself, creates a new MAINMENU or raises the existing
%      singleton*.
%
%      H = MAINMENU returns the handle to a new MAINMENU or the handle to
%      the existing singleton*.
%
%      MAINMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINMENU.M with the given input arguments.
%
%      MAINMENU('Property','Value',...) creates a new MAINMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainMenu

% Last Modified by GUIDE v2.5 13-Jun-2016 15:53:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @mainMenu_OutputFcn, ...
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


% --- Executes just before mainMenu is made visible.
function mainMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainMenu (see VARARGIN)

% Choose default command line output for mainMenu
%hanldes.popup_data='language';
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
handles
% UIWAIT makes mainMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.next,'enable','off');


% --- Outputs from this function are returned to the command line.
function varargout = mainMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opc = handles.popup_data;
fig=handles.figure1; % Get Figure Handle
switch opc
    case 'Processing' 
        display(opc);
        processing(fig);
    case 'Python'
        display(opc);
        python(fig);
    case 'Matlab'
        display(opc);
end
guidata(hObject, handles);



% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%close(mainMenu);
close all;

% --- Executes on selection change in languageSelection.
function languageSelection_Callback(hObject, eventdata, handles)
% hObject    handle to languageSelection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns languageSelection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from languageSelection

% --- Executes during object creation, after setting all properties.
str = get(hObject,'String');
contents = get(hObject,'Value');
switch contents
    case 1
        set(handles.next,'enable','off');
        handles.popup_data = 'language';
    otherwise
        set(handles.next,'enable','on');
        handles.popup_data = str{contents};
end
guidata(hObject, handles);


function languageSelection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to languageSelection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object deletion, before destroying properties.
function exit_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
