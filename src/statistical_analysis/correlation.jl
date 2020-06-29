function varargout = correlation(varargin)
#  CORRELATION MATLAB code for correlation.fig
#       CORRELATION, by itself, creates a new CORRELATION or raises the existing
#       singleton*.
#
#       H = CORRELATION returns the handle to a new CORRELATION or the handle to
#       the existing singleton*.
#
#       CORRELATION('CALLBACK',hObject,eventData,handles,...) calls the local
#       function named CALLBACK in CORRELATION.M with the given input arguments.
#
#       CORRELATION('Property','Value',...) creates a new CORRELATION or raises the
#       existing singleton*.  Starting from the left, property value pairs are
#       applied to the GUI before correlation_OpeningFcn gets called.  An
#       unrecognized property name or invalid value makes property application
#       stop.  All inputs are passed to correlation_OpeningFcn via varargin.
#
#       *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
#       instance to run (singleton)".
#
#  See also: GUIDE, GUIDATA, GUIHANDLES

#  Edit the above text to modify the response to help correlation

#  Last Modified by GUIDE v2.5 11-Nov-2013 16:38:24

#  Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @correlation_OpeningFcn, ...
                   'gui_OutputFcn',  @correlation_OutputFcn, ...
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
#  End initialization code - DO NOT EDIT


#  --- Executes just before correlation is made visible.
function correlation_OpeningFcn(hObject, ~, handles, varargin)
#  This function has no output args, see OutputFcn.
#  hObject    handle to figure
#  eventdata  reserved - to be defined in a future version of MATLAB
#  handles    structure with handles and user data (see GUIDATA)
#  varargin   command line arguments to correlation (see VARARGIN)

#  Choose default command line output for correlation
handles.output = hObject;

#  Update handles structure
guidata(hObject, handles);

#  UIWAIT makes correlation wait for user response (see UIRESUME)
#  uiwait(handles.figure1);

# File: correlation.jl
# Author:
# Date: 29-June-2020

# import XL data
[names,~,returns] = getXLData('hfma_matlab_data.xlsx','10 Hedge Funds');
# calculate correlation matrix
correl = corr(returns);
# format data
data = num2cell(correl);
    for i = 1:numel(data)
        data{i} = sprintf('# 8.3f',data{i});
    end
# set size column widths
cwidth = num2cell(repmat(50,1,10));
# set table output
set(handles.table_correlation_matrix,'ColumnName',names,'ColumnWidth',cwidth,'RowName',names,'Data',data);

#  --- Outputs from this function are returned to the command line.
function varargout = correlation_OutputFcn(~, ~, handles)
#  varargout  cell array for returning output args (see VARARGOUT);
#  hObject    handle to figure
#  eventdata  reserved - to be defined in a future version of MATLAB
#  handles    structure with handles and user data (see GUIDATA)

#  Get default command line output from handles structure
varargout{1} = handles.output;
