type    doan = record
        gt,pos:longint;
end;
var     f:text;
        i,j,max,n,p,v1,v2,mid,l,r,kq,x:longint;
        a,maxdau:array[1..1000000] of longint;
        b,c:array[1..1000000] of doan;
procedure sort(l,r:longint);
var     mid,i,j:longint;
        o:doan;
begin
        i:=l;
        j:=r;
        mid:=b[(l+r) div 2].gt;
        repeat
                while b[i].gt<mid do
                        inc(i);
                while b[j].gt>mid do
                        dec(j);
                if i<=j then
                begin
                        o:=b[i];
                        b[i]:=b[j];
                        b[j]:=o;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if l<j then
                sort(l,j);
        if i<r then
                sort(i,r);
end;
function find(x:longint):longint;
var     l,r,mid,kq,s:longint;
begin
        l:=1;
        r:=n;
        kq:=0;
        s:=0;
        repeat
                mid:=(l+r) div 2;
                if b[mid].gt>=x then
                begin
                        kq:=b[mid].pos;
                        s:=mid;
                        r:=mid-1;
                end
                else
                        l:=mid+1;
        until l>r;
        if kq<>0 then
                exit(maxdau[s])
        else
                exit(0);
end;
procedure sinh_input;
var     n,p,i:longint;
begin
        assign(f,'MAYMAN.inp');
        rewrite(f);
        randomize;
        n:=1+random(10);
        p:=1+random(8);
        writeln(f,n,' ',p);
        for i:=1 to n do
                write(f,1+random(20),' ');
        close(f);
end;
procedure sortmore(l,r:longint);
var     i:longint;
begin
        maxdau[r]:=b[r].pos;
        for i:=r-1 downto l do
        begin
                if maxdau[i+1]<b[i].pos then
                        maxdau[i]:=b[i].pos
                else
                        maxdau[i]:=maxdau[i+1];
        end;
end;
begin
        sinh_input;
        assign(f,'MAYMAN.inp');
        reset(f);
                readln(f,n,p);
                for i:=1 to n do
                begin
                        read(f,a[i]);
                        b[i].pos:=i;
                        b[i].gt:=a[i];
                end;
        close(f);
        assign(f,'MAYMAN.out');
        rewrite(f);
        sort(1,n);
        sortmore(1,n);
        max:=0;
        c:=b;
        for i:=1 to n do
        begin
                j:=find(a[i]+p);
                if j-i > max then
                begin
                        max:=j-i;
                        v1:=i;
                        v2:=j;
                end;
        end;
        if max=0 then
                writeln(f,'0')
        else
        writeln(f,v1,' ',v2);
        close(f);
end.
