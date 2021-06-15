var     f:text;
        i,n,x:longint;
        a:array[1..100000] of int64;
        max:int64;
function check(b:longint):longint;
var     l,r,mid,kq:longint;
begin
        l:=1;
        r:=n;
        repeat
                mid:=(l+r) div 2;
                if a[mid]>=b then
                begin
                        kq:=mid;
                        r:=mid-1;
                end
                else
                        l:=mid+1;
        until l>r;
        exit(kq);
end;
procedure sort(l,r:longint);
var     i,j:longint;
        x,o:int64;
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
begin
        assign(f,'BAI(III).inp');
        reset(f);
                readln(f,n);
                for i:=1 to n do
                begin
                        read(f,a[i]);
                        if a[i]>max then
                                max:=a[i];
                end;
        close(f);
        assign(f,'BAI(III).out');
        rewrite(f);
        sort(1,n);
        for i:=max downto 1 do
        begin
                x:=check(i);
                if i<=(n-x+1) then
                begin
                        writeln(f,i);
                        break;
                end;
        end;
        close(f);
end.


