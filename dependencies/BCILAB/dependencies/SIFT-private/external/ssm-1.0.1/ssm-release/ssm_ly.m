function model = ssm_ly(y, m, N)

%SSM_LY Create SSMODEL object for leap-year component.
%   model = SSM_LY(y, m, N)
%       y is the starting year.
%       m is the starting month.
%       N is the total number of months.

% (c) 2006-2007 Jyh-Ying Peng �^����
% $Revision 1.0.0 $ $Generated: 2007/09/04 $

if nargin < 3, error('ssm:ssm_ly:NotEnoughInputs', 'Insufficient input arguments.'); end
if ~isscalar(y) || ~isnumeric(y), error('ssm:ssm_ly:InputError', 'y must be a scalar.'); end
if ~isscalar(m) || ~isnumeric(m), error('ssm:ssm_ly:InputError', 'm must be a scalar.'); end
if ~isscalar(N) || ~isnumeric(N), error('ssm:ssm_ly:InputError', 'N must be a scalar.'); end
[Y M]                   = ymarray(y, m, N);
[Z Zdmmask Zdvec T R]   = mat_reg(x_ly(Y, M), false);
model                   = [ssm_null ssmodel(struct('type', 'leap-year', 'y', y, 'm', m, 'N', N), 0, ssmat(Z, [], Zdmmask, Zdvec), T, R, [])];

