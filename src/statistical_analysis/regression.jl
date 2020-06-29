function varargout = regression(varargin)
#  REGRESSION MATLAB code for regression.fig
#       REGRESSION, by itself, creates a new REGRESSION or raises the existing
#       singleton*.
#
#       H = REGRESSION returns the handle to a new REGRESSION or the handle to
#       the existing singleton*.
#
#       REGRESSION('CALLBACK',hObject,eventData,handles,...) calls the local
#       function named CALLBACK in REGRESSION.M with the given input arguments.
#
#       REGRESSION('Property','Value',...) creates a new REGRESSION or raises the
#       existing singleton*.  Starting from the left, property value pairs are
#       applied to the GUI before regression_OpeningFcn gets called.  An
#       unrecognized property name or invalid value makes property application
#       stop.  All inputs are passed to regression_OpeningFcn via varargin.
#
#       *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
#       instance to run (singleton)".
#
#  See also: GUIDE, GUIDATA, GUIHANDLES

#  Edit the above text to modify the response to help regression

#  Last Modified by GUIDE v2.5 17-Apr-2013 12:46:04

#  Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @regression_OpeningFcn, ...
                   'gui_OutputFcn',  @regression_OutputFcn, ...
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


#  --- Executes just before regression is made visible.
function regression_OpeningFcn(hObject, ~, handles, varargin)
#  This function has no output args, see OutputFcn.
#  hObject    handle to figure
#  eventdata  reserved - to be defined in a future version of MATLAB
#  handles    structure with handles and user data (see GUIDATA)
#  varargin   command line arguments to regression (see VARARGIN)

#  Choose default command line output for regression
handles.output = hObject;

#  Update handles structure
guidata(hObject, handles);

#  UIWAIT makes regression wait for user response (see UIRESUME)
#  uiwait(handles.figure1);

# File: regression.jl
# Perform a linear regression
# Author:
# Date: 29-June-2020

# import XL data
[~,~,returns] = getXLData('hfma_matlab_data.xlsx','LS Index & S&P 500');
# S&P 500 (# )
x = returns(:,2);
# Long-Short Index (# )
y = returns(:,1);

# requested statistics
list = {'beta','adjrsquare','rsquare','tstat'};
# perform regression
stats = regstats(y,x,'linear',list);

# output statistics
cfs = stats.beta; # regression coefficients   β  \beta
arsq = stats.adjrsquare; # adjusted R square
rsq = stats.rsquare; # R square
t = stats.tstat.t; # t-statistic
pv = stats.tstat.pval; # p-value

# other statistics
se = cfs./t; # standard error
correl = corr(x,y); # correlation

# OUTPUT
# format data 1
data1 = num2cell([correl;arsq;rsq]);
    for i = 1:numel(data1)
            data1{i} = sprintf('# 12.4f',data1{i});
    end
# set column headings
headings1 = {'Correlation','adjusted R2','R2'};
# set table output
set(handles.table_regression_results_1,'ColumnName','','RowName',headings1,'Data',data1);
# format data 2
data2 = num2cell([cfs,se,t,pv]);
    for i = 1:numel(data2)
        data2{i} = sprintf('# 12.4f',data2{i});
    end
# set size column widths
cwidth = num2cell(repmat(70,1,10));
# set column headings
headings2 = {'Coefficients','SE','t-statistic','p-Value'};
# set table output
set(handles.table_regression_results_2,'ColumnName',headings2,'ColumnWidth',cwidth,'RowName',{'Intercept (a)','Slope (b) [S&P500]'},'Data',data2);

# plot linear regression
p = polyfit(x,y,1);
f = polyval(p,x);

figure()
plot(x,y,'.');
hold on
# linear fit
plot(x,f,'-r');
xlabel('S&P500 (# )');
ylabel('Long-Short Index (# )');
# add linear equation & R-squared
text(-1,-5,['y= ',num2str(cfs(2)),'x + ',num2str(cfs(1)),',  R^2= ',num2str(rsq)]);

#  --- Outputs from this function are returned to the command line.
function varargout = regression_OutputFcn(~, ~, handles)
#  varargout  cell array for returning output args (see VARARGOUT);
#  hObject    handle to figure
#  eventdata  reserved - to be defined in a future version of MATLAB
#  handles    structure with handles and user data (see GUIDATA)

#  Get default command line output from handles structure
varargout{1} = handles.output;
