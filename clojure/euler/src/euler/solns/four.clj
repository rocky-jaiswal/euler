(ns euler.solns.four)

(def nums (range 1000))

(defn solve []
  (apply max (filter (fn[e] (= (Integer/toString e) (clojure.string/reverse (Integer/toString e)))) (for [x1 nums x2 nums] (* x1 x2)))))
