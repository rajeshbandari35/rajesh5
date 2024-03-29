function PVDATASCEXTRCT(inputimgsrc,outputtxtsrc)
tic;
msg=[];
%flag=0;

disp('Starting Extraction Process...');

try
    a=imread(inputimgsrc);
catch
    disp('Unable to access input image file');
    disp('Execution not successful');
    fclose('all');
    exit;
end
[r,c]=size(a);

j=1;
length=5*7; 

%                    Extraction Process
disp('Extracting...');
for x=0:1:r-1
    for y=0:2:c-1
        
        g=a(1+x,1+y:2+y);
        g=double(g);
        differ=g(1,2)-g(1,1);
        lk=[0 8 16 32 64 128];
        uk=[7 15 31 63 127 255 ];
        
        differ=abs(differ);          
            for i=1:1:6     
                if (differ>=lk(i) && differ<=uk(i))
                    w=uk(i)-lk(i)+1;                
                    t=log2(w);
                    s=ceil(log2(t^2));                    
                    b=mod(g(1,1),2^s);
                   k=dec2bin(b,s);
                    msg=[msg k];
                    j=j+t;
                    

                  if(j>=32)
                     length=bin2dec(char(msg(1:32)))+5;  
                       length=length*7;

                  end
                       
                    if(j>=length)
                       j=1;

                        for i=32:7:length-7
                            finaltxt(j)=bin2dec(char(msg(1+i:7+i)));
                           j=j+1;
                        end
                        

                        try
                           
                            fid=fopen(outputtxtsrc,'w');
                            fwrite(fid,finaltxt);
                           
                        catch
                            disp('Unable to write into output text file');
                            disp('Execution Unsuccessful...Exiting');
                            fclose('all');
                            exit;
                         end 
                        fclose('all');
                        disp('Success');
                        toc;
                        return;
                 end
                end
            end
        end
 end
%disp(finaltxt);
end

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         