"use strict";
exports.__esModule = true;
exports.t = exports.cht2 = void 0;
function cht2(n) {
    var sum = ((n * n) + n) / 2;
    for (var i = 0; i < n; i++) {
        var newSum = sum - i;
        var x = newSum / i;
        if (x === sum) {
        }
    }
    return [];
}
exports.cht2 = cht2;
function t(n, p) {
    var arr = [];
    for (var i = 1; i < n + 1; i++) {
        arr.push(i);
    }
    while (arr.length > 1) {
        var loser = arr.indexOf(p - 1 % n);
        arr.splice(loser, 1);
    }
}
exports.t = t;
