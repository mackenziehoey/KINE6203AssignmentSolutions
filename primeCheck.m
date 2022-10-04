function primeAns = primeCheck(num)
% Takes a number and returns 'true' if prime or 'false' if not prime
primeValues = primes(num);
n = length(primeValues);
primeAns = false;
if primeValues(n) == num
    primeAns = true;
end
end