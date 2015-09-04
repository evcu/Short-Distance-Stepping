function i=getdefValue(rowNo,columnNo)
%1.row: stance
%2.row: charBias
%3.row: features
def_value_matrix=[ 0.125 10 0.14 10 nan nan;0.50 1 0 0.88 nan nan;0 0.01 60 0.2 1 0];
i=def_value_matrix(rowNo,columnNo);
end