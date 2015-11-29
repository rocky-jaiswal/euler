(ns euler.solns.six)

(defn solve [num]
  (let [numx (+ 1 num)
        sum-of-squares (reduce + (map #(* % %) (range 1 numx)))
        square-of-sum (bigint (Math/pow (reduce + (range 1 numx)) 2))]
    (- square-of-sum sum-of-squares)))
