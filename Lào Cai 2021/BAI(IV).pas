var     f:text;
        i,kq1,kq2,n:longint;
        st,s:string;
        a:array[0..1000] of string;
        kt:boolean;
procedure sort(l,r:longint);
var     i,j:longint;
        x,o:string;
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
function check(st:string):boolean;
var     l,r,mid:longint;
begin
        l:=1;
        r:=n;
        repeat
                mid:=(l+r) div 2;
                if a[mid]=st then
                begin
                        if (a[mid+1]=a[mid]) or (a[mid-1]=a[mid]) then
                                exit(false)
                        else
                                exit(true);
                end;
                if a[mid]<st then
                        l:=mid+1
                else
                        r:=mid-1;
        until l>r;
end;
function checkmore(st:string):boolean;
var     i:longint;
begin
        for i:=1 to length(st) div 2 do
        begin
                if st[i]<>st[length(st)-i+1] then
                        exit(false);
        end;
        exit(true);
end;
begin
        assign(f,'BAI(IV).inp');
        reset(f);
                readln(f,st);
        close(f);
        assign(f,'BAI(IV).out');
        rewrite(f);
        for i:=1 to length(st) do
        begin
                if (st[i]=' ') or (i=length(st)) then
                begin
                                if i=length(st) then
                                        s:=s+st[i];
                                inc(n);
                                a[n]:=s;
                                s:='';
                end
                else
                        s:=s+st[i];
        end;
        sort(1,n);
        for i:=1 to n do
        begin
                kt:=check(a[i]);
                if kt=true then
                        inc(kq1);
                kt:=checkmore(a[i]);
                if kt=true then
                        inc(kq2);
        end;
        writeln(f,kq1);
        writeln(f,kq2);
        close(f);
end.

