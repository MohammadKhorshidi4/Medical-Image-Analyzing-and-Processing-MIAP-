function V = subfunc2(P)
try
    if iscell(P),
        V = cell(size(P));
        for j=1:prod(size(P)),
            if iscell(P{j}),
                V{j} = subfunc2(P{j});
            else,
                V{j} = subfunc1(P{j});
            end;
        end;
    else
        V = subfunc1(P);
    end;
catch
    warning('Possible disk swapping in spm_vol.m');
    if iscell(P)
        if P{1}(2)==':'
            for i=1:size(P(:),1)
                P{i}=P{i}(:,3:end);
            end
        end
    else
        if P(1,2)==':'
            P=P(:,3:end);
        end
    end
    if iscell(P),
        V = cell(size(P));
        for j=1:prod(size(P)),
            if iscell(P{j}),
                V{j} = subfunc2(P{j});
            else,
                V{j} = subfunc1(P{j});
            end;
        end;
    else
        V = subfunc1(P);
    end;

end

return;