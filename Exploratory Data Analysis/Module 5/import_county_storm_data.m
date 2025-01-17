function data = import_county_storm_data(filename, dataLines)
%IMPORTFILE Import data from a text file
%  STORMEVENTS2017FINALPROJECT = IMPORTFILE(FILENAME) reads data from
%  text file FILENAME for the default selection.  Returns the data as a
%  table.
%
%  STORMEVENTS2017FINALPROJECT = IMPORTFILE(FILE, DATALINES) reads data
%  for the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  StormEvents2017finalProject = importfile("C:\Users\kv220\Desktop\MATLAB  Specialization\Exploratory Data Analysis\StormEvents\StormEvents_2017_finalProject.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 31-Mar-2020 15:45:45

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 24);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "State", "Var4", "Month", "Event_Type", "CZ_Name", "Begin_Date_Time", "Var9", "End_Date_Time", "Var11", "Var12", "Var13", "Var14", "Var15", "Property_Cost", "Var17", "Crop_Cost", "Begin_Lat", "Begin_Lon", "End_Lat", "End_Lon", "Var23", "Event_Narrative"];
opts.SelectedVariableNames = ["State", "Month", "Event_Type", "CZ_Name", "Begin_Date_Time", "End_Date_Time", "Property_Cost", "Crop_Cost", "Begin_Lat", "Begin_Lon", "End_Lat", "End_Lon", "Event_Narrative"];
opts.VariableTypes = ["string", "string", "categorical", "string", "categorical", "categorical", "categorical", "datetime", "string", "datetime", "string", "string", "string", "string", "string", "double", "string", "double", "double", "double", "double", "double", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var4", "Var9", "Var11", "Var12", "Var13", "Var14", "Var15", "Var17", "Var23", "Event_Narrative"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "State", "Var4", "Month", "Event_Type", "CZ_Name", "Var9", "Var11", "Var12", "Var13", "Var14", "Var15", "Var17", "Var23", "Event_Narrative"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "Begin_Date_Time", "InputFormat", "yyyy-MM-dd HH:mm:ss");
opts = setvaropts(opts, "End_Date_Time", "InputFormat", "yyyy-MM-dd HH:mm:ss");

% Import the data
data = readtable(filename, opts);

end