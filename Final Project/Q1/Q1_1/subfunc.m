function V = subfunc(p)
p = deblank(p);
[pth,nam,ext] = fileparts(deblank(p));
t = find(ext==',');

n = [];
if ~isempty(t),
	if length(t)==1,
		n1 = ext((t+1):end);
		if ~isempty(n1),
			n = str2num(n1);
			ext = ext(1:(t-1));
		end;
	end;
end;
p = fullfile(pth,[nam   ext]);

if strcmp(ext,'.img') & exist(fullfile(pth,[nam '.hdr'])) == 2,
	if isempty(n), V = spm_vol_ana(p);
	else,          V = spm_vol_ana(p,n); end;
	if ~isempty(V), return; end;
else, % Try other formats

	% Try MINC format
	if isempty(n), V=spm_vol_minc(p);
	else,          V=spm_vol_minc(p,n); end;
	if ~isempty(V), return; end;

	% Try Ecat 7
	if isempty(n), V=spm_vol_ecat7(p);
	else,          V=spm_vol_ecat7(p,n); end;
	if ~isempty(V), return; end;
end;
return;