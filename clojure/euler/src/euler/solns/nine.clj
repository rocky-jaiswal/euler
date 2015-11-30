(ns euler.solns.nine)

(defn solve []
  (first (for [x (range 1 1000)
               y (range 1 1000)
               z (range 1 1000)
               :when (= 1000 (+ x y z))
               :when (= (* z z) (+ (* x x) (* y y)))]
           [x y z])))
