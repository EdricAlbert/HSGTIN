var     f:text;
        d,i,j,r,kq,n:longint;
        a,p:array[1..32000] of int64;
        x:int64;
procedure sang;
var     i,j:longint;
begin
        for i:=2 to trunc(sqrt(n)) do
        begin
                if p[i]=0 then
                begin
                        inc(d);
                        a[d]:=i;
                        j:=i*i;
                        while j<=trunc(sqrt(n)) do
                        begin
                                p[j]:=1;
                                j:=j+i;
                        end;
                end;
        end;
end;
begin
        assign(f,'PRIME.inp');
        reset(f);
                readln(f,n);
        close(f);
        assign(f,'PRIME.out');
        rewrite(f);
        sang;
        for i:=1 to d do
        begin
                x:=a[i]*a[i];
                if a[i]<n then
                        inc(kq)
                else
                        break;
        end;
        writeln(f,kq);
        close(f);
end.