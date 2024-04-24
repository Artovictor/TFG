function wtd = wt_root


wtd=which('setWTToolBoxPath');
% The minus 2, i.e. -2, is to remove the ".m" of the which output
i=max(findstr(lower(wtd),'setwttoolboxpath'))-2;
if i>0
  wtd=wtd(1:i);
else
  error('Cannot locate wt_root.m. You must add the path to the WT Toolbox')
end
