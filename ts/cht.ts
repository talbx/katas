export class G964 {

    public static removeNb(n: number): number[][] {

        var result = [];
        var arr = [];
        var found = false;
        for(let i = 1; i < n+1; i++){
            arr.push(i);
        }
    
        for(let i = 1; i < n+1; i++){
            for(let p = 1; p < n+1; p++){
                var abc = arr.filter(v => v !== i && v !== p);
               // var sum = abc.reduce((pv, cv) => pv + cv, 0);
                var sum = ((n*n)+n)/2 - i -p;

                if(i * p === sum){
                    result.push([i,p]);
                    result.push([p,i]);
                    found = true;
                    break;
                }
            }
            if(found){
                break;
            }
        }
        console.timeEnd('removeNb')
        return result;
    }
  }

  var res = G964.removeNb(2000);
  console.log(res);