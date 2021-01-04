

export class G964 {

    public static phone = (strng: string, num: number) => {
        
        const newLocal = strng.split("<");
        const newLocal2 = strng.split(">");

        const allBeforeName = newLocal[0];
        const name = newLocal[1];
        const allAfterName = newLocal[1]
        console.log(allBeforeName, name, allAfterName);
    }
}

G964.phone("abcdef<Harry>potter",12);
