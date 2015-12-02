(ns euler.solns.ten)

(def numx 2000000)

(defn init []
  (apply assoc {}
         (interleave (range 2 (inc numx))
                     (take numx (repeat true)))))

(def all-nums
  (atom (init)))

(defn switcharoo [coll]
  (let [new-m (apply assoc {} (interleave coll (take (count coll) (repeat false))))]
    ;;(println coll)
    (swap! all-nums (fn [m] (merge m new-m)))))

(defn for-change [x]
  ;;(println x)
  (switcharoo (take-while (fn [e] (not (> e numx))) (map (fn [e] (+ (* x x) (* e x))) (range)))))

(defn sieve []
  (let [limit (.intValue (Double. (Math/ceil (Math/sqrt numx))))]
    (doseq [x (range 2 (inc limit))
            :when (get @all-nums x)]
      (for-change x))))
