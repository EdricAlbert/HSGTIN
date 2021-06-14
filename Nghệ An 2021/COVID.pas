var     f:text;
        i,d,x,r,n,j,o,p:longint;
        a:array[1..10000] of longint;
procedure sort(l,r:longint);
var     x,i,o,j:longint;
begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2];
        repeat
                while a[i]<x do
                        inc(i);
                while a[j]>x do
                        dec(j);
                if i<=j then
                begin
                        o:=a[i];
                        a[i]:=a[j];
                        a[j]:=o;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if l<j then
                sort(l,j);
        if i<r then
                sort(i,r);
end;
function check(l,r,x:longint):longint;
var     y:longint;
begin
        repeat
                y:=(l+r) div 2;
                if a[y]=(4-x) then
                        exit(y);
                if a[y]>(4-x) then
                        r:=y-1
                else
                        l:=y+1;
        until l>r;
        exit(0);
end;
procedure sinh_input;
var     n,i:longint;
begin
        assign(f,'COVID.inp');
        rewrite(f);
        randomize;
                n:=1+random(10);
                writeln(f,n);
                for i:=1 to n do
                        write(f,1+random(3),' ');
        close(f);
end;
begin
        assign(f,'COVID.inp');
        reset(f);
                readln(f,n);
                for i:=1 to n do
                        read(f,a[i]);
        close(f);
        assign(f,'COVID.out');
        rewrite(f);
        sort(1,n);
        r:=a[1];
        for i:=1 to n do
        begin
                x:=check(i+1,n-o,r);
                if i>(n-o) then
                        break;
                if (x<>0) and ((r-4)<>0) then
                begin
                        for j:=x to n-1 do
                                a[j]:=a[j+1];
                        inc(o);
                        inc(d);
                        r:=a[i+1];
                end
                else
                if (r+a[i+1]<=4) and (i<n) then
                        r:=r+a[i+1]
                else
                if (r<>0) then
                begin
                        inc(d);
                        r:=a[i+1];
                end
                else
                        r:=a[i+1];
        end;
        writeln(f,d);
        close(f);
end.
