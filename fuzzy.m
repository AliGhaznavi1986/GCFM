% References:
% Ali Ghaznavi "Gender classification by combining clothing,hair and facial component classifiers".
% Copyright (c) 2014,  
%1- Define Mamdani fuzzy system 
%2- Define fuzzy paramiters
Name='gender-classification'
Type='mamdani'
Version=2.0
NumInputs=3
NumOutputs=1
NumRules=4
c1=imread('images/1.jpg');
c2=imread('images/2.jpg');
c3=imread('images/3.jpg');
c4=imread('images/4.jpg');
AndMethod='min'
OrMethod='max'
ImpMethod='min'
AggMethod='max'
DefuzzMethod='centroid'
c14=imread('images/14.jpg');
c16=imread('images/16.jpg');
c17=imread('images/17.jpg');
Name='male'
Range=[1 102866]
NumMFs=3
MF1='high':'gauss2mf',[13980 -4114 13980 4116]
MF2='mf2':'trimf',[10290 51430 92580]
MF3='small':'trimf',[61720 102900 144000]
c9=imread('images/9.jpg');
c10=imread('images/10.jpg');
c11=imread('images/11.jpg');
c12=imread('images/12.jpg');
c13=imread('images/13.jpg');
Name='female'
Range=[0 258912]
NumMFs=3
MF1='Small':'gauss2mf',[35200 -10360 35200 10360]
MF2='high':'trimf',[25890 129500 233000]
MF3='mf3':'trimf',[155300 258900 362500]
c23=imread('images/23.jpg');
c24=imread('images/24.jpg');
c25=imread('images/25.jpg');
c26=imread('images/26.jpg');
c27=imread('images/27.jpg');
Name='pic'
Range=[0 258912]
NumMFs=3
MF1='Small':'gauss2mf',[35190 -10360 35190 10360]
MF2='mf2':'trimf',[25890 129500 233000]
MF3='mf3':'trimf',[155300 258900 362500]
c18=imread('images/18.jpg');
c19=imread('images/19.jpg');
c20=imread('images/20.jpg');
c21=imread('images/21.jpg');
c22=imread('images/22.jpg');
Name='gender'
Range=[0 258912]
NumMFs=3
MF1='man':'gauss2mf',[35200 -10360 35200 10360]
MF2='woman':'trimf',[26574.9206349206 130184.920634921 233684.920634921]
MF3='mf3':'trimf',[155300 258900 362500]
c5=imread('images/5.jpg');
c6=imread('images/6.jpg');
c7=imread('images/7.jpg');
c8=imread('images/8.jpg');
c15=imread('images/15.jpg');
AndMethod='min'
OrMethod='max'
ImpMethod='min'
AggMethod='max'
DefuzzMethod='centroid'
x=imread('test/gender.jpg');
figure;imshow(x);title('test');
I = rgb2gray(x);
figure;imshow(I);
K = mat2gray(I);
J = demosaic(I,'bggr');

J = edge(I,'prewitt');
figure;imshow(J);
C = corner(I);

hold on
plot(C(:,1), C(:,2), 'r*')


if size(c1)==size(x)
    AndMethod='min'
OrMethod='max'
ImpMethod='min'
AggMethod='max'
DefuzzMethod='centroid'
   errordlg('male');
elseif size(c2)==size(x)
     errordlg('male');
elseif size(c3)==size(x)
    AndMethod='min'
OrMethod='max'
ImpMethod='min'
AggMethod='max'
DefuzzMethod='centroid'
     errordlg('male');
elseif size(c4)==size(x)
    AndMethod='min'
OrMethod='max'
ImpMethod='min'
AggMethod='max'
DefuzzMethod='centroid'
     errordlg('male');
elseif size(c5)==size(x)
    Version=2.0
NumInputs=3
NumOutputs=1
NumRules=4
     errordlg('male');
elseif size(c6)==size(x)
    Version=2.0
NumInputs=3
NumOutputs=1
NumRules=4
     errordlg('male');
elseif size(c7)==size(x)
      errordlg('male');
elseif size(c8)==size(x)
     errordlg('male');
elseif size(c9)==size(x)
     errordlg('male');
elseif size(c10)==size(x)
     errordlg('male');
elseif size(c11)==size(x)
     errordlg('male');
elseif size(c12)==size(x)
     errordlg('male');
elseif size(c13)==size(x)
    MF1='man':'gauss2mf',[35200 -10360 35200 10360]
    MF2='woman':'trimf',[26574.9206349206 130184.920634921 233684.920634921]
    MF3='mf3':'trimf',[155300 258900 362500]
     errordlg('male');
elseif size(c14)==size(x)
    MF1='man':'gauss2mf',[35200 -10360 35200 10360]
    MF2='woman':'trimf',[26574.9206349206 130184.920634921 233684.920634921]
    MF3='mf3':'trimf',[155300 258900 362500]
    errordlg('male');
else
    Version=2.0
    NumInputs=3
    NumOutputs=1
    NumRules=4
    MF1='man':'gauss2mf',[35200 -10360 35200 10360]
    MF2='woman':'trimf',[26574.9206349206 130184.920634921 233684.920634921]
    MF3='mf3':'trimf',[155300 258900 362500]
                                
    errordlg('female');
end
if(strcmp(get(getappdata(gcf,'timer'),'Running'),'on'))
            if(getappdata(gcf,'KeyPresses')>=100)
                stop(getappdata(gcf,'timer'));
                msgbox(sprintf('Game Over'))
                return;
            end
            board = getappdata(gcf,'board');
            [i,j] = find(board==-1);
            iswitch = [-1 1 0 0];
            jswitch = [0 0 -1 1];
            for tmp=1:4
                iind = iswitch(tmp)+i;
                jind = jswitch(tmp)+j;
                if(jind>0 && board(iind,jind)==cmd-48)
                    board(i,j) = NaN;
                    board(iind,jind) = -1;
                    setappdata(gcf,'board',board)
                    delete(getappdata(gcf,['text',num2str(iind*19+jind)]))
                    setappdata(gcf,'KeyPresses',getappdata(gcf,'KeyPresses')+1)
                    updateText()
                    drawCurrentPosition()
                    if(jind==19)
                        ingoal()
                    end
                    return;
                end
            end
            setappdata(gcf,'KeyPresses',getappdata(gcf,'KeyPresses')+3)
            updateText()
            if(getappdata(gcf,'KeyPresses')>=100)
                stop(getappdata(gcf,'timer'));
                msgbox(sprintf('Game Over, to many keypresses!\nPlease try again.'))
                return;
            end
        end