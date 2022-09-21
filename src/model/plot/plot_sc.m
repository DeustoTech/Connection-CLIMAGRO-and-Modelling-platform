clear 

fp = folderpath;

fp_data = fullfile(fp,'src','model','data');

r = what(fp_data);
%%
full_data = [];
for imat = r.mat'
   load(imat{:})
   full_data = [full_data data];
end

%%
t = epo2date(vertcat(full_data.t));
Temp = vertcat(full_data.Temp) - 273.15;
EC   = vertcat(full_data.EC);
Tw   = vertcat(full_data.Tw) - 273.15;
%TwSOFC   = vertcat(full_data.TwSOFC) - 273.15
IC   = vertcat(full_data.IC);
%QS = vertcat(full_data.Q_SOFC);
figure(1)
clf
%
subplot(4,1,1)
hold on
plot(t,Temp,'.-')
%plot(t,EC(:,1)-273.15,'.-')
legend('Tc','Ti','Tf','Ts','Te')

subplot(4,1,2)
hold on
plot(t,Tw,'--')
%plot(t,TwSOFC,'.')
plot(t,[full_data.T_ida]-273.15)
plot(t,Temp(:,2),'.-')
plot(t,EC(:,1)-273.15,'.-')

legend('Tw_{GH}','Tw_{ida}','T_i','Te')
subplot(4,1,3)

Carbon = vertcat(full_data.Carbon);

plot(t,Carbon,'.-')
legend('Buff','Fruit','Leaf','Stem')

subplot(4,1,4)
plot(t,[full_data.flow],'.-')
%%
figure(2)
clf 
hold on
plot(t,Temp(:,2),'.-')
plot(t,EC(:,1)-273.15,'.-')
plot(t,Tw,'.-')
plot(t,[full_data.T_ida]-273.15)

title('flow')
legend('Ti','Te','Tretorno','Tida')



%%
IC_st = parseIndoorClimate_matrix(IC);
