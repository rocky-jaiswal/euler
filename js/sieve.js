const num = 100
const sqrt = Math.floor(Math.sqrt(num))

const input = Array(num - 1)
  .fill(null)
  .map((_e, i) => i + 2)
  .reduce((h, e) => {
    h[e] = true
    return h
  }, {})

const nonPrimes = Array(sqrt)
  .fill(null)
  .map((_e, i) => i + 2)
  .forEach((idx) => {
    if (input[`${idx}`]) {
      let cnt = 0
      while (true) {
        let n = Math.pow(idx, 2) + (idx * cnt)
        if (n <= num) {
          input[`${n}`] = false
        } else {
          break
        }
        cnt = cnt + 1
      }
    }
  })

console.log(Object.keys(input).filter((k) => input[k]))
