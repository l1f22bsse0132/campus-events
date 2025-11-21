let express= require("express");
let path=require("path")
let app= express();



app.use(express.static(path.join(__dirname,"dist")));

app.use((req,res)=>{

    res.sendFile(path.join(__dirname,"/dist/index.html"))
})

app.listen(3000,()=>{console.log("started listening at port 3000")});
