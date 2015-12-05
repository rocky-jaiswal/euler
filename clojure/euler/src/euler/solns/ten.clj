(ns euler.solns.ten
  (require [euler.solns.sieve :as sieve]))

(defn solve []
  (reduce + (sieve/find-primes)))
