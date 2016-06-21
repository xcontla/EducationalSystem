function varargout = processing(varargin)
% PROCESSING MATLAB code for processing.fig
%      PROCESSING, by itself, creates a new PROCESSING or raises the existing
%      singleton*.
%
%      H = PROCESSING returns the handle to a new PROCESSING or the handle to
%      the existing singleton*.
%
%      PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCESSING.M with the given input arguments.
%
%      PROCESSING('Property','Value',...) creates a new PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help processing

% Last Modified by GUIDE v2.5 17-Jun-2016 11:00:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @processing_OpeningFcn, ...
    'gui_OutputFcn',  @processing_OutputFcn, ...
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


% --- Executes just before processing is made visible.
function processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to processing (see VARARGIN)

% Choose default command line output for processing
if isempty(varargin)
    return
end
handles.MainFig = varargin{1};
% Update handles structure
load('config.mat');
handles.config = config;
handles.currentExercise = config.processing.exercise.one;
handles.instructionBox.String = handles.currentExercise.instructions;
guidata(hObject, handles);

%display(config.processing.execute.command);
set(handles.nextButton,'enable','off');


% UIWAIT makes processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = processing_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = [];%handles.output;



function processingCode_Callback(hObject, eventdata, handles)
% hObject    handle to processingCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of processingCode as text
%        str2double(get(hObject,'String')) returns contents of processingCode as a double


% --- Executes during object creation, after setting all properties.
function processingCode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to processingCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkButton.
function checkButton_Callback(hObject, eventdata, handles)
% hObject    handle to checkButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%axes(handles.correctImage);
%imshow(handles.data.image);
%search for the correct image
    if(handles.data.iscorrect < 1)
        axes(handles.correctImage);
        imshow(handles.data.correctImage);
    end


% --- Executes on button press in nextButton.
function nextButton_Callback(hObject, eventdata, handles)
% hObject    handle to nextButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in LoadCode.
function LoadCode_Callback(hObject, eventdata, handles)
% hObject    handle to LoadCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName,filePath]=uigetfile({'*.*'},'Where is your code?');
try
    fileContent=getFileContent(filePath,fileName);
    %s fileContent
    handles.studentCode.String=fileContent;
    handles.data.filePath = filePath;
    handles.data.fileName = fileName;
    handles.data.filePath
    handles.data.fileName
    
    % fileName=data.course.report{data.currentReport}.issue-- Salvar el
    % nombre del codigo para poder cargarlo de nuevo
    guidata(hObject, handles);
catch ex
    display(ex);
end

%%Find the file
% PARAMS
% filePath: the file path
% fileName: the file name
%
% RETURNS
% fileContent=text of the file
function fileContent=getFileContent(filePath,fileName)
fileID = fopen(strcat(filePath,fileName));

fileContent = textscan(fileID,'%s', 'Delimiter','\n','whitespace','');
fileContent=fileContent{1};
fclose(fileID);

fileContent=fileContent(~cellfun('isempty',fileContent));



% --- Executes on selection change in studentCode.
function studentCode_Callback(hObject, eventdata, handles)
% hObject    handle to studentCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns studentCode contents as cell array
%        contents{get(hObject,'Value')} returns selected item from studentCode


% --- Executes during object creation, after setting all properties.
function studentCode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to studentCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in infoBox.
function infoBox_Callback(hObject, eventdata, handles)
% hObject    handle to infoBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns infoBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from infoBox


% --- Executes during object creation, after setting all properties.
function infoBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to infoBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%command = 'processing-java --sketch=';
command = handles.config.processing.execute.command;
command = strcat(command,handles.data.filePath);
%command = strcat(command,handles.data.fileName);
%command = strcat(command,' ');
display(command);
command = strcat(command,handles.config.processing.execute.parameter);
display(command);
handles.infoBox.String = '';

axes(handles.studentImage);

set(handles.runButton,'enable','off');
try
    output = -1;
    h = waitbar(0,'Please wait...');
    steps = 150;
    for step = 1:steps
        if(output < 0)
            [output,error] = system(command);
        end
        waitbar(step / steps)
    end
    close(h);
    
    if(output > 0)
        display(output);
        display(error);
        handles.infoBox.String = error;
        msgbox('Check your Code', 'Error','error');
        return;
    end
    
    filePath=handles.data.filePath;
    expression = 'p(\w+)e';
    replace = 'png';
    imageName = regexprep(handles.data.fileName,expression,replace); % need to be the same name of the file...
    imagePath=strcat(filePath,imageName);
    imagePath
    studentImg = imread(imagePath);
    imshow(studentImg);
    handles.data.imageName=imageName;
    handles.data.image=studentImg;
    
%% checkAutomatic

    %originalFilePath='C:\Users\JICA2013\Documents\JICA\2016\EducationSystem\v.2.1\correctImages'; 
    %originalFilePath=handles.config.processing.correctFilePath;
    % cambiar el folder a otro lado....
    % format = '.png';
    %originalFilePath = strcat(originalFilePath,'\'); % need to be the same name of the file...
    %originalImagePath=strcat(originalFilePath,handles.currentExercise.imageName);
    %originalImg = imread(originalImagePath);
    originalImg = handles.currentExercise.image;
    handles.data.originalImage = originalImg;
    
    [mistakes,a,b,msg] = comparador(studentImg,originalImg,0,0.001);
  
    
%% Display results  
    if( isempty(a) )
        axes(handles.correctImage);
        imshow(mistakes);
        handles.infoBox.String = 'Well Done!!!!';
        handles.data.iscorrect = 1;
        axes(handles.originalImage);
        imshow(originalImg);
        set(handles.nextButton,'enable','on');
    else
        axes(handles.correctImage);
        imshow(mistakes);
        handles.data.iscorrect = 0;
        handles.infoBox.String = msg;
        %handles.infoBox.String = 'Have Some Pixels Issues. The pixels in black are OK!!!';
        axes(handles.originalImage);
        imshow(originalImg);
        msgbox('Check your Code', 'Error','error');
        
    end
    guidata(hObject, handles);
catch ex
    display('Exception!!!!');
    display(ex);
end
set(handles.runButton,'enable','on');

% --- Executes on selection change in instructionBox.
function instructionBox_Callback(hObject, eventdata, handles)
% hObject    handle to instructionBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns instructionBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from instructionBox


% --- Executes during object creation, after setting all properties.
function instructionBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to instructionBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in initialCodeButton.
function initialCodeButton_Callback(hObject, eventdata, handles)
% hObject    handle to initialCodeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fig = handles.figure1;
handles
initialCode(fig);
guidata(hObject, handles);

