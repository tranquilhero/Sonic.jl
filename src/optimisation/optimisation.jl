function varargout = optimisation(varargin)
#  OPTIMISATION MATLAB code for optimisation.fig
#       OPTIMISATION, by itself, creates a new OPTIMISATION or raises the existing
#       singleton*.
# 
#       H = OPTIMISATION returns the handle to a new OPTIMISATION or the handle to
#       the existing singleton*.
# 
#       OPTIMISATION('CALLBACK',hObject,eventData,handles,...) calls the local
#       function named CALLBACK in OPTIMISATION.M with the given input arguments.
# 
#       OPTIMISATION('Property','Value',...) creates a new OPTIMISATION or raises the
#       existing singleton*.  Starting from the left, property value pairs are
#       applied to the GUI before optimisation_OpeningFcn gets called.  An
#       unrecognized property name or invalid value makes property application
#       stop.  All inputs are passed to optimisation_OpeningFcn via varargin.
# 
#       *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
#       instance to run (singleton)".
# 
#  See also: GUIDE, GUIDATA, GUIHANDLES

#  Edit the above text to modify the response to help optimisation

#  Last Modified by GUIDE v2.5 13-Nov-2013 10:44:25

#  Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @optimisation_OpeningFcn, ...
                   'gui_OutputFcn',  @optimisation_OutputFcn, ...
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


#  --- Executes just before optimisation is made visible.
function optimisation_OpeningFcn(hObject, ~, handles, varargin)
#  This function has no output args, see OutputFcn.
#  hObject    handle to figure
#  eventdata  reserved - to be defined in a future version of MATLAB
#  handles    structure with handles and user data (see GUIDATA)
#  varargin   command line arguments to optimisation (see VARARGIN)

#  Choose default command line output for optimisation
handles.output = hObject;

#  Update handles structure
guidata(hObject, handles);

#  UIWAIT makes optimisation wait for user response (see UIRESUME)
#  uiwait(handles.figure1);

# File: optimisation.jl
# Author:  
# Date: 29-Jan-2014

# import XL data
[names,~,returns] = getXLData('hfma_matlab_data.xlsx','10 Hedge Funds');

# parameters
N = size(returns,2); # size of portfolio (N)
R = fMean(returns,12)'; # annual returns (R)
W0 = repmat(1/N,N,1); # initial weights (W0) 

covar = cov(returns); # covariance matrix
# annualise variance for monthly returns
for i=1:N
    for j=1:N
        if i == j     
            covar(i,j)=covar(i,j)*12;
        end
    end
end
# VCV matrix
VCV = covar;

# annual portfolio statistics
pR = W0'*R; # return
pVar  = W0'*VCV*W0; # variance

# target return, linear contstraints and bounds
rstar = 9.00; # target return
Aeq = [R';ones(1,N)];
beq = [rstar;1];
lb = zeros(N,1); 
ub = ones(N,1)*0.5;

# minimum variance optimisation
options = optimset('LargeScale', 'off', 'Algorithm','sqp');
[W,fval,ExitFlag] = fmincon(@(W) minVar(W,VCV),W0,[],[],Aeq,beq,lb,ub,[],options); # calls minVar.jl
    disp('Minimum Variance');
    if (ExitFlag ~= 1)
        disp('Optimization did not converge!');
    else
        disp('Optimization converged'); 
    end
    
# PLOT
# weights bar chart

    
# OUTPUT
# format data
R = num2cell(R);
    for i = 1:numel(R)
        R{i} = sprintf('# 12.3f',R{i});
    end
# set table data
set(handles.table_mean_returns,'ColumnName','Annual|Returns|(# )','RowName',names,'Data',R);
# format data
W0 = num2cell(W0);
    for i = 1:numel(W0)
        W0{i} = sprintf('# 12.2f',W0{i});
    end
set(handles.table_initial_weights,'ColumnName','Initial|Weights|(W0)','RowName',names,'Data',W0);

# format data
pStats = [pR;pVar];
pStats = num2cell(pStats);
    for i = 1:numel(pStats)
        pStats{i} = sprintf('# 10.3f',pStats{i});
    end
# set table data
set(handles.table_portfolio_statistics,'ColumnName','Annual|(# )','RowName',{'Port. Mean','Port. Variance'},'Data',pStats);
# format data
VCV = num2cell(VCV);
    for i = 1:numel(VCV)
        VCV{i} = sprintf('# 8.3f',VCV{i});
    end
# set size column widths
cwidth = num2cell(repmat(50,1,10));
# set table output
set(handles.table_VCV_matrix,'ColumnName',names,'ColumnWidth',cwidth,'RowName',names,'Data',VCV); 

# format data
W = num2cell(W);
    for i = 1:numel(W)
        W{i} = sprintf('# 12.3f',W{i});
    end
set(handles.table_optimised_weights,'ColumnName','Optimised|Weights|(W)','RowName',names,'Data',W);

# format data
fval = num2cell(fval);
    for i = 1:numel(fval)
        fval{i} = sprintf('# 10.3f',fval{i});
    end
# set table data
set(handles.table_optimised_results,'ColumnName','Minimised|(# )','RowName','Port. Variance','Data',fval);


#  --- Outputs from this function are returned to the command line.
function varargout = optimisation_OutputFcn(~, ~, handles) 
#  varargout  cell array for returning output args (see VARARGOUT);
#  hObject    handle to figure
#  eventdata  reserved - to be defined in a future version of MATLAB
#  handles    structure with handles and user data (see GUIDATA)

#  Get default command line output from handles structure
varargout{1} = handles.output;
