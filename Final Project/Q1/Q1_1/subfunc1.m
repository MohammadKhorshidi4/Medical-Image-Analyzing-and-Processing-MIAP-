function V = subfunc1(P)
if size(P,1)==0,
	V=[];
else,
	V(size(P,1),1) = struct('fname','', 'dim', [0 0 0 0], 'mat',eye(4), 'pinfo', [1 0 0]');
end;
for i=1:size(P,1),
	v = subfunc(P(i,:));
	if isempty(v),
		hread_error_message(P(i,:));
		error(['Can''t get volume information for ''' P(i,:) '''']);
	end;
	f = fieldnames(v);
	for j=1:size(f,1),
		eval(['V(i).' f{j} ' = v.' f{j} ';']);
		%V(i) = setfield(V(i),f{j},getfield(v,f{j}));
	end;
end;
return;