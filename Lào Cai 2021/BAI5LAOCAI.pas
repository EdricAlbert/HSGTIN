var     f:text;
        x,y,i,n,code,j:longint;
        st:string;
        o:char;
        kt:boolean;
function check1(a:longint):longint;
var     st:string;
        code,kq,i:longint;
        o:char;
begin
        str(a,st);
        for i:=1 to length(st) div 2 do
        begin
                o:=st[i];
                st[i]:=st[length(st)-i+1];
                st[length(st)-i+1]:=o;
        end;
        val(st,kq,code);
        exit(kq+2);
end;
function check2(b:longint):longint;
var     i:longint;
        kt:boolean;
begin
        i:=b+1;
        kt:=false;
        while kt=false do
        begin
                if (i mod 2=1) and (i mod 5<>0) then
                        exit(i)
                else
                        inc(i);
        end;
end;
begin
        assign(f,'BAI5LAOCAI.inp');
        reset(f);
                readln(f,n);
        close(f);
        assign(f,'BAI5LAOCAI.out');
        rewrite(f);
        x:=1;
        y:=1;
        for i:=2 to n do
        begin
                x:=check1(x);
                y:=check2(y);
        end;
        writeln(f,x);
        writeln(f,y);
        close(f);
end.