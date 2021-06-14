var     f,f1:text;
        x,n,i,j,r,d:longint;
begin
        assign(f,'RGC.inp');
        reset(f);
        assign(f1,'RGC.out');
        rewrite(f1);
                readln(f,n);
                for i:=1 to n do
                begin
                        readln(f,x);
                        if x=1 then
                                writeln(f,'1 1');
                        if x<>1 then
                        begin
                                j:=trunc(sqrt(x));
                                d:=0;
                                while d<>2 do
                                begin
                                        d:=0;
                                        if j<2 then
                                        begin
                                                writeln(f1,1,' ',x);
                                                break;
                                        end;
                                        r:=x;
                                        while r mod j=0 do
                                        begin
                                                inc(d);
                                                r:=r div j;
                                        end;
                                        if d>=2 then
                                        begin
                                                writeln(f1,j,' ',(x div (j*j)));
                                                break;
                                        end;
                                        dec(j);
                                end;
                        end;
                end;
        close(f);
        close(f1);
end.
