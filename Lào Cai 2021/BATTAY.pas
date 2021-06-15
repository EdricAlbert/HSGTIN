var     a,n:qword;
        f:text;
begin
        assign(f,'DIENTICH.inp');
        reset(f);
                readln(f,n);
        close(f);
        assign(f,'DIENTICH.out');
        rewrite(f);
        a:=(n*(n-1)) div 2;
        writeln(f,a);
        close(f);
end.