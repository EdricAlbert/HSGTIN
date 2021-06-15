var     f:text;
        x:real;
        kt:boolean;
        a,b,n,y,i,maxr,kq:qword;
procedure sinh_input;
var     n:longint;
begin
        randomize;
        assign(f,'DIENTICH.inp');
        rewrite(f);
                writeln(f,1+random(99999999));
        close(f);
end;
begin
        sinh_input;
        kt:=false;
        assign(f,'DIENTICH.inp');
        reset(f);
                readln(f,n);
        close(f);
        assign(f,'DIENTICH.out');
        rewrite(f);
        i:=n-1;
        kq:=0;
        while i<>((n div 2)-1) do
        begin
                a:=n*n;
                b:=i*i;
                x:=sqrt(a-b);
                y:=trunc(x);
                if x-y=0 then
                begin
                        maxr:=y*i;
                        if maxr>kq then
                                kq:=y*i;
                        kt:=true;
                end;
                dec(i);
        end;
        if kt=false then
                writeln(f,'0')
        else
                writeln(f,kq);
        close(f);
end.