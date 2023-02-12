const fs = require('fs')
fs.readFile('C:/Users/step9/OneDrive/Desktop/S08P12C101/iot/STT/test.txt', 'utf8', (err, data) => {
    if(err){
        console.error(err)
        return
    }
    const result_word = data.includes(`엄마ㅇ`);
    console.log(result_word);
})