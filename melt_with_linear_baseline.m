function [f, p1_name, p2_name, variable_parameter_name ] = melt_with_linear_baseline( temperatures, Tm, delH );
p1_name = 'Tm';
p2_name = 'delta-H';
variable_parameter_name = 'temperature';
R = 0.001986; % kcal/mol/K

% convert celsius to K
K = exp( (delH/R) * (1/(Tm+273.15) - 1./(temperatures + 273.15)));

pred = 1.0 ./ (1.0 + K);
f = [pred; 1.0-pred];

f = [f; f.*repmat( temperatures, size(f,1), 1 )];