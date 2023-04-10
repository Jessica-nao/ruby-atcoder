#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

int main() {
    int n, k; cin >> n >> k;
    vector<ll> a(n);
    sort(a.begin(), a.end())
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }
    // for (int i = 0; i < n; i++) {
    //     cout << skip[i] << (i == n-1 ? "\n" : " ");
    // }
    // for (int i = 0; i < n; i++) {
    //     cout << a[i] << (i == n-1 ? "\n" : " ");
    // }
    vector<ll> x(k);



    for (int i = 1; i < n; i++) {
        x = a[i];
        for (ll i = 1; i <= k; i++) {
            ll y = x * i;
        }
    }

    cout << (*s.rbegin()) << endl;
    return 0;
}
