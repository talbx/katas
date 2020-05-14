var res = cht(10);
console.log("hello");
console.log(res);
function cht(n) {
    var result = [];
    var arr = [];
    for (var i = 0; i < n; i++) {
        arr.push(i);
    }
    var _loop_1 = function (i) {
        var _loop_2 = function (p) {
            abc = arr.filter(function (v) { return v !== i && v !== p; });
            sum = arr.reduce(function (pv, cv) { return pv + cv; }, 0);
            if (i * p === sum) {
                result.push({ a: i, b: p });
            }
        };
        for (var p = 0; p < n; p++) {
            _loop_2(p);
        }
    };
    var abc, sum;
    for (var i = 0; i < n; i++) {
        _loop_1(i);
    }
    return result;
}
