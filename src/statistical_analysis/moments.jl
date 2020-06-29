function moments(varargin)
    #  MOMENTS MATLAB code for moments.fig
    #       MOMENTS, by itself, creates a new MOMENTS or raises the existing
    #       singleton*.
    #
    #       H = MOMENTS returns the handle to a new MOMENTS or the handle to
    #       the existing singleton*.
    #
    #       MOMENTS('CALLBACK',hObject,eventData,handles,...) calls the local
    #       function named CALLBACK in MOMENTS.M with the given input arguments.
    #
    #       MOMENTS('Property','Value',...) creates a new MOMENTS or raises the
    #       existing singleton*.  Starting from the left, property value pairs are
    #       applied to the GUI before moments_OpeningFcn gets called.  An
    #       unrecognized property name or invalid value makes property application
    #       stop.  All inputs are passed to moments_OpeningFcn via varargin.
    #
    #       *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    #       instance to run (singleton)".
    #
    #  See also: GUIDE, GUIDATA, GUIHANDLES

    #  Edit the above text to modify the response to help moments

    #  Last Modified by GUIDE v2.5 12-Nov-2013 10:20:47

    #  Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @moments_OpeningFcn, ...
                       'gui_OutputFcn',  @moments_OutputFcn, ...
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

    return varargout
end
#  --- Executes just before moments is made visible.
function moments_OpeningFcn(hObject, ~, handles, varargin)
    #  This function has no output args, see OutputFcn.
    #  hObject    handle to figure
    #  eventdata  reserved - to be defined in a future version of MATLAB
    #  handles    structure with handles and user data (see GUIDATA)
    #  varargin   command line arguments to moments (see VARARGIN)

    #  Choose default command line output for moments
    handles.output = hObject;

    #  Update handles structure
    guidata(hObject, handles);

    #  UIWAIT makes moments wait for user response (see UIRESUME)
    #  uiwait(handles.figure1);

    # File: moments.jl
    # Author:
    # Date: 29-June-2020

    # import XL data
    [names,~,returns] = getXLData('hfma_matlab_data.xlsx','CTA Index');

    # if monthly returns --> reporting frequency f = 12 for annual moments
    f = 12;

    m1 = fMean(returns,f); # annual mean (# )
    m2 = fStd(returns,0,f); # annual standard deviation (# )
    m3 = fSkew(returns,0,f); # annual skew (s)
    m4 = fKurt(returns,0,f); # annual excess kurtosis (k)

    # OUTPUT
    # format data
    data = num2cell([m1,m2,m3,m4]);
        for i = 1:numel(data)
            data{i} = sprintf('# 13.3f',data{i});
        end
    # set size column widths
    cwidth = num2cell(repmat(80,1,10));
    # set column headings
    headings = {'Mean (# )|(m1)','Std. Dev. (# )|(m2)','Skew|(m3)','Kurtosis|(m4)'};
    # set table output
    set(handles.table_moments,'ColumnName',headings,'ColumnWidth',cwidth,'RowName',names,'Data',data);
    return cwidth
end

#  --- Outputs from this function are returned to the command line.
function moments_OutputFcn(~, ~, handles)
    #  varargout  cell array for returning output args (see VARARGOUT);
    #  hObject    handle to figure
    #  eventdata  reserved - to be defined in a future version of MATLAB
    #  handles    structure with handles and user data (see GUIDATA)

    #  Get default command line output from handles structure
    varargout{1} = handles.output;

    return varargout
end
