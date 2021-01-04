export function cht2(n: number): number[][] {
  var sum = (n * n + n) / 2;

  for (let i = 0; i < n; i++) {
    var newSum = sum - i;
    var x = newSum / i;
    if (x === sum) {
    }
  }

  return [];
}

export function t(n: number, initial: number) {
  const arr = [];
  for (var i = 1; i < n + 1; i++) {
    arr.push(i);
  }

  var p = initial;

  while (arr.length > 2) {
    console.log(arr);
    var loser = arr[(p % arr.length) - 1];
    console.log("LOSER: ", loser);
    arr.splice(loser, 1);
    console.log("NEW AT INDEX: ", arr.indexOf(loser));
    p = p + initial - 1;
  }

  // while(arr.length > 1){
  /**
        console.log('new round with arr',arr,'and p = ', p);
        arr.every()
        var loser =  arr.indexOf(p % n);
        console.log('The loser is',loser);
        arr.splice(loser,1);
        p = p+(initial);
        */
  //   }
}

console.log(un([1,1,1,1,1,2,3,3,4,5,5,5,5,1]));

export function un(nums: number[]){
  var x: number[] = nums.reduce(function(acc, el, i, arr) {
    if (arr.indexOf(el) !== i && acc.indexOf(el) < 0) acc.push(el); return acc;
  }, []);

  return nums.filter(elem => !x.includes(elem) === -1)
}

