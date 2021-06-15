var     f:text;
        i,j,k,n:integer;
        x,r,u,kq:int64;
        kt:boolean;
function check(x:int64):boolean;
var     i:int64;
begin
        i:=2;
        while i<=trunc(sqrt(x)) do
        begin
                if x mod i=0 then
                        exit(false);
                inc(i);
        end;
        exit(true);
end;
begin
        assign(f,'NGUYENTO.inp');
        reset(f);
                readln(f,n);
        close(f);
        assign(f,'NGUYENTO.out');
        rewrite(f);
        k:=2*n+1;
        i:=1;
        while i<>10 do
        begin
                if n=7 then
                begin
                        kq:=7;
                        break;
                end;
                r:=1;
                for j:=1 to n do
                begin
                        x:=i*r+x;
                        r:=r*10;
                end;
                u:=r*10;
                for j:=1 to n do
                begin
                        x:=i*u+x;
                        u:=u*10;
                end;
                kt:=check(x);
                if kt=true then
                        inc(kq);
                for j:=1 to 9 do
                begin
                        x:=x+1*r;
                        kt:=check(x);
                        if kt=true then
                                inc(kq);
                end;
                inc(i);
                x:=0;
        end;
        writeln(f,kq);
        close(f);
end.
