function jarquebera(varargin)
    #  JARQUEBERA MATLAB code for jarquebera.fig
    #       JARQUEBERA, by itself, creates a new JARQUEBERA or raises the existing
    #       singleton*.
    #
    #       H = JARQUEBERA returns the handle to a new JARQUEBERA or the handle to
    #       the existing singleton*.
    #
    #       JARQUEBERA('CALLBACK',hObject,eventData,handles,...) calls the local
    #       function named CALLBACK in JARQUEBERA.M with the given input arguments.
    #
    #       JARQUEBERA('Property','Value',...) creates a new JARQUEBERA or raises the
    #       existing singleton*.  Starting from the left, property value pairs are
    #       applied to the GUI before jarquebera_OpeningFcn gets called.  An
    #       unrecognized property name or invalid value makes property application
    #       stop.  All inputs are passed to jarquebera_OpeningFcn via varargin.
    #
    #       *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    #       instance to run (singleton)".
    #
    #  See also: GUIDE, GUIDATA, GUIHANDLES

    #  Edit the above text to modify the response to help jarquebera

    #  Last Modified by GUIDE v2.5 12-Nov-2013 14:15:13

    #  Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @jarquebera_OpeningFcn, ...
                       'gui_OutputFcn',  @jarquebera_OutputFcn, ...
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

#  --- Executes just before jarquebera is made visible.
function jarquebera_OpeningFcn(hObject, ~, handles, varargin)
    #  This function has no output args, see OutputFcn.
    #  hObject    handle to figure
    #  eventdata  reserved - to be defined in a future version of MATLAB
    #  handles    structure with handles and user data (see GUIDATA)
    #  varargin   command line arguments to jarquebera (see VARARGIN)

    #  Choose default command line output for jarquebera
    handles.output = hObject;

    #  Update handles structure
    guidata(hObject, handles);

    #  UIWAIT makes jarquebera wait for user response (see UIRESUME)
    #  uiwait(handles.figure1);
    # JARQUE-BERA test for normality
    # Author:
    # Date: 29-June-2020

    # import XL data
    returns = getXLData('hfma_matlab_data.xlsx','CTA Index');

    sig = 0.95; # significance level (95# )
    dof = 2; # degrees of freedom
    [jb,critval,pval] = fJBTest(returns,sig,dof); # get Jarque-Bera test statistics

    # OUTPUT
    # format data
    data = num2cell([jb;sig*100;dof;critval;pval]);
    for i = 1:numel(data)
            data{i} = sprintf('# 12.4f',data{i});
    end
    # set column headings
    headings = {'Jarque-Bera Value','Sig. Level','Degrees of Freedom','Critical Value','p-Value'};
    # set table output
    set(handles.table_jarque_bera_test,'ColumnName','','RowName',headings,'Data',data);

end

#  --- Outputs from this function are returned to the command line.
function jarquebera_OutputFcn(~, ~, handles)
    #  varargout  cell array for returning output args (see VARARGOUT);
    #  hObject    handle to figure
    #  eventdata  reserved - to be defined in a future version of MATLAB
    #  handles    structure with handles and user data (see GUIDATA)

    #  Get default command line output from handles structure
    varargout{1} = handles.output;
    return varargout
end
