(ns euler.solns.two)

(defn fib [n]
  (loop [c n
         acc [1 2]]
    (if (or (= c 1) (= c 2))
      (last acc)
      (recur (- c 1) (conj acc (+ (nth acc (- (count acc) 1)) (nth acc (- (count acc) 2))))))))


(defn fibx []
  (loop [acc [1 2]]
    (if (< 4000000 (last acc))
      acc
      (recur (conj acc (+ (nth acc (- (count acc) 1)) (nth acc (- (count acc) 2))))))))

(defn solve []
  (reduce + (filter (fn [e] (even? e)) (fibx))))
