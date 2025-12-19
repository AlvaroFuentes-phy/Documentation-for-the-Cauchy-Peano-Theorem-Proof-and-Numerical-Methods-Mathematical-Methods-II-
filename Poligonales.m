clc; clear; close all;

% EDO
f = @(t,y) -2*y;   % y' = -2y
t0 = 0;
y0 = 1;
tf = 2;

% Pares divididos en dos gráficas
pairs = {
    [5 10];
    [15 25]
};

% Solución exacta
t_exact = linspace(t0, tf, 500);
y_exact = exp(-2 * t_exact);

for p = 1:2
    figure('Position',[250 250 700 450]); 
    hold on; grid on;

    % Graficar solución exacta
    plot(t_exact, y_exact, 'k', 'LineWidth', 2);

    pair = pairs{p};
    colors = lines(2);

    for i = 1:2
        n = pair(i);
        h = (tf - t0)/n;
        t = t0:h:tf;

        % Método de Euler
        y = zeros(1, n+1);
        y(1) = y0;
        for k = 1:n
            y(k+1) = y(k) + h*f(t(k), y(k));
        end

        % Graficar aproximación
        plot(t, y, 'o-', ...
            'Color', colors(i,:), ...
            'LineWidth', 1.6, ...
            'MarkerFaceColor', colors(i,:));
    end

    title(sprintf('Método de Euler – n = %d y n = %d', pair(1), pair(2)));
    xlabel('t');
    ylabel('y(t)');
    legend('Solución exacta', ...
           sprintf('Euler n=%d', pair(1)), ...
           sprintf('Euler n=%d', pair(2)), ...
           'Location','best');
end



