-- ~/.config/nvim/lua/snippets/cpp.lua

-- This is a more robust way to define snippets that avoids loading issues.
local ls = require("luasnip")

return {
  ls.s("cp", {
    ls.t({
      "//हर हर महादेव",
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "#define int long long",
      "#define anuragak021 ios::sync_with_stdio(false); cin.tie(NULL);",
      "", "/*", "    कर्मण्ये वाधिका रस्ते मा फलेषु कदाचन।", "    मा कर्म फल हेतु र्भूर्मा ते सङ्गोऽस्त्व कर्मणि॥", "", "    NO NEED TO CODE WITHOUT A COMPLETE ALGORITHM", "    THINK OF WHAT THE PROBLEM DEMANDS!!!", "*/", "", "void solve(){", "    ",
    }), ls.i(0), ls.t({ "", "}", "", "int32_t main(){", "    /*********************/ anuragak021 /*********************/", "    srand(time(NULL));", "", "    // freopen(\"input.txt\", \"r\", stdin);", "    // freopen(\"output.txt\", \"w\", stdout);", "", "    int t = 1;", "    cin >> t;", "    while(t--){", "        solve();", "    }", "    // cerr << \"Time : \" << 1000 * ((double)clock()) / (double)CLOCKS_PER_SEC << \"ms\";", "    return 0;", "}" })
  })
}
