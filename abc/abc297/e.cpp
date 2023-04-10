#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

int main() {
    int n, k; cin >> n >> k;
    vector<ll> a(n);
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }
    // for (int i = 0; i < n; i++) {
    //     cout << skip[i] << (i == n-1 ? "\n" : " ");
    // }
    // for (int i = 0; i < n; i++) {
    //     cout << a[i] << (i == n-1 ? "\n" : " ");
    // }
    set<ll> s;
    s.insert(0);

    queue<ll> q;
    for (int i = 0; i < n; i++) {
        q.push(a[i]);
    }
    while (!q.empty()) {
        auto add_q = q.front();
        q.pop();
        // cout << add_q << endl;
        for (auto x : s) {
            ll y = x + add_q;
            auto it = s.find(y);
            if (it == s.end()) {
                if ((int)s.size() == k+1) {
                    ll max_value = *s.rbegin();
                    if (y > max_value) {
                        continue;
                    } else {
                        s.erase(max_value);
                    }
                }
                q.push(y);
                s.insert(y);
            }
        }
    }
    cout << (*s.rbegin()) << endl;
    return 0;
}
