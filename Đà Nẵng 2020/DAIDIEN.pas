var     f:text;
        s,p,st:string;
        i,kq,vitri:integer;
        kt:boolean;
        v:ansistring;
function check(st:string):boolean;
var     i:integer;
begin
        if length(st)<>length(p) then
                exit(false);
        for i:=1 to length(p) do
        begin
                if (st[i]<>p[i]) and (p[i]<>'?') then
                        exit(false);
        end;
        exit(true);
end;
begin
        assign(f,'DAIDIEN.inp');
        reset(f);
                readln(f,v);
                readln(f,p);
                if length(p)<>0 then
                        s:=v
                else
                begin
                for i:=length(v) downto 1 do
                begin
                        if v[i]=' ' then
                        begin
                                vitri:=i-1;
                                break;
                        end
                        else
                                p:=v[i]+p;
                end;
                for i:=1 to vitri do
                        s:=s+v[i];
                end;
        close(f);
        assign(f,'DAIDIEN.out');
        rewrite(f);
        st:='';
        for i:=1 to length(s) do
        begin
                if ((s[i] in ['a'..'z']) or (s[i] in ['A'..'Z'])) and (i<>length(s)) then
                        st:=st+s[i]
                else
                begin
                        if i=length(s) then
                                st:=st+s[i];
                        if length(st)<>0 then
                        begin
                                kt:=check(st);
                                if kt=true then
                                        inc(kq);
                        end;
                        st:='';
                end;
        end;
        writeln(f,kq);
        close(f);
end.
