var     f:text;
        x,y,i,j,c,code,r:longint;
        kt:boolean;
        st:string;
        o:char;
function checkmore(u:longint):boolean;
var     i:longint;
begin
        if u=1 then
                exit(false);
        for i:=2 to trunc(sqrt(u)) do
        begin
                if u mod i=0 then
                        exit(false);
        end;
        exit(true);
end;
function check(t:longint):boolean;
var     st:string;
        code,c,i,r:longint;
        ktmore:boolean;
        o:char;
begin
        str(t,st);
        r:=length(st);
        for i:=1 to r div 2 do
        begin
                o:=st[i];
                st[i]:=st[r-i+1];
                st[r-i+1]:=o;
        end;
        val(st,c,code);
        ktmore:=checkmore(c);
        if ktmore=true then
                exit(true)
        else
                exit(false);
end;
procedure sinh_input;
begin
        assign(f,'BAI(II).inp');
        rewrite(f);
                randomize;
                writeln(f,1+random(9998),' ',1+random(9998));
        close(f);
end;
begin
        assign(f,'BAI(II).inp');
        reset(f);
                readln(f,x,y);
        close(f);
        assign(f,'BAI(II).out');
        rewrite(f);
        for i:=x to y do
        begin
                kt:=check(i);
                if kt=true then
                        writeln(f,i);
        end;
        close(f);
end.
