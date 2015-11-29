(ns euler.solns.five)

(def start (bigint 380))

(defn div-by-all? [num]
  (every? (fn [e] (= 0 (rem num e))) (range 2 20)))

(defn solve []
  (first (for [x (iterate inc 1)
               :let [y (* x start)]
               :when (div-by-all? y)]
           y)))
