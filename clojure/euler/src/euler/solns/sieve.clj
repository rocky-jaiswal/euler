(ns euler.solns.sieve)

(def numx 2000000)

(defn num-hash []
  (apply assoc {}
         (interleave (range 2 (inc numx))
                     (take numx (repeat true)))))

(def all-nums
  (atom (num-hash)))

(defn switch-nums [coll]
  (let [new-hash (apply assoc {} (interleave coll (take (count coll) (repeat false))))]
    (swap! all-nums (fn [h] (merge h new-hash)))))

(defn build-change-set [num]
  (take-while (fn [e] (not (> e numx))) (map (fn [e] (+ (* num num) (* e num))) (range))))

(defn find-primes []
  (let [limit (.intValue (Double. (Math/ceil (Math/sqrt numx))))]
    (doseq [num (range 2 (inc limit))
            :when (get @all-nums num)]
      (switch-nums (build-change-set num))))
  (keys (filter (fn [h] (val h)) @all-nums)))
