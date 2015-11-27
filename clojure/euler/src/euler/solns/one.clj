(ns euler.solns.one)

(defn foo[e] (or (= 0 (rem e 3)) (= 0 (rem e 5)) ))

(defn solve []
  (reduce + (filter foo (range 1000))))
