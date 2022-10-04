function vectorPlot(vec1,vec2)
% Takes two vectors and plots their values on a figure
maxX = max(vec1(1),vec2(1));
maxY = max(vec1(2),vec2(2));
quiver(0,0,vec1(1),vec1(2))
hold on
quiver(0,0,vec2(1),vec2(2))
title('My 2 Vectors')
xlabel('X-axis')
ylabel('Y-axis')
axis([0 (maxX*1.1) 0 (maxY*1.1)])
end