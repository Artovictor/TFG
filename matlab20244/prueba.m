
b    = iea15MWBlade;
ns   = length(b.r);
tb   = zeros(ns,1);
data = getIEA15MWBladeGeometryFromExcelFile;
for i = 1:ns
tb(i) = b.airfoil{i}.ndtmax*100;
end
figure
plot(data(:,1),data(:,8)); hold on;
plot(data(:,1),tb); hold on;
xlabel('$x$[--]');
ylabel('$t/c$[--]');

id_af = strings(ns,1);
for i = 1:ns
id_af{i} = b.airfoil{i}.id;
end

for i = 1:length(b.layout.airfoili)
    if i==1
        sum(id_af=="cylinder")
    else
        sum(id_af==func2str(b.layout.airfoili{i}))
    end
end
