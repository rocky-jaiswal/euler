(ns euler.solns.ten)

(defn init [num]
  (apply assoc {}
         (interleave (range 2 (inc num))
                     (take num (repeat true)))))

(defn all-nums [num]
  (atom (init num)))

(defn switch [coll])

(defn for-change [x num]
  (remove (fn [e] (> e num)) (map (fn [e] (+ (* x x) (* e x))) (range 0 (inc num)))))


(defn sieve [num]
  (let [nums (all-nums num)
        limit (.intValue (Double. (Math/ceil (Math/sqrt num))))]
    (for [x (range 2 (inc limit))
          :when (get @nums x)]
      (for-change x num))))

(defn solve [num]
  (clojure.set/difference (set (keys @(all-nums num))) (set (sieve num))))
