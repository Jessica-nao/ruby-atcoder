#include <bits/stdc++.h>
using namespace std;

int main() {
    int n, m, k;
    cin >> n >> m >> k;
    vector<int> a(n), b(n), c(m), d(m);
    for (int i = 0; i < n; i++) cin >> a[i] >> b[i];
    for (int i = 0; i < m; i++) cin >> c[i] >> d[i];
    // k本以上が含まれる濃度 = ok で二分探索
    double ng = 0, ok = 1;
    for (int _ = 0; _ < 100; _++) {
        double x = (ng + ok) / 2;
        vector<double> takahashi_left_sugars(n);
        for (int i = 0; i < n; i++) {
            takahashi_left_sugars[i] = a[i] - (a[i] + b[i]) * x;
        }
        sort(begin(takahashi_left_sugars), end(takahashi_left_sugars));
        long long shorted_count = 0;
        for (int i = 0; i < m; i++) {
            double aoki_left_sugar = c[i] - (c[i] + d[i]) * x;
            shorted_count += n - (lower_bound(begin(takahashi_left_sugars), end(takahashi_left_sugars), -aoki_left_sugar) - begin(takahashi_left_sugars));
        }
        (shorted_count <= k ? ok : ng) = x;
        // cout << ok << ' ' << ng << endl;
    }
    cout << fixed << setprecision(16) << ok * 100 << endl;
}
