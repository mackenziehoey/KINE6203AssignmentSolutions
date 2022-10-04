function validTri = triangleCheck(sides)
% Takes an array of 3 numbers and checks to see if they are valid triangle
% side lengths
longestSide = max(sides);
validTri = true;
if (sum(sides)-longestSide) <= longestSide
    validTri = false;
end
end