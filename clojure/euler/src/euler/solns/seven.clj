(ns euler.solns.seven)

(defn is-prime? [num]
  (not-any? (fn [e] (= 0 (rem num e))) (range 2 (- num 1))))

(defn solve []
  (last (take 10002 (filter is-prime? (iterate inc 1)))))
