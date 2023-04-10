from math import gcd

def next_g_calc(a, x):
    return a % x

def main(a, b):
    ans = 0
    while a > 0 and b > 0:
        if a == 1 or b == 1 or a == b:
            ans += 1
            break

        g = gcd(a, b)
        if g > 1:
            a //= g
            b //= g
            a -= 1
            b -= 1
            ans += 1
        else:
            diff = abs(a - b)

            if diff == 1:
                ans += min(a, b)
                break

            skip_steps = 1000000000000
            for i in range(2, diff + 1):
                if diff % i == 0:
                    skip_steps = min(skip_steps, next_g_calc(a, i))
                    skip_steps = min(skip_steps, next_g_calc(a, diff // i))

                if i * i > diff:
                    skip_steps = min(skip_steps, next_g_calc(a, diff))
                    break

            ans += skip_steps
            a -= skip_steps
            b -= skip_steps

    return ans

# 入力を取得
a, b = map(int, input().split())

# 結果を出力
print(main(a, b))
