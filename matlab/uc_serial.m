%clear all;
close all;

s = serial('COM3');
set(s, 'InputBufferSize', 100);
set(s, 'FlowControl', 'hardware');
set(s, 'BaudRate', 9600);
set(s, 'Parity', 'none');
set(s, 'DataBits', 8);
set(s, 'StopBit', 1);
set(s, 'Timeout', 10);

disp(get(s, 'Name'));

prop(1) = (get(s, 'BaudRate'));
prop(2) = (get(s, 'DataBits'));
prop(3) = (get(s, 'StopBit'));
prop(4) = (get(s, 'InputBufferSize'));

disp(['Port Setup Done!!', num2str(prop)]);

fopen(s);

t = 1;

disp('Running');

x = 0;

while(t < 100)
    a = fread(s);
    a = max(a);

    x = [x a];

    plot(x);
    axis auto;
    grid on;
    title('Leitura Serial');
    xlabel('Tempo em (s)');
    ylabel('Leitura');
    h.XDataSource = 'x';
    h.YDataSource = 'y';
    grid on;
    ylim([0 300]);
    disp([num2str(t), 'th iteration max=',num2str(a)]);
    hold on;
    t = t+1;
    a = 0;
    drawnow;
end

fclose(s);